import 'package:chamber_of_commerce/widgets/AboutUs.dart';
import 'package:chamber_of_commerce/widgets/CustomBottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class MessagePresident extends StatelessWidget {
  // final String message;
  // final String image;
  const MessagePresident({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      //  drawer:const BackButton(
      //   //  backgroundColor: Colors.white,
      //  ),
      
       



     
      appBar: AppBar(
        backgroundColor:Theme.of(context).colorScheme.background,
        
         leading: IconButton(
          color: Theme.of(context).colorScheme.primary,
          icon: Icon(Icons.arrow_back),
          onPressed:()=>{
          Navigator.push(
                context,
                 TransparentRoute(
               
                page:  About(),
              ),
              ),
            }
          ),
        // padding: const EdgeInsets.all(16.0), // Add padding on all sides
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0), // Set border radius
    ),
       
        title: Text(
          'Addis Chamber',
          style: TextStyle(
           color: Theme.of(context).colorScheme.primary,
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
      // Container(
        
         Padding(
           padding: const EdgeInsets.only(left: 20.0,right: 20,top: 4),
           child: ListView(children: [

             Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
              image: const DecorationImage(
                  image: AssetImage('assets/president.jpg'), // Replace with your image path
                    fit: BoxFit.cover, // Adjust image fit as needed
    ),
               ),
              // child: Image.asset('assets/sg.jpg', fit: BoxFit.cover,)
              ),
            // Image.asset('assets/president.jpg'),
            SizedBox(height: 20,),
            Text('Dear Users,',style: TextStyle(color: Theme.of(context).colorScheme.primary,),),
            Text('Addis Ababa Chamber of Commerce and Sectoral Associations / Addis Chamber/ and I are pleased to present you the new edition of the Addis Ababa Business Directory 2024- 2025.\nAddis Ababa Business Directory 2024-2025, published by the Addis Chamber, is an indispensable reference for business people, foreign direct investors, exporters, importers, entrepreneurs, commercial counselors as well as potential foreign investors planning to create new business ventures in Ethiopia and worldwide.\nThis version will also grab an opportunity to promote businesses, increase local and international brand visibility to build links and meaningful connections with influential partners and grow businesses through digital platform.\nIt encompasses a diverse array of information on each business and has attested to be a robust instrument for firms and consumers containing a complete list of our members, the country’s profile and investment opportunities in Ethiopia as well as portrayals of the services offered by Addis chamber.\nI wish to reinforce the notion that the private sector is the main driver of growth of the economy. And it is light of the forgoing that our chamber provides information for businesses to flourish. With premier business and networking opportunities among its countless benefits, the Chamber offers reliable support to help our businesses connect, succeed and grow.\nWe sincerely hope this Directory both the digital and the printed ones proves useful to you and your customers. We believe that it encourages the users to make contact and create business opportunities by promoting their goods and services with their counterparts both local and international.\nI would therefore, like to take this opportunity to recognize and acknowledge all businesses that have placed their adverts and commercials on this Directory and also applaud the secretariat  of Addis Chamber for its impressive contribution to the realization of this vital business Directory.',textAlign: TextAlign.justify,style: TextStyle(color: Theme.of(context).colorScheme.primary,),),
            SizedBox(height: 10,),
            Text("Mesenbet Shenkute \nPresident\nAddis Ababa Chamber of Commerce and Sectoral Associations",style: TextStyle(color: Theme.of(context).colorScheme.primary,),) 
           ],),
         ),
          //  bottomNavigationBar: const CustomeButtomNavBar(index: 0),
    
      
     );
     
    return scaffold;
  }
}