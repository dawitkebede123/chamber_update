import 'package:chamber_of_commerce/pages/user/Almanac.dart';
import 'package:chamber_of_commerce/pages/user/AlmanacListing.dart';
import 'package:chamber_of_commerce/pages/user/Company.dart';
import 'package:chamber_of_commerce/pages/user/Home.dart';
import 'package:chamber_of_commerce/pages/admin/adminHome.dart';
import 'package:chamber_of_commerce/widgets/Almanac_Category.dart';
import 'package:chamber_of_commerce/widgets/BottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/CustomBottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/GridScreen.dart';
import 'package:chamber_of_commerce/widgets/expandedPanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MicroFinance_Options extends StatelessWidget {
  final List<Map<String,dynamic>> data = [
 
  
 ];

  final micro_finances = [
    "assets/images/almanac_lists/micro_finance_logos/1.png",
    "assets/images/almanac_lists/micro_finance_logos/3.png",
    "assets/images/almanac_lists/micro_finance_logos/4.jpg",
    //  "assets/images/almanac_lists/micro_finance_logos/2.png",
 ];
final Name = [
    "Elsabi Microfinance Institution S.C.",
    "Metemamen  Microfinancing Institution S.C.",
"Nisir Microfinance Institution S.C.",
    // "Amigos Saving and Credit Cooporate S.C",
 ];
  // const MicroFinance_Options({super.key});
   final List<Map<String, String>> detail = [{

      "sector":"Micro Finance",
     "name": "Elsabi Microfinance Institution S.C.",
     "logo": "assets/images/almanac_lists/micro_finance_logos/1.png",
     "adv_image":"assets/images/almanac_lists/adv/17.jpg",
     "adv_video":"",
     "profile": "established on June 8, 2022. Our journey began with a simple yet powerful vision – to empower underserved communities by providing them access to financial services that were previously unavailable to them. We firmly believe that access to finance is a critical component of poverty eradication and sustainable economic development.",
     "tel": " +251-116732829/+251-116675793/+251-116734807",
     "email": "info@elsani.net",
     "website":"www.elsabi.net",
     "fax":""
  },
  {

      "sector":"Micro Finance",
     "name": "Metemamen Microfinancing Institution S.C.",
     "logo": "assets/images/almanac_lists/micro_finance_logos/3.png",
     "adv_image":"",
     "adv_video":"",
     "profile": "",
      "tel": "+251-113698246/ +251-116615398/46; +251-911 977007",
     "email": "",
     "website":"",
     "fax":"Fax: +251-116186140"
  },
  {

      "sector":"Micro Finance",
     "name": "Nisir Microfinance Institution S.C.",
     "logo": "assets/images/almanac_lists/micro_finance_logos/4.jpg",
     "adv_image":"",
     "adv_video":"",
     "profile": "",
    "tel": " +251-115622225/911059722",
     "email": "",
     "website":"",
     "fax":""
  },
  // {
  //     "sector":"Micro Finance",
  //    "name": "Amigos Saving and Credit Cooporate S.C",
  //    "logo": "assets/images/almanac_lists/micro_finance_logos/2.png",
  //    "adv_image":"assets/images/almanac_lists/adv/16.jpg",
  //    "adv_video":"",
  //    "profile": "10 years from now in 2005 E.C. 20 friends (ie. ‘Amigos’) planned and founded Amigos saving and credit cooperation with a capital of only 9,000ETB. Since then, our company has lived to fulfill its purpose of making its members successful by providing the most suitable and flexible financial service products. Amigos is well known to consider and treat its member customers and staff as family. Right now Amigos sacco has more that Six thousand members, nearly 80 employees and a total asset of one billion five hundred million birr.",
  //    "tel": "8511",
  //    "email": "info@amigossacco.net",
  //    "website":"www.amigossaccp.net",
  //    "fax":""
  //  },
  ]; 
  
  @override
  Widget build(BuildContext context) {
    
     var scaffold = Scaffold(
      //  drawer:const BackButton(
      //   //  backgroundColor: Colors.white,
      //  ),
      
       

      appBar: AppBar(
        backgroundColor:Colors.white,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed:()=>{
          Navigator.push(
              context,
               TransparentRoute(
               
                page:  Almanac(),
              ),
            ),
            }
          ),
      
        // padding: const EdgeInsets.all(16.0), // Add padding on all sides
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0), // Set border radius
    ),
       
        title:const Text(
          'Micro Finance',
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
           Padding(
             padding:  EdgeInsets.only(left: 20.0,right: 20,top: 4),
             child: Column(
               children: [
                 SizedBox(
                  height: 600,
                    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Change to adjust the number of columns
        crossAxisSpacing: 10.0, // Spacing between columns
        mainAxisSpacing: 20.0, // Spacing between rows
        childAspectRatio: 1.2, // Adjust aspect ratio for desired layout
      ),
      itemCount: micro_finances.length,
      itemBuilder: (context, index) {
       final String icon = micro_finances[index];
        final String name = Name[index];

        return GestureDetector(
          onTap: (){
                  if(index<14){
                                     Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => Company(detail: detail[index])),
                                 );
                                }
          },
         
          child: Column(
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromARGB(255, 229, 234, 232),
                  ),
                  // ... other decoration for the container
                ),
                child: Image.asset(icon),
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
  //                  child: ListView.builder(
  //                    itemCount: micro_finances.length,
  //                    itemBuilder: (context, index) {
  //                      final String icon = micro_finances[index];
  //                      final String name = Name[index]; // Assuming Name has data for each bank
                   
  //                      return Column(
  //                        children: [
  //                          Container(
  //                            child: GestureDetector(
  //                              onTap: () {
  //                               if(index==0){
  //  Navigator.push(
  //                                  context,
  //                                  MaterialPageRoute(builder: (context) => Company(detail: detail[index])),
  //                                );
  //                               }
                              
  //                              },
  //                              child: Padding(
  //                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
  //                                child: Row(
  //                                  children: [
  //                  Container(
  //                    width: 80.0,
  //                    height: 80.0,
  //                    decoration: BoxDecoration(
  //                      color: Colors.white,
  //                      border: Border.all(
  //                        color: Color.fromARGB(255, 229, 234, 232),
  //                        width: 1.0,
  //                      ),
  //                      borderRadius: BorderRadius.circular(10.0),
  //                    ),
  //                    child: Image.asset(icon),
  //                  ),
  //                  SizedBox(width: 20.0),
  //                  Expanded(
  //                    child: Text(
  //                      name,
  //                      style: TextStyle(fontWeight: FontWeight.bold),
  //                      textAlign: TextAlign.left,
  //                      maxLines: 1,
  //                      overflow: TextOverflow.ellipsis,
  //                    ),
  //                  ),
  //                                  ],
  //                                ),
  //                              ),
  //                            ),
                           
                           
                             
  //                          ),
                         
  //                        ],
  //                      );
  //                    },
  //                  ),
                 ),
                //  const Padding(
                //    padding: EdgeInsets.only(left: 20.0,right: 20,),
                //    child: Row(
                //      children: [
                //        Text("Usefull Addresses",style: TextStyle(fontSize: 16.0),textAlign: TextAlign.center,)
                //      ],
                //    ),
                //  ),
                   // SizedBox(height: 20,),
            // Expanded(child: ExpandedPanel(data: data))
               ],
             ),
           ),  
    
          bottomNavigationBar:const CustomeButtomNavBar(index: 3,),


    );
    return scaffold;
  }

}