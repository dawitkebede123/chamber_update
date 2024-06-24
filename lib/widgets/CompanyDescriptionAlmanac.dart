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
import 'package:firebase_storage/firebase_storage.dart';
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


class CompanyDescriptionAlmanac extends StatefulWidget {
  final Map<dynamic, dynamic> detail;
  CompanyDescriptionAlmanac({super.key,required this.detail});

  @override
  State<CompanyDescriptionAlmanac> createState() => _CompanyDescriptionState();
}

class _CompanyDescriptionState extends State<CompanyDescriptionAlmanac> {
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
  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<FavoriteListProvider>(context);

    // String sector = widget.detail["sector"].toString();
    String  name =widget.detail['Account Name'];
    String logo = widget.detail["logo"];
    // String  profile = '';
    String image = widget.detail["Image"];
    // print('test');
    // print(image);
    String video = widget.detail["Video"];
    String tel = widget.detail["Tel"].toString();
    String mobile = widget.detail["Mobile Phone"].toString();
    String email = widget.detail["E-mail"];
    String profile = widget.detail["Profile"];
    final website = widget.detail["Web"];
    final sector = widget.detail["Sector"];
    final sub_sector = widget.detail["Sub-Sector"];
    // final sub_sector = widget.detail["Sub-Sector"];
    final category = widget.detail["Category"];
    final storage = widget.detail["storage"];
    final arg= FavoriteItem( sector: sector, name: name,logo: logo,profile: profile,image: image, video: video,tel: tel,email: email,website: website,category: category,storage: storage);
    // String fax = widget.detail["fax"].toString();
     Future<String> imageUrlFuture = storeImageInFirebase(image);
     Future<String> imageUrlFutureGif = storeVideoInFirebase(video);
     Future<String> logoUrlFuture = storeLogoInFirebase(logo);
    Future<String> videoUrlFuture = storeVideoInFirebase(video);
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
      
       





      body:ValueListenableBuilder(
        valueListenable: Hive.box('newFavorites').listenable(),
         builder:(context,box,child){
             final isFavorite = provider.isFavorite(name);
        return ListView(
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
                provider.addToFavorites(arg);
        
                // await box.put(name,video);
                const snackBar = SnackBar(content: Text('added successfully'),
                backgroundColor: Colors.red,
                
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // }
               
              },
              
               icon:  Icon(
               isFavorite?  Icons.favorite:Icons.favorite_border,
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
                print(snapshot.data!);
                print(videoType);
                if (snapshot.hasData && videoType=='mp4') {
                    print('video');
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
          return Image.network(snapshot.data!); 
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
          child: Column(
            children: [
        
          Text("Sector: $sector",textAlign: TextAlign.start,maxLines: 2,), 
           Text("Sub Sector: $sub_sector",textAlign: TextAlign.start,maxLines: 2,), 
          
          
          // Row(
          //   children: [
          //     Text("Sub Sector: $sub_sector",textAlign: TextAlign.start,),
          //   ],
          // ),
            ],
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
           ContactTemeplete(tel: tel,website:website,email: email,)        
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
                  
         ]);}
      ), 
        
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