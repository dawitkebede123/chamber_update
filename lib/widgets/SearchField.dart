import 'dart:async';
// import 'dart:ffi';
import 'package:chamber_of_commerce/pages/user/Company_detail_almanac.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:chamber_of_commerce/pages/user/Company_detail.dart';
import 'package:chamber_of_commerce/widgets/SearchMoreIcon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchField extends StatefulWidget {
  //  final bool filter;
  const SearchField({Key? key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _searchController = TextEditingController();
  Stream<List<dynamic>>? _searchResultsStream;
   List<Map<dynamic, dynamic>> uniqueBusinesses = [];

    int? _selectedValue = 1; // Initial selected value of filter option
   List<dynamic> data = [];
  bool _showListView = false;
  bool showFilter = false;
  final _history = <String>[]; // List to store search history
  final _maxHistoryLength = 10; 
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    _searchController.addListener(_onSearchChanged);
    _loadSearchHistory();
  }

  void _onSearchChanged() {
    if (_searchController.text.isEmpty) {
      setState(() {
        _searchResultsStream = null;
        _showListView = false;
        data = [];
        uniqueBusinesses = [];
      });
    } 
    
   else{
    // both
    if(_selectedValue == 1){
      setState(() {
          data = [];
        uniqueBusinesses = [];
        final searchText = _searchController.text.toUpperCase();
      // _searchResultsStream = Stream.multi((_) {
         final business_stream = FirebaseDatabase.instance
            .ref('Query10')
            
            .orderByChild('Account Name')
            // .equalTo("business")
             .startAt(searchText)
            .endAt(searchText + '\uffff')
            // .startAt(_searchController.text.toUpperCase())
            // .endAt(_searchController.text.toLowerCase() + '\uffff')
            .limitToFirst(15)
            .onValue
            .asBroadcastStream()
            .map((event) => _mapSnapshotToCompanyList(event.snapshot));
        // _showListView = true;

        final almanactream = FirebaseDatabase.instance
            .ref('Almanac')
            
            .orderByChild('Account Name')
            // .equalTo("almanac")
             .startAt(searchText)
            .endAt(searchText + '\uffff')
            // .startAt(_searchController.text.toUpperCase())
            // .endAt(_searchController.text.toLowerCase() + '\uffff')
            .limitToFirst(15)
            .onValue
            .asBroadcastStream()
            .map((event) => _mapSnapshotToCompanyList(event.snapshot));
            // return [business_stream, almanac_stream];
        // _showListView = true;
      //  }); 
      final streamList = [business_stream,almanactream];
      _searchResultsStream =mergeStreamList(streamList); 
        _showListView = true;
      });
    }
    //Business directory
    if(_selectedValue == 2) {
      setState(() {
          data = [];
        uniqueBusinesses = [];
        final searchText = _searchController.text.toUpperCase();
        _searchResultsStream = FirebaseDatabase.instance
            .ref('Query10')
            
            .orderByChild('Account Name')

             .startAt(searchText)
            .endAt(searchText + '\uffff')
            // .startAt(_searchController.text.toUpperCase())
            // .endAt(_searchController.text.toLowerCase() + '\uffff')
            .limitToFirst(5)
            .onValue
            .asBroadcastStream()
            .map((event) => _mapSnapshotToCompanyList(event.snapshot));
        _showListView = true;
      });
    }
    // almanac directory
if(_selectedValue == 3){
   setState(() {
          data = [];
        uniqueBusinesses = [];
        final searchText = _searchController.text.toUpperCase();
        _searchResultsStream = FirebaseDatabase.instance
            .ref('Almanac')
            
            .orderByChild('Account Name')
            // .equalTo("almanac")
             .startAt(searchText)
            .endAt(searchText + '\uffff')
            // .startAt(_searchController.text.toUpperCase())
            // .endAt(_searchController.text.toLowerCase() + '\uffff')
            .limitToFirst(5)
            .onValue
            .asBroadcastStream()
            .map((event) => _mapSnapshotToCompanyList(event.snapshot));
        _showListView = true;
      });
    }
    
    }
  }
  Stream<T> mergeStreamList<T>(List<Stream<T>> streams) {
  // Create a new stream controller
  final controller = StreamController<T>();

  // Listen to each stream in the list
  for (final stream in streams) {
    stream.listen(controller.add);
  }

  // Return the stream from the controller
  return controller.stream;
}
void _onFilterClicked(){
  if(showFilter==false){
 setState(() {
    showFilter = true;
    uniqueBusinesses = [];
  });
  }
  else{
     setState(() {
    showFilter = false;
     uniqueBusinesses = [];
  });
  }
 
}
void _updateSearchHistory(String term) async {
    _history.remove(term); // Remove duplicate entries
    _history.insert(0, term); // Add term to the beginning of the list
    _history.takeWhile((t) => t.isNotEmpty); // Remove empty entries
    _history.sublist(0, 5); // Limit history length

    await _saveSearchHistory();
  }

  Future<void> _loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('search_history') ?? [];
    setState(() {
      _history.addAll(history);
    });
  }

  Future<void> _saveSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('search_history', _history);
  }

  List<dynamic> _mapSnapshotToCompanyList(DataSnapshot snapshot) {
    // Handle both Map and List data structures
    if (snapshot.value is Map) {
      final Map<dynamic, dynamic> entries = Map.from(snapshot.value as Map);
      final List<dynamic> companies = [];
      entries.forEach((key, value) {
        companies.add(value);
      });
      return companies;
    } else if (snapshot.value is List) {
      return snapshot.value as List<dynamic>; // Assuming each item in the list represents a company
    } else {
      print('Unexpected data type received: ${snapshot.value}');
      return []; // Empty list if unexpected data type
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    // data.dispose();
    _saveSearchHistory();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  if (_history.isNotEmpty) _buildSearchHistory(),
        
        _buildSearchTextField(),
      
       if(showFilter)
        Stack(
           children: [
             Container(
              height: 130,
              // child: Text('background'),
             ),
          
          Positioned(
            // Adjust positioning properties (bottom, right, etc.)
            top: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                height: 200.0,
                width: 150.0,
                // color: Colors.blue,
                child:   _buildFilter(),
              ),
            ),
          ),
      ]),   //   if(showFilter) _buildFilter(),
     if (_showListView)
             _buildSearchResults(),
        // if (_showListView) _buildSearchResults(),
       
      ],
    );
  }

  // ... remaining widget build methods (unchanged)

Widget _buildSearchHistory() {
    return ListView.builder(
      shrinkWrap: true, // Avoid unnecessary scrolling
      itemCount: _history.length,
      itemBuilder: (context, index) {
        final term = _history[index];
        return ListTile(
          title: Text(term),
          onTap: () {
            _searchController.text = term;
            _onSearchChanged(); // Trigger search on tap
          },
        );
        });
        }

  Widget _buildSearchTextField() {
    return  Container(
      height: 48,
      child: TextField(
        maxLines: 1,
        controller: _searchController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20.0,right: 20),
          filled: true,
          fillColor: Color.fromARGB(255, 229, 234, 232),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          // contentPadding: EdgeInsets.all(1),
          hintText: 'Search companies',
          suffixIcon: _buildSuffixIcon()
        ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return Container(
      width: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.search),
          IconButton(icon:Icon(Icons.arrow_drop_down),
          onPressed: (){
            _onFilterClicked();
          } ,),
          
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return StreamBuilder<List<dynamic>>(
      stream: _searchResultsStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
          // print(snapshot.data);
          data = snapshot.data?? [];
          Set<String> seenKeys = {}; // Set to store unique combinations of relevant keys

for (final element in data) {
  // Define the key(s) to compare for uniqueness (e.g., "name" and "age")
  final keyCombination = "${element["Account Name"]}"; 

  if (!seenKeys.contains(keyCombination)) {
    seenKeys.add(keyCombination);
    uniqueBusinesses.add(element);
  }
}
        return Container(
          height: 200.0,
          // width: 200,
          child: _buildListView(uniqueBusinesses),
        );
      },
    );
  }

  Widget _buildListView(List<dynamic> companies) {
    if (companies.isEmpty) {
      return Center(child: Text('No companies found.'));
    }
    return ListView.builder(
      
      itemCount: companies.length,
      itemBuilder: (context, index) {

        final company = companies[index];
    print(companies);

        final name = company['Account Name'];

        return ListTile(
          title: Text(name),
          onTap: () {
            if(company['Category']=="business"){
  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompanyDetail(data: company),
              ),
            );
            }
            else{
               Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompanyDetailAlmanac(data: company),
              ),
            );
            }
          
          },
        );
      },
    );
  }

  Widget _buildFilter(){
     
   
     return Container(
          width: 100,
        child:  Column(children: [

Column(
  children: [
    Row(children: [
Radio<int>(
      value: 1,
      groupValue: _selectedValue,
      onChanged: (value) => setState((){
       _selectedValue = value;
       uniqueBusinesses = [];
        _searchController.clear();
      } ),
    ),
    Text('Both'),
    ],),
    Row(children: [
Radio<int>(
      value: 2,
      groupValue: _selectedValue,
      onChanged: (value) => setState((){
       _selectedValue = value;
       uniqueBusinesses = [];
        _searchController.clear();
      } ),
    ),
    Text('Business'),
    ],),
    
    Row(
      children: [
      Radio<int>(
      value: 3,
      groupValue: _selectedValue,
      onChanged: (value) => setState((){
       _selectedValue = value;
       uniqueBusinesses = [];
        _searchController.clear();
      } ),
    ),
    Text('Almanac'),
      ],
    )    
   
  ],
),


        ],)
     );
  }

 
}
