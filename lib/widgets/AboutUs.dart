import 'package:chamber_of_commerce/pages/user/Home.dart';
import 'package:chamber_of_commerce/widgets/CustomBottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/FAQ.dart';
import 'package:chamber_of_commerce/widgets/GridScreen.dart';
import 'package:chamber_of_commerce/widgets/LeftMenu.dart';
import 'package:chamber_of_commerce/widgets/MessagePresident.dart';
import 'package:chamber_of_commerce/widgets/MessageSG.dart';
import 'package:chamber_of_commerce/widgets/expandedPanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  const About({super.key});

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
               
                page:  LeftMenu(),
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
          padding: const EdgeInsets.all(20.0),
          child: ListView(
              
               children:[
                Container(
              margin: const EdgeInsets.all(20.0),
              ///place holder for slider 
              child: SvgPicture.asset('assets/images/chamber_logo_about_page.svg')
           ),
          
            Text(style: TextStyle(color: Theme.of(context).colorScheme.primary), textAlign: TextAlign.justify, "Established in 1947, AACCSA is a voluntary, non-governmental, business membership organization with more than 17,000 member companies. The chamber serves as a credible voice of business and advocates for the creation of a conducive business environment. It also promotes trade and industry, disseminating business information, consulting government and members on economic development and business issues, establishing friendly relationship with similar chambers in other countries, and exchanging information as well as engaging in arbitration in times of disputes among businesses."),
              SizedBox(height: 20,),
            ElevatedButton(
  onPressed: () {
    // Handle button press event here
    Navigator.push(
                context,
                 TransparentRoute(
               
                  page: MessageSg()              
                
                // , image: "assets/sg.jpg")
              ),
              );
  },
   style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 0, 114, 63), // Set the background color
    textStyle: const TextStyle(color: Colors.white), // Adjust text color for contrast
  ),
  child:  Text('Message From Secretary General', style: TextStyle(color:Colors.white),),
),
 

    ElevatedButton(
     
  onPressed: () {
    // Handle button press event here
    Navigator.push(
                context,
                 TransparentRoute(
               
                page:  MessagePresident()
              ),
          );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 0, 114, 63), // Set the background color
    textStyle: const TextStyle(color: Colors.white), // Adjust text color for contrast
  ),
  child: Text('Message From President', style: TextStyle(color:Colors.white),),
),        

         
           
          ]),
        )
         
         
          
    
      
     );
     
    return scaffold;
  // );
  }
 
  // }
  
}