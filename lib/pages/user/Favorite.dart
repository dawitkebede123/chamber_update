// import 'package:chamber_of_commerce/MyFavoritesProvider.dart';
import 'package:chamber_of_commerce/pages/user/Company.dart';
import 'package:chamber_of_commerce/pages/user/Home.dart';
import 'package:chamber_of_commerce/theme/MyFavoritesProvider.dart';
import 'package:chamber_of_commerce/widgets/BottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/CompanyDescription.dart';
import 'package:chamber_of_commerce/widgets/CustomBottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/GridScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
class Favorite extends StatefulWidget {
   const Favorite({super.key});
 
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  var data;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  
  }

  //   List <Map<String,dynamic>> Companies = [
  //   {
  //    "company_Name":"Awash",
  //    "Image":"assets/images/awash_logo.svg"
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
  data=Provider.of<FavoriteListProvider>(context).loadFavorites();
  print(data);
    
     return 
    //  <FavoriteListProvider>(
    //   create: (context) => FavoriteListProvider()..loadFavorites(), // Load favorites on creation
      
    //   
     Scaffold(
        
        
         
       
       
       
       
       
        appBar: AppBar(
          backgroundColor:Colors.white,
           leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed:()=>{
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              ),
              }
            ),
          // padding: const EdgeInsets.all(16.0), // Add padding on all sides
           shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0), // Set border radius
           ),
         
          title:const Text(
            'Favorite',
            style: TextStyle(
             color: Colors.black,
             fontWeight: FontWeight.bold,
             fontSize: 18,
            ),
          ),
         //should be replace by botton
          actions: [
          Padding(padding: EdgeInsets.only(right: 20),
           child:  SvgPicture.asset('assets/images/chamber_icon.svg')
            ,),
           
           ],
          elevation: 0.0,//remove shadow
          centerTitle: true,
        ),
        
        body:
            
          Consumer<FavoriteListProvider>(
          builder:(context,provider,child){
             return ListView.builder(
              itemCount: provider.favorites.length,
              itemBuilder: (context, index) {
         final favorite = provider.favorites[index];
         final Map<String,dynamic> detail = {
           "name":favorite.name,
           "Sub-Sector":favorite.sub_sector,
           "sector":favorite.sector,
           "logo":favorite.logo,
           "profile":favorite.profile,
           "adv_image":favorite.image,
           "adv_video":favorite.video,
           "tel":favorite.tel,
           "E-mail":favorite.email,
           "website":favorite.website,
           "Category":favorite.category,
           "storage": favorite.storage,
         };
          final Map<String,dynamic> detail_business = {
           "Account Name":favorite.name,
          //  "Sub-Sector":favorite.sub_sector,
           "Sector":favorite.sector,
           "logo":favorite.logo,
           "Profile":favorite.profile,
           "Image":favorite.image,
           "Video":favorite.video,
           "Tel":favorite.tel,
           "E-mail":favorite.email,
           "Web":favorite.website,
           "Category":favorite.category,
           "storage": favorite.storage,
         };
        //  print(detail);
                return
                
                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text('$favorite.name'),
                //       ),
                //     ),
                //     const SizedBox(width: 8.0), // Add spacing between containers
                //     Expanded(
                //       child: Container(
                //         padding: const EdgeInsets.all(2.0),
                //         child: SvgPicture.asset('assets/images/awash_logo.svg'), // Replace with image widget if available
                //       ),
                //     ),
                //     const SizedBox(width: 8.0), // Add spacing between containers
                //     Expanded(
                //       child: Container(
                //         padding: const EdgeInsets.all(8.0),
                //         child: SvgPicture.asset('assets/images/trash.svg'), // Replace with additional data widget
                //       ),
                //     ),
                //   ],
                // );
                 ListTile(
                  title: Text(favorite.name),
                  onTap: (){
                    // print(favorite.storage);
                    if(favorite.storage == "online"){
                   Navigator.push(
              context,
               TransparentRoute(
               
                page:  CompanyDescription(detail: detail_business,),
              ),
            );
                    }
                    else{
                  Navigator.push(
              context,
               TransparentRoute(
               
                page:  Company(detail: detail,),
              ),
            );
                    };
                    
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => provider.removeFromFavorites(favorite),
                  ),
                );
              },
             
                     );
         }),
          
        
          
        
       
        
           
        
        bottomNavigationBar:const CustomeButtomNavBar(index: 4,),
           );
     
    // return scaffold;
  }
}