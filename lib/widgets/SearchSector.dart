// import 'dart:async';
// // import 'dart:ffi';
// import 'package:chamber_of_commerce/pages/user/Company_detail_almanac.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:chamber_of_commerce/pages/user/Company_detail.dart';
// import 'package:chamber_of_commerce/widgets/SearchMoreIcon.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SearchSector extends StatefulWidget {
//   //  final bool filter;
//   String companyName;
//    SearchSector({Key? key,required this.companyName});

//   @override
//   State<SearchSector> createState() => _SearchSectorState();
// }

// class _SearchSectorState extends State<SearchSector> {
//   // final TextEditingController _searchController = TextEditingController();
//   Stream<List<dynamic>>? _searchResultsStream;
//    List<Map<dynamic, dynamic>> uniqueBusinesses = [];

//     int? _selectedValue = 1; // Initial selected value of filter option
//    List<dynamic> data = [];
//   bool _showListView = false;
//   bool showFilter = false;
//   final _history = <String>[]; // List to store search history
//   final _maxHistoryLength = 10; 
//   @override
//   void initState() {
//     super.initState();
//     Firebase.initializeApp();
//     searchAction();
//     // _searchController.addListener(_onSearchChanged);
//     _loadSearchHistory();
//   }

//   void searchAction() {
//     // if (_searchController.text.isEmpty) {
//     //   setState(() {
//     //     _searchResultsStream = null;
//     //     _showListView = false;
//     //     data = [];
//     //     uniqueBusinesses = [];
//     //   });
//     // } 
    
//   //  else{
//     // both
//     // if(_selectedValue == 1){
//       setState(() {
//           data = [];
//         uniqueBusinesses = [];
//         final searchText = _searchController.text.toUpperCase();
//         //  final searchPrefix = searchText.substring(0, 3).toUpperCase();
//       // _searchResultsStream = Stream.multi((_) {
//          final business_stream = FirebaseDatabase.instance
//             .ref('Query10')
            
//             .orderByChild('Account Name')
//             // .equalTo("business")
            
//              .startAt(searchText)
//             .endAt(searchText + '\uffff')
//             // .startAt(_searchController.text.toUpperCase())
//             // .endAt(_searchController.text.toLowerCase() + '\uffff')
//             .limitToFirst(15)
//             .onValue
//             .asBroadcastStream()
//             .map((event) => _mapSnapshotToCompanyList(event.snapshot));
//         // _showListView = true;

//         final almanactream = FirebaseDatabase.instance
//             .ref('Almanac')
            
//             .orderByChild('Account Name')
//             // .equalTo("almanac")
//              .startAt(searchText)
//             .endAt(searchText + '\uffff')
//             // .startAt(_searchController.text.toUpperCase())
//             // .endAt(_searchController.text.toLowerCase() + '\uffff')
//             .limitToFirst(15)
//             .onValue
//             .asBroadcastStream()
//             .map((event) => _mapSnapshotToCompanyList(event.snapshot));
//             // return [business_stream, almanac_stream];
//         // _showListView = true;
//       //  }); 
//       final streamList = [business_stream,almanactream];
//       _searchResultsStream =mergeStreamList(streamList); 
//         _showListView = true;
//       });
//     // }
//     //Business directory
   
    
//     }
//   }
//   Stream<T> mergeStreamList<T>(List<Stream<T>> streams) {
//   // Create a new stream controller
//   final controller = StreamController<T>();

//   // Listen to each stream in the list
//   for (final stream in streams) {
//     stream.listen(controller.add);
//   }

//   // Return the stream from the controller
//   return controller.stream;
// }



 
//   List<dynamic> _mapSnapshotToCompanyList(DataSnapshot snapshot) {
//     // Handle both Map and List data structures
//     if (snapshot.value is Map) {
//       final Map<dynamic, dynamic> entries = Map.from(snapshot.value as Map);
//       final List<dynamic> companies = [];
//       entries.forEach((key, value) {
//         companies.add(value);
//       });
//       return companies;
//     } else if (snapshot.value is List) {
//       return snapshot.value as List<dynamic>; // Assuming each item in the list represents a company
//     } else {
//       print('Unexpected data type received: ${snapshot.value}');
//       return []; // Empty list if unexpected data type
//     }
//   }

//   @override
 

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         //  if (_history.isNotEmpty) _buildSearchHistory(),
        
//         _buildSearchTextField(),
      
//       //  if(showFilter)
//         Stack(
//            children: [
//              Container(
//               height: 130,
//               // child: Text('background'),
//              ),
          
//           Positioned(
//             // Adjust positioning properties (bottom, right, etc.)
//             top: 0.0,
//             right: 0.0,
//             child: Padding(
//               padding: const EdgeInsets.only(right: 20.0),
//               child: Container(
//                 height: 200.0,
//                 width: 150.0,
//                 // color: Colors.blue,
//                 child:   _buildFilter(),
//               ),
//             ),
//           ),
//       ]),   //   if(showFilter) _buildFilter(),
//     //  if (_showListView)
//              _buildSearchResults(),
//         // if (_showListView) _buildSearchResults(),
       
//       // ],
//    ] );
//   }

//   // ... remaining widget build methods (unchanged)


//   Widget _buildListView(List<dynamic> companies) {
//     if (companies.isEmpty) {
//       return Center(child: Text('No companies found.'));
//     }
//     return ListView.builder(
      
//       itemCount: companies.length,
//       itemBuilder: (context, index) {

//         final company = companies[index];
//     print(companies);

//         final name = company['Account Name'];

//         return ListTile(
//           title: Text(name),
//           onTap: () {
//             if(company['Category']=="business"){
//   Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CompanyDetail(data: company),
//               ),
//             );
//             }
//             else{
//                Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CompanyDetailAlmanac(data: company),
//               ),
//             );
//             }
          
//           },
//         );
//       },
//     );
//   }

 


  
