// import 'dart:js';


import 'package:chamber_of_commerce/Models/favorite_Item.dart';
import 'package:chamber_of_commerce/checkFavorite.dart';
import 'package:chamber_of_commerce/pages/user/Almanac.dart';
import 'package:chamber_of_commerce/pages/user/Almanac_Options/Bank_Options.dart';
import 'package:chamber_of_commerce/pages/user/Almanac_Options/SavingAndCredit.dart';
import 'package:chamber_of_commerce/pages/user/Almanac_Options/Fintech_Options.dart';
import 'package:chamber_of_commerce/pages/user/Almanac_Options/Insurance_Options.dart';
import 'package:chamber_of_commerce/pages/user/Almanac_Options/MicroFinance_Options.dart';
import 'package:chamber_of_commerce/pages/user/Almanac_Options/Capital_Goods_Options.dart';
import 'package:chamber_of_commerce/theme/MyFavoritesProvider.dart';
import 'package:chamber_of_commerce/widgets/ContactTemplete.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:mime/mime.dart';
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
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';

class Company extends StatefulWidget {
  final Map<dynamic, dynamic> detail;
  Company({super.key,required this.detail});

  @override
  State<Company> createState() => _CompanyState();
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
class _CompanyState extends State<Company> {

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
                final newFavoritesBox = Provider.of<Box<FavoriteItem>>(context);

    //  final provider = Provider.of<FavoriteListProvider>(context);
    String sector = widget.detail["sector"].toString();
    String  name =widget.detail["name"].toString();
    String logo = widget.detail["logo"].toString();
    String  profile = widget.detail["profile"].toString();
    String image = widget.detail["adv_image"].toString();
    String video = widget.detail["adv_video"];
    String tel = widget.detail["tel"].toString();
    String email = widget.detail["email"].toString();
    final website = widget.detail["website"];
      Future<String> imageUrlFutureGif = storeVideoInFirebase(video);
     Future<String> videoUrlFuture = storeVideoInFirebase(video);
    // String fax = widget.detail["fax"].toString();
    final arg= FavoriteItem(sector: sector,name: name,logo: logo,profile: profile,image: image, video: video,tel: tel,email: email,website: website);
   
                checkFavorite(name);
   
    var scaffold = Scaffold(
      //  drawer:const BackButton(
      //   //  backgroundColor: Colors.white,
      //  ),
      
       





      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.background,
         leading: IconButton(
          
          icon: const Icon(Icons.arrow_back),
          onPressed:()=>{
            if(sector == 'Bank'){
              Navigator.push(
              context,
               TransparentRoute(
               
                page:  BankOptions(),
              ),
            ),
            },
             if(sector == 'Insurance'){
              Navigator.push(
              context,
              TransparentRoute(
               
                page:  Insurance_Options(),
              ),
            ),
            },
             if(sector == 'Micro Finance'){
              Navigator.push(
              context,
               TransparentRoute(
               
                page:  MicroFinance_Options(),
              ),
            ),
            },
             if(sector == 'FinTech'){
              Navigator.push(
              context,
              TransparentRoute(
               
                page:  Fintech_Options(),
              ),
            ),
            },
            //   if(sector == 'Telecom'){
            //   Navigator.push(
            //   context,
            //    TransparentRoute(
               
            //     page:  Telecom_Options(),
            //   ),
            // ),
            // },
              if(sector == 'Saving And Credit'){
              Navigator.push(
              context,
              TransparentRoute(
               
                page:  SavingAndCredit(),
              ),
            ),
            },
           
            }
          ),
        // padding: const EdgeInsets.all(16.0), // Add padding on all sides
    shape: RoundedRectangleBorder(

      borderRadius: BorderRadius.circular(30.0), // Set border radius
    ),
       
        title: Text(
          sector,
          style:  TextStyle(
           color: Theme.of(context).colorScheme.primary,
           fontWeight: FontWeight.bold,
           fontSize: 18,
          ),
        ),
       //should be replace by botton
     actions: [
          Padding(padding: const EdgeInsets.only(right: 20),
         child:  SvgPicture.asset('assets/images/chamber_icon.svg')
          ,),
         
    ],
        elevation: 0.0,//remove shadow
        centerTitle: true,
      ),
      
      body:  
      // ValueListenableBuilder(
      //   valueListenable: Hive.box('newFavorites').listenable(),
      //   builder:(context,box,child){
        // final isFavorite = provider.isFavorite(widget.detail.);
        // final isFavorite =
        //  checkFavoriteExists(name, FavoriteItem)
              //  final isFavorite = provider.isFavorite(name);
          // print(isFavorite);
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
                               Image.asset(logo,
                                        width:MediaQuery.of(context).size.width * 0.20,
                                        ),
                             Text(name,
                style:  TextStyle(
                      fontSize: 16, // Increase font size for heading-like appearance
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary // Make the text bold
                  ),)
                           ],
                         ),
                       )
                         
                       
            
                        ),
           ),
          // Container(
          // child:Text("Almanac / Bank / Awash Bank ")
        
          // ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: Row(children: [
              Spacer(),
               
              IconButton(onPressed: () async{
                ScaffoldMessenger.of(context).clearSnackBars();
                // isFavorite = isFavorite == true;
                // if(isFavorite == true){
                //   //  Provider.of<ThemeProvider>(context,listen: false).toggleTheme(),
                // //  provider.removeFromFavorites(arg);
                //   // provider.removeFromFavorites
                //   // box.delete(name);
                //     deleteByValue(name);
                //  const snackBar = SnackBar(content: Text('Remove successfully'),
                // backgroundColor: Colors.blue,
            
                // );
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  
                // }
              //  else{
                  newFavoritesBox.add(arg);
           
                // await box.put(name,video);
                const snackBar = SnackBar(content: Text('added successfully'),
                backgroundColor: Colors.red,
                
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //  }

                // provider.addToFavorites(arg);
                   
                // }
               
              },
              
               icon:   Icon(
              isFavorite?Icons.favorite: Icons.favorite_border,
               color: Colors.red,))
            ],),
          ),
          SizedBox(height: 20,),

          if(video!="")
       Container(
          height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child:  Padding(
            padding: EdgeInsets.all(30),
            child: Center(
        child: Stack( // Use a Stack to conditionally display content
          children: [
            Container(
              child:
               Image.asset(video) 
               ,
            )
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
        //     FutureBuilder<String>(
        //       future: videoUrlFuture,
        //       builder: (context, snapshot) {
        //         // print(snapshot.data);
        //         // print(getVideoType(snapshot.data!));
        //         String? videoType;
        //         Future<String?> type = getVideoType(snapshot.data!);
        //         type.then((value) => videoType = value);
        //         // print(snapshot.data!);
        //         // print(videoType);
        //         if (snapshot.hasData && videoType=='mp4') {
        //             // print('video');
        //           // Display video
        //           return VideoPlayerWidget(videoUrl: snapshot.data!);
        //         } else {
        //           return  Container(
        //       //  width:MediaQuery.of(context).size.width * 0.20,
        //      child: FutureBuilder<String>(
        //     future: imageUrlFutureGif,
        //     builder: (context, snapshot) {
        // if (snapshot.hasData) {
        //   return Image.network(snapshot.data!); 
        //   // print("test");// Use the downloaded URL
        // } else if (snapshot.hasError) {
        //   return Text('Error: ${snapshot.error}'); // Handle errors
        // }
        
        // // Display a loading indicator while waiting
        // return const CircularProgressIndicator();
        //     },
        //   ),
        
        //     );
                  
        //           // VideoPlayerGif(gifUrl: snapshot.data!);
        //           // Container(); // Placeholder for non-video content
        //         };
        //       },
        //     ),
          ],
        ),
            ),
          ),
        ),
        
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 16),
            child: Container(
             child: InteractiveViewer(child: Image.asset(image)),
            ),
          ),

           Padding(padding: EdgeInsets.only(left: 20,right: 20),
          child: Text("Sector: $sector",textAlign: TextAlign.start,maxLines: 2,),
          ),
         SizedBox(height: 20,),
           Container(
                      width: 200,
        
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 24),
                        child: Container(child: Text(profile,textAlign: TextAlign.justify,style: TextStyle(fontSize: 14,color: Theme.of(context).colorScheme.primary))),
                      )),
                     ContactTemeplete(tel: tel,email: email,)      
                        //    if(tel !="")
                        //  Padding(
                        //    padding: const EdgeInsets.only(left: 20.0,right: 20),
                        //    child: 
                        //    Row(
                        //      children: [
                        //        InkWell( // Wrap the content in an InkWell
                        //                       onTap: () {
                        //                         launch('tel:$tel'); // Launch the phone dialer with the number
                        //                       },
                        //       child: Row(
                        //          children: [
                        //             Container(
                        //              // width: 20,
                        //              // height: 20,
                        //              decoration: BoxDecoration(
                           
                        //        color: Color.fromARGB(255, 255, 255, 255),
                                              
                        //                       borderRadius:BorderRadius.circular(999), // Set border width
                                              
                        //                         ),
                        //              child: SvgPicture.asset('assets/images/vector1.svg',width: 10,height: 10,)),
                        //            SizedBox(width: 10,),
                        //            Text(tel,softWrap: true,overflow: TextOverflow.ellipsis,style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                        //          ],
                        //        ),),
                        //      ],
                        //    ),
                        //  ),
                        //  const SizedBox(height: 5,),
                        
                        //   if(website !=null)
                        //  Padding(
                        //    padding: const EdgeInsets.only(left: 20.0,right: 20),
                        //    child: Row(
                        //    children: [
                        //     InkWell( // Wrap the content in an InkWell
                        //        onTap: () {
                        //          // ignore: deprecated_member_use
                        //          launch(website); // Launch the URL in a web browser
                        //                       },
                        //      child:Row(
                        //      children: [
                        //         Container(
                        //          // width: 20,
                        //          // height: 20,
                        //          decoration: BoxDecoration(
                           
                        //        color: Color.fromARGB(255, 255, 255, 255),
                                              
                        //                       borderRadius:BorderRadius.circular(999), // Set border width
                                              
                        //                         ),
                        //          child: SvgPicture.asset('assets/images/vector.svg',width: 10,height: 10,)),
                        //        SizedBox(width: 10,),
                        //        Text(website,softWrap: true,overflow: TextOverflow.ellipsis,style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                        //      ],
                        //    )),],),
                        //  ),
                        //   SizedBox(height: 5,),
                        
                        //   if(fax !="")
                         
                        //  Padding(
                        //    padding: const EdgeInsets.only(left: 20.0,right: 20),
                        //    child: Row(
                        //      children: [
                        //         Container(
                        //          // width: 10,
                        //          // height: 10,
                        //          decoration: BoxDecoration(
                           
                        //        color: Color.fromARGB(255, 255, 255, 255),
                                              
                        //                       borderRadius:BorderRadius.circular(999), // Set border width
                                              
                        //                         ),
                        //          child: SvgPicture.asset('assets/images/vector3.svg',width: 10,height: 10,)),
                        //        SizedBox(width: 10,),
                        //        Text(fax,softWrap: true,overflow: TextOverflow.ellipsis,style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                        //      ],
                        //    ),
                        //  ),
                        //   SizedBox(height: 5,),
                        //    if(email !="")
                        
                        //  Padding(
                        //    padding: const EdgeInsets.only(left: 20.0,right: 20),
                        //    child: Row(
                        //                         children: [
                        //    InkWell( // Wrap the content in an InkWell
                        //                       onTap: () {
                        //                         launch('mailto:$email'); // Launch email app with recipient
                        //                       },
                        //                       child: Row(
                        //      children: [
                        //         Container(
                        //          // width: 20,
                        //          // height: 20,
                        //          decoration: BoxDecoration(
                           
                        //        color: Color.fromARGB(255, 255, 255, 255),
                                              
                        //                       borderRadius:BorderRadius.circular(999), // Set border width
                                              
                        //                         ),
                        //          child: SvgPicture.asset('assets/images/vector2.svg',width: 10,height: 10,)),
                        //         SizedBox(width: 10,),
                        //        Text(email,softWrap: true,overflow: TextOverflow.ellipsis,style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                        //      ],
                          //  ),)]),
                        //  ),
        
                         
                  //  SizedBox(height: 10,),
                   
         ]),
      //    }
      // ), 
        
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