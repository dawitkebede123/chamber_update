// import 'dart:js';

import 'package:chamber_of_commerce/Models/favorite_Item.dart';
import 'package:chamber_of_commerce/pages/user/Almanac.dart';
import 'package:chamber_of_commerce/pages/user/Almanac_Options/Bank_Options.dart';
import 'package:chamber_of_commerce/pages/user/Almanac_Options/SavingAndCredit.dart';
import 'package:chamber_of_commerce/pages/user/Almanac_Options/Fintech_Options.dart';
import 'package:chamber_of_commerce/pages/user/Almanac_Options/Insurance_Options.dart';
import 'package:chamber_of_commerce/pages/user/Almanac_Options/MicroFinance_Options.dart';
import 'package:chamber_of_commerce/pages/user/Almanac_Options/Capital_Goods_Options.dart';
import 'package:chamber_of_commerce/theme/MyFavoritesProvider.dart';
import 'package:chamber_of_commerce/widgets/ContactTemplete.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chamber_of_commerce/pages/user/Home.dart';
import 'package:chamber_of_commerce/widgets/BottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/CustomBottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chamber_of_commerce/widgets/VideoPlayer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';


class CompanyDescription extends StatefulWidget {
  final Map<dynamic, dynamic> detail;
  CompanyDescription({super.key,required this.detail});

  @override
  State<CompanyDescription> createState() => _CompanyDescriptionState();
}

class _CompanyDescriptionState extends State<CompanyDescription> {

  
   Future<String> storeImageInFirebase(String fileName) async {
  try {
    final storage  = FirebaseStorage.instance.ref();
       final images = storage.child('image');
       final imageRef = images.child(fileName);
       	



       final networkImageUrl = await imageRef.getDownloadURL();
      //  print(networkImageUrl);
    return networkImageUrl;
  } on FirebaseException catch (e) {
    // Handle potential errors
    print('Error storing image: ${e.code} - ${e.message}');
    return ''; // Or throw an exception for further handling
  }
}  

 Future<String> storeLogoInFirebase(String fileName) async {
  try {
    final storage  = FirebaseStorage.instance.ref();
       final images = storage.child('logo');
       final imageRef = images.child(fileName);
       	



       final networkImageUrl = await imageRef.getDownloadURL();
      //  print(networkImageUrl);
    return networkImageUrl;
  } on FirebaseException catch (e) {
    // Handle potential errors
    print('Error storing image: ${e.code} - ${e.message}');
    return ''; // Or throw an exception for further handling
  }
}  

 Future<String> storeVideoInFirebase(String fileName) async {
  try {
    final storage  = FirebaseStorage.instance.ref();
       final video = storage.child('video');
       final videoRef = video.child(fileName);
       	



       final networkVideoUrl = await videoRef.getDownloadURL();
      //  print(networkImageUrl);
    return networkVideoUrl;
  } on FirebaseException catch (e) {
    // Handle potential errors
    print('Error storing image: ${e.code} - ${e.message}');
    return ''; // Or throw an exception for further handling
  }
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
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
  Future<void> checkFavorite( String? targetValue) async {
  final newFavoritesBox = Provider.of<Box<FavoriteItem>>(context);
  // var box = await Hive.openBox(boxName);
    //  final _favoritesBox = Hive.box('newFavorites');

  // await _favoritesBox.(() async {
    for (var key in newFavoritesBox.keys) {
      if (newFavoritesBox.get(key)!.name == targetValue) {
        // await newFavoritesBox.delete(key);
        isFavorite = true;
      }
    }
  // }
  // );
}
Future<void> addByValue( String? targetValue) async {
   final newFavoritesBox = Provider.of<Box<FavoriteItem>>(context);
  // var box = await Hive.openBox(boxName);
    //  final _favoritesBox = Hive.box('newFavorites');

  // await _favoritesBox.(() async {
    for (var key in newFavoritesBox.keys) {
      if (newFavoritesBox.get(key)!.name == targetValue) {
        await newFavoritesBox.add(key);
      }
    }
  // }
  // );
}
Future<void> deleteByValue( String? targetValue) async {
   final newFavoritesBox = Provider.of<Box<FavoriteItem>>(context);
  // var box = await Hive.openBox(boxName);
    //  final _favoritesBox = Hive.box('newFavorites');

  // await _favoritesBox.(() async {
    for (var key in newFavoritesBox.keys) {
      if (newFavoritesBox.get(key)!.name == targetValue) {
        await newFavoritesBox.delete(key);
      }
    }
  // }
  // );
}

     List<dynamic> data = [];
     List<Map<dynamic, dynamic>> uniqueData = [];
     final newFavoritesBox = Provider.of<Box<FavoriteItem>>(context);
    //  final provider = Provider.of<FavoriteListProvider>(context);

    // String sector = widget.detail["sector"].toString();
    String  name =widget.detail['Account Name'].toString();
    String logo = widget.detail["logo"].toString();
    // String  profile = '';
    String image = widget.detail["Image"].toString();
    // print('test');
    // print(image);
    String video = widget.detail["Video"];
    String tel = widget.detail["Tel"].toString();
    String mobile = widget.detail["Mobile"].toString();
    String email = widget.detail["Email"].toString();
    String profile = widget.detail["Profile"].toString();
    final website = widget.detail["Website"];
    // final sector = widget.detail["Sector"];
    // final sub_sector = widget.detail["Sub-Sector"];
    // final sub_sector = widget.detail["Sub-Sector"];
    final category = widget.detail["Category"];
    final storage = widget.detail["storage"];
    final arg= FavoriteItem(  name: name,logo: logo,profile: profile,image: image, video: video,tel: tel,email: email,website: website,category: category,storage: storage);
    // String fax = widget.detail["fax"].toString();
     Future<String> imageUrlFuture = storeImageInFirebase(image);
     Future<String> imageUrlFutureGif = storeVideoInFirebase(video);
     Future<String> logoUrlFuture = storeLogoInFirebase(logo);
    Future<String> videoUrlFuture = storeVideoInFirebase(video);

    //get the multiple sector and sub sector
    final data_stream = FirebaseDatabase.instance
            .ref('Query10')
            
            .orderByChild('Account Name')
            // .equalTo("business")
            
             .startAt(name)
            .endAt(name + '\uffff')
            // .startAt(_searchController.text.toUpperCase())
            // .endAt(_searchController.text.toLowerCase() + '\uffff')
            .limitToFirst(15)
            .onValue
            .asBroadcastStream()
            .map((event) => _mapSnapshotToCompanyList(event.snapshot));
    var scaffold = Scaffold(
    //   appBar: AppBar(
    //           backgroundColor: Theme.of(context).colorScheme.background,
    //           leading: IconButton(
    //       color: Theme.of(context).colorScheme.primary,
    //       icon: const Icon(Icons.arrow_back),
    //       onPressed:()=>{
    //      Navigator.pop(context)
    //         }
    //       ),
      
    //     // padding: const EdgeInsets.all(16.0), // Add padding on all sides
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(50.0), // Set border radius
    // ),
       
    //     title:Text(
    //       name,
    //       style: TextStyle(
    //        color: Theme.of(context).colorScheme.primary,
    //        fontWeight: FontWeight.bold,
    //        fontSize: 18,
    //       ),
    //     ),
    //    //should be replace by botton
    //      actions: [
    //       Padding(padding: EdgeInsets.only(right: 20),
    //      child:  SvgPicture.asset('assets/images/chamber_icon.svg')
    //       ,),
         
    // ],
    //     elevation: 0.0,//remove shadow
    //     centerTitle: true,
    //   ),
      
       





      body:
      // ValueListenableBuilder(
      //   valueListenable: Hive.box('newFavorites').listenable(),
      //    builder:(context,box,child){
            //  final isFavorite = provider.isFavorite(name);
        ListView(
         children: [ 
           Padding(
             padding: const EdgeInsets.only(left: 20.0,right: 20,top: 4),
             child: Container(
              width: MediaQuery.of(context).size.width*0.8,
               alignment: Alignment.center,
                 height: 126,
                           //             padding: EdgeInsets.only(
                           //  left: MediaQuery.of(context).size.width * 0.01,
                           //                //  right: MediaQuery.of(context).size.width * 0.1, // 10% of screen width
                           //  top: MediaQuery.of(context).size.height * 0.05,
                           //   // 5% of screen height 
                           //      ),
               decoration: BoxDecoration(
                          border: Border.all(
             color: Color.fromARGB(255,229,234,232), // Set border color
             width: 1.0,
                          ),
             borderRadius:BorderRadius.circular(20), // Set border width
                      
                        ),  
                       child: Padding(
                         padding: const EdgeInsets.only(top: 4.0),
                         child: Column(
                           children: [
                                 Container(
                                    width:MediaQuery.of(context).size.width * 0.20,
                                  child: FutureBuilder<String>(
                                     future: logoUrlFuture,
                                     builder: (context, snapshot) {
                                       if (snapshot.hasData) {
                                         return Image.network(snapshot.data!); 
                                        // return Image.asset(logo);
                                         // print("test");// Use the downloaded URL
                                       } else if (snapshot.hasError) {
                                         return Text('Error: ${snapshot.error}'); // Handle errors
                                       }
                                 
                                       // Display a loading indicator while waiting
                                       return CircularProgressIndicator();
                                     },
                                   ),
                                 
                                 ),
                             Text(name,
                style: const TextStyle(
                      fontSize: 16, // Increase font size for heading-like appearance
                      fontWeight: FontWeight.bold, // Make the text bold
                  ),)
                           ],
                         ),
                       )
                         
                       
            
                        ),
           ),
          // Container(
          // child:Text("Almanac / Bank / Awash Bank ")
        
          // ),
          Row(children: [
              Spacer(),
              IconButton(onPressed: () async{
                newFavoritesBox.add(arg);
                ScaffoldMessenger.of(context).clearSnackBars();
                // if(isFavorite){
                //   //  Provider.of<ThemeProvider>(context,listen: false).toggleTheme(),
                //  provider.removeFromFavorites(arg);
                //   // provider.removeFromFavorites
                //   // box.delete(name);
        
                //  const snackBar = SnackBar(content: Text('Remove successfully'),
                // backgroundColor: Colors.blue,
        
                // );
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  
                // }
                // else{
                // provider.addToFavorites(arg);
        
                // await box.put(name,video);
                const snackBar = SnackBar(content: Text('added successfully'),
                backgroundColor: Colors.red,
                
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // }
               
              },
              
               icon:  const Icon(
               Icons.favorite_border,
               color: Colors.red,))
            ],),
          SizedBox(height: 20,),
          if(video!="")
           Container(
          height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Center(
        child: Stack( // Use a Stack to conditionally display content
          children: [
            // FutureBuilder<String>(
            //   future: imageUrlFutureGif,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData && snapshot.data!.toLowerCase().endsWith('.gif')) {
            //       // Display GIF image
            //       print('gif');
            //       return Image.network(snapshot.data!);
            //     } else {
            //       return Container(); // Placeholder for non-GIF content
            //     }
            //   },
            // ),
            FutureBuilder<String>(
              future: videoUrlFuture,
              builder: (context, snapshot) {
                // print(snapshot.data);
                // print(getVideoType(snapshot.data!));
                String? videoType;
                Future<String?> type = getVideoType(snapshot.data!);
                type.then((value) => videoType = value);
          
                if (snapshot.hasData && videoType=='mp4') {
                  // Display video
                  return VideoPlayerWidget(videoUrl: snapshot.data!);
                } else {
                  return  Container(
              //  width:MediaQuery.of(context).size.width * 0.20,
             child: FutureBuilder<String>(
            future: imageUrlFutureGif,
            builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Image.network(snapshot.data!); 
          // print("test");// Use the downloaded URL
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Handle errors
        }
        
        // Display a loading indicator while waiting
        return const CircularProgressIndicator();
            },
          ),
        
            );
                  
                  // VideoPlayerGif(gifUrl: snapshot.data!);
                  // Container(); // Placeholder for non-video content
                };
              },
            ),
          ],
        ),
            ),
          ),
        ),
        
        
          if(image!='')
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 16),
            child:  Container(
              //  width:MediaQuery.of(context).size.width * 0.20,
             child: FutureBuilder<String>(
            future: imageUrlFuture,
            builder: (context, snapshot) {
        if (snapshot.hasData) {
          return InteractiveViewer(child: Image.asset('assets/images/business_adv/$image')); 
          // print("test");// Use the downloaded URL
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Handle errors
        }
        
        // Display a loading indicator while waiting
        return CircularProgressIndicator();
            },
          ),
        
            ),
          ),
           Padding(padding: EdgeInsets.only(left: 20,right: 20),
          child: StreamBuilder<List<dynamic>>(
      stream: data_stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
          // print(snapshot.data);
          data = snapshot.data?? [];
          // Set<String> seenKeys = {}; // Set to store unique combinations of relevant keys

// for (final element in data) {
//   // Define the key(s) to compare for uniqueness (e.g., "name" and "age")
//   final keyCombination = "${element["Account Name"]}"; 

//   if (!seenKeys.contains(keyCombination)) {
//     seenKeys.add(keyCombination);
//     uniqueData.add(element);
//   }
// }
        return Container(
          height: 200.0,
          // width: 200,
          child: ListView.builder(
      
      itemCount: data.length,
      itemBuilder: (context, index) {

        final company = data[index];
        int position = index +1;
    // print(company['Sector $position']);
    //  print(company['Sub-Sector $position']);

        final sector = company['Sector'];
        final sub_sector = company["Sub-Sector"];

        return Column(
          children: [
            Text("Sector",style: TextStyle(fontWeight: FontWeight.bold),),
            Text(" $sector"),
            Text("Sub sector",style:TextStyle(fontWeight: FontWeight.bold)),
            Text(" $sub_sector"),
          ],
        );
      },
    ),
        );
      },
    ),
          ),
         SizedBox(height: 20,),
          if(profile !="")
           Container(
                      width: 200,
        
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 24),
                        child: Container(child: Text(profile,textAlign: TextAlign.justify,style: TextStyle(fontSize: 14))),
             )
             ),
           ContactTemeplete(tel: tel,mobile: mobile,website:website,email: email,)        
          //  if(tel !="")
          //                Padding(
          //                  padding: const EdgeInsets.only(left: 20.0,right: 20),
          //                  child: 
          //                  Row(
          //                    children: [
          //                      InkWell( // Wrap the content in an InkWell
          //                                     onTap: () {
          //                                       launch('tel:$tel'); // Launch the phone dialer with the number
          //                                     },
          //                     child: Row(
          //                        children: [
          //                           Container(
          //                            // width: 20,
          //                            // height: 20,
          //                            decoration: BoxDecoration(
                           
          //                      color: Color.fromARGB(255, 255, 255, 255),
                                              
          //                                     borderRadius:BorderRadius.circular(999), // Set border width
                                              
          //                                       ),
          //                            child: SvgPicture.asset('assets/images/vector1.svg',width: 10,height: 10,)),
          //                          SizedBox(width: 10,),
          //                          Text(tel,softWrap: true,overflow: TextOverflow.ellipsis,),
          //                        ],
          //                      ),),
          //                    ],
          //                  ),
          //                ),
          //                const SizedBox(height: 5,),
                        
          //                 if(website !=null)
          //                Padding(
          //                  padding: const EdgeInsets.only(left: 20.0,right: 20),
          //                  child: Row(
          //                  children: [
          //                   InkWell( // Wrap the content in an InkWell
          //                      onTap: () {
          //                        // ignore: deprecated_member_use
          //                        launch(website); // Launch the URL in a web browser
          //                                     },
          //                    child:Row(
          //                    children: [
          //                       Container(
          //                        // width: 20,
          //                        // height: 20,
          //                        decoration: BoxDecoration(
                           
          //                      color: Color.fromARGB(255, 255, 255, 255),
                                              
          //                                     borderRadius:BorderRadius.circular(999), // Set border width
                                              
          //                                       ),
          //                        child: SvgPicture.asset('assets/images/vector.svg',width: 10,height: 10,)),
          //                      SizedBox(width: 10,),
          //                      Text(website,softWrap: true,overflow: TextOverflow.ellipsis,),
          //                    ],
          //                  )),],),
          //                ),
          //                 SizedBox(height: 5,),
                        
                         
          //                  if(email !="")
                        
          //                Padding(
          //                  padding: const EdgeInsets.only(left: 20.0,right: 20),
          //                  child: Row(
          //                                       children: [
          //                  InkWell( // Wrap the content in an InkWell
          //                                     onTap: () {
          //                                       launch('mailto:$email'); // Launch email app with recipient
          //                                     },
          //                                     child: Row(
          //                    children: [
          //                       Container(
          //                        // width: 20,
          //                        // height: 20,
          //                        decoration: BoxDecoration(
                           
          //                      color: Color.fromARGB(255, 255, 255, 255),
                                              
          //                                     borderRadius:BorderRadius.circular(999), // Set border width
                                              
          //                                       ),
          //                        child: SvgPicture.asset('assets/images/vector2.svg',width: 10,height: 10,)),
          //                       SizedBox(width: 10,),
          //                      Text(email,softWrap: true,overflow: TextOverflow.ellipsis,),
          //                    ],
                          //  ),
                          //  )
                          //  ]),
                        //  ),
                  //  SizedBox(height: 10,),
                  
         ]),
      
        
        //  bottomNavigationBar:const CustomeButtomNavBar(index: 3,),
  
        // BottomAppBar(),
    
      
     );
   
    return scaffold;
    
  }

  Future<String?> getVideoType(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final contentType = response.headers['content-type'];
    if (contentType != null) {
      final mimeType = lookupMimeType(contentType);
      if (mimeType != null && mimeType.startsWith('video/')) {
        return mimeType.split('/').last; // Extract video type (e.g., mp4)
      }
    }
  }
  return null; // Error or non-video content
}
}