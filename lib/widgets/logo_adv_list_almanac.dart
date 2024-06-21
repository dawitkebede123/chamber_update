import 'package:chamber_of_commerce/pages/user/Company%20_business.dart';
import 'package:chamber_of_commerce/pages/user/Company.dart';
import 'package:chamber_of_commerce/widgets/CompanyDescription.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo_Adv_List_almanac extends StatefulWidget {
  final int index;

  const Logo_Adv_List_almanac({super.key, required this.index});

  @override
  State<Logo_Adv_List_almanac> createState() => _Logo_Adv_List_almanacState();
}

class _Logo_Adv_List_almanacState extends State<Logo_Adv_List_almanac> {
  List<dynamic> filteredBusinesses = [];
  List<Map<dynamic, dynamic>> uniqueBusinesses = [];
   List<dynamic> data = [];
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = '';
      });

      // Replace with your actual data fetching logic (using Firebase or other source)
      final ref = FirebaseDatabase.instance.ref('Almanac').once();
      final snapshot = await ref;
       data = snapshot.snapshot.value as List<dynamic>;
      //  print(snapshot.snapshot.value);
      //  print(data);
       data = data.where((element) => element['main_adv']== 'True').toList();
      // Define a map for filtering logic by index
      filteredBusinesses = data;

      // print(widget.index);
    

   //avoiding duplicated adv from the list based on Account Name column
    // Set<dynamic> uniqueBusinesses = filteredBusinesses.toSet();
  //  filteredBusinesses = uniqueBusinesses.toList();

Set<String> seenKeys = {}; // Set to store unique combinations of relevant keys

for (final element in filteredBusinesses) {
  // Define the key(s) to compare for uniqueness (e.g., "name" and "age")
  final keyCombination = "${element["Account Name"]}"; 

  if (!seenKeys.contains(keyCombination)) {
    seenKeys.add(keyCombination);
    uniqueBusinesses.add(element);
  }
}
      setState(() {
        isLoading = false;
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error: ${e.message}';
      });
      print('Error fetching data: ${e.code} - ${e.message}');
    } catch (e) {
      // Handle other potential errors
      setState(() {
        isLoading = false;
        errorMessage = 'An error occurred.';
      });
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            const CircularProgressIndicator(),
          if (errorMessage.isNotEmpty)
            Text(errorMessage),
          if (!isLoading && errorMessage.isEmpty)
            _buildGridView(),
        ],
      ),
    );
  }

  Widget _buildGridView() {
  return SizedBox(
    height:200,
    child: GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Change to adjust the number of columns
        crossAxisSpacing: 10.0, // Spacing between columns
        mainAxisSpacing: 20.0, // Spacing between rows
        childAspectRatio: 1.2, // Adjust aspect ratio for desired layout
      ),
      itemCount: uniqueBusinesses.length,
      itemBuilder: (context, index) {
        final Map<dynamic, dynamic> businessData = uniqueBusinesses[index];
        final String icon = businessData['logo'].toString();
        Future<String> imageUrlFuture = storeImageInFirebase(icon);
        final String name = businessData["Account Name"].toString();

        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CompanyDescription(detail: businessData)),
          ),
          child: Column(
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(
                  //   color: Color.fromARGB(255, 229, 234, 232),
                  // ),
                  // ... other decoration for the container
                ),
                child: FutureBuilder<String>(
                  future: imageUrlFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Image.network(snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text('');
                      // CircularProgressIndicator();
                    }
                  },
                ),
              ),
              // SizedBox(width: 20.0),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

  Future<String> storeImageInFirebase(String fileName) async {
    try {
      final storage = FirebaseStorage.instance.ref();
      final images = storage.child('logo');
      final imageRef = images.child(fileName);

      final networkImageUrl = await imageRef.getDownloadURL();
      // print(networkImageUrl);
      return networkImageUrl;
    } on FirebaseException catch (e) {
      // Handle potential errors
      print('Error storing image: ${e.code} - ${e.message}');
      return ''; // Or throw an exception for further handling
    }
  }
}

