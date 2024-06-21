
import 'package:chamber_of_commerce/main.dart';
import 'package:chamber_of_commerce/pages/user/Business.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Export/Export_Home.dart';
import 'package:chamber_of_commerce/pages/user/Company%20_business.dart';
import 'package:chamber_of_commerce/pages/user/Company.dart';
import 'package:chamber_of_commerce/pages/user/Company_detail.dart';
import 'package:chamber_of_commerce/pages/user/Home.dart';
import 'package:chamber_of_commerce/widgets/BottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/ContactTemplete.dart';
import 'package:chamber_of_commerce/widgets/CustomBottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/GridScreen.dart';
import 'package:chamber_of_commerce/widgets/GridSingle.dart';
import 'package:chamber_of_commerce/widgets/SearchField.dart';
import 'package:chamber_of_commerce/widgets/SearchFieldBusiness.dart';
import 'package:chamber_of_commerce/widgets/business_top_list.dart';
import 'package:chamber_of_commerce/widgets/expandedPanel%20_usefull_address.dart';
import 'package:chamber_of_commerce/widgets/expandedPanel.dart';
import 'package:chamber_of_commerce/widgets/expandedPanelUsefulAddressBusiness.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


class UseFullAddressBusiness extends StatefulWidget {
  const UseFullAddressBusiness({super.key});
  @override
  State<UseFullAddressBusiness> createState() => _UseFullAddressBusinessState();
}

class _UseFullAddressBusinessState extends State<UseFullAddressBusiness> {
   Stream<DatabaseEvent>? _userStream;
  // final Map data = widget.businessCompanyProfile[""];
  
  @override
  void initState() {
    super.initState();
    try {
    _userStream = FirebaseDatabase.instance.ref('usefull').onValue;
  } on FirebaseException catch (e) {
    print('Firebase error: ${e.code} - ${e.message}');
    // Handle the error appropriately, potentially display a user-friendly message
  }
  }

  @override
  void dispose() {
    // _searchController.dispose();
    super.dispose();
  }

  // void _searchCompany(String searchTerm) {
  //   setState(() {
  //     // _searchTerm = searchTerm.toLowerCase();
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    //sample data containing company name, log(if there is no logo give a default one
    // ),
  //  
    //  final data
    
     final  _items = [
     'assets/images/business_lists/sample/1.svg',
     'assets/images/business_lists/sample/2.svg',
     'assets/images/business_lists/sample/3.svg',
     'assets/images/business_lists/sample/4.svg',
     'assets/images/business_lists/sample/5.svg',
     'assets/images/business_lists/sample/6.svg',
    //  'assets/images/business_lists/sample/mengesha.svg',
    //  'assets/images/business_lists/sample/tomoca.svg',


   

  ];
     var scaffold = Scaffold(
      //  drawer:const BackButton(
      //   //  backgroundColor: Colors.white,
      //  ),
      
       





      appBar: AppBar(
        // Padding: const EdgeInsets.only(left: 20.0, top: 15.0, right: 10.0, bottom: 5.0),
        backgroundColor:Color.fromARGB(255, 255, 255, 255),
      
         leading: Row(
           children: [
             Column(
               children: [
                 IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed:()=>{
                   Navigator.push(
                      context,
                       TransparentRoute(
               
                page:  Business(),
              ),
                    ),
                    }
                  ),
          //           Padding(
          //   padding: const EdgeInsets.only(left: 20.0,right: 20,top: 4,bottom: 4),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height*0.2,
          //     child: SearchField()),
          // ),
               ],
             ),
            
           ],
         ),
        // padding: const EdgeInsets.all(16.0), // Add padding on all sides
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0), // Set border radius
    ),
       
        title: const Text(
          "Usefull Address ",
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
      // ListView(
    // children: [
    ListView(
        children: [
          
              StreamBuilder<DatabaseEvent>(builder:  (context, snapshot) {
                       return Column(
                         children: [
                  //          const SizedBox(
                  // height: 400,
                  // child: Business_Top_List()),
                          
                           
                         
                           
                           
                           
                                                            Container(
                                                                                                         // Set desired height or adjust with constraints
                                                                                                           height: MediaQuery.of(context).size.height * 0.81, // Adjust height as needed
                                                                                                         // color: Color.fromARGB(255, 142, 139, 139), // Optional background color
                                                                                                         child: _buildContent(snapshot), // Call a separate function
                                                                                                       ),
                         ],
                       );
                    }, stream: _userStream,)


        ],
      ),
          bottomNavigationBar:const CustomeButtomNavBar(index: 2,),


     
    );
    return scaffold;
  }

  ///
  ///
  ///
  
    Widget _buildContent(AsyncSnapshot<DatabaseEvent> snapshot) {
      
      if (snapshot.hasError) {
    return Center(
      child: Text('Error: ${snapshot.error}'),
    );
  }

  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
  }

  final data = snapshot.data!.snapshot.value as List<dynamic>;
//   final List<dynamic> data = [
//       {
//    "category":"High Office",     
//   "title":"new",
// "tel": "+251-115261717"
//   },
//   ];
  // print(data.length);
  if (data.length == 0) {
    return const Center(child: Text('No businesses found'));
  }
// final  resultMap =  <List<String, dynamic>>[];

// for (final businessData in data) {
//   if (businessData is Map<String, dynamic>) {
//     // Extract key-value pairs (assuming all keys are strings)
//     final keyList = businessData.keys.toList().cast<String>();
//     final valueList = businessData.values.toList();

//     // Add the key-value pair lists to the result map
//     resultMap.add([keyList, valueList]);
//   } else {
//     // Handle unexpected data types (optional)
//     print("Warning: Unexpected data type in snapshot");
//   }
// }
  //based on the index categorize Field Of Business
    // index = 0;
     
    


  // int index= 0;
  // if(widget.index == 14){
  //    filteredBusinesses = data.expand((element) {
  //   // ... filtering logic using entry.value as Map<String, dynamic>
  //   final companyName = element['Field Of Business']?.toString().toLowerCase() ?? '';
  //   return companyName.startsWith("transport") ? [element] : [];
  // }).toList();

  // }
  // final filteredBusinesses = data.expand((element) {
  //   // ... filtering logic using entry.value as Map<String, dynamic>
  //   final companyName = element['Campany Name']?.toString().toLowerCase() ?? '';
  //   return companyName.startsWith(_searchTerm) ? [element] : [];
  // }).toList();

  
  
      // physics: NeverScrollableScrollPhysics(),
     
     
       
        
         return ExpandedPanelUsefullAddressBusiness(data: data,clickable: true,);
          //  ExpandedPanelUseFullAddress(data:data ,);
         
        //  ListView.builder(
          
        //  itemCount: data.length,
        //  itemBuilder: (context, index) {
        //    final businessData = data[index];
        //    final name = businessData['Institution'];
        //    final email = businessData['Email'];
        //    final String tel = businessData['Tel'].toString();
        //    final String mobile = businessData['Mobile'];
        //    final String website = businessData['Website'];
        //    final category = businessData['Category'];
           
         
        //    // Extract business information based on your data structure
        //    return Padding(
            
        //      padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 16),
        //      child:
        //          GestureDetector(
        //           onTap: () {
        //     // Navigator.push(
        //     //   context,
        //     //   MaterialPageRoute(
        //     //     builder: (context) => CompanyDetail(data: businessData),
        //     //   ),
        //     // );
        //   },
          
        //            child: Container(
                    
        //               decoration: BoxDecoration(
                       
        //                    color: const Color.fromARGB(255,229,234,232),
                   
        //            borderRadius:BorderRadius.circular(20), // Set border width
                   
        //              ),
        //              // color: const Color.fromARGB(255,229,234,232),
        //              //  width: MediaQuery.of(context).size.width * 0.8,
        //              //  height: 230,
        //              child:  Padding(padding: EdgeInsets.all(16),
        //              child: Column(children: [
        //                Row(
        //                  children: [
                          
        //                    Expanded(child: Text(name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16), softWrap: true,overflow: TextOverflow.ellipsis,textAlign: TextAlign.left)),
        //                  ],
        //                ),
        //                if(tel=='' && mobile==''&&email==''&&website=='')
        //                 ContactTemeplete(),
        //                if(tel=='' && mobile==''&&email==''&&website!='')
        //                 ContactTemeplete(website: website,),
        //                if(tel=='' && mobile==''&&email!=''&&website=='')
        //                 ContactTemeplete(email: email,),
        //                if(tel=='' && mobile!=''&&email==''&&website=='')
        //                 ContactTemeplete(mobile: mobile,),
        //                if(tel!='' && mobile==''&&email==''&&website=='')
        //                 ContactTemeplete(tel: tel),
        //                if(tel!='' && mobile==''&&email==''&&website!='')
        //                 ContactTemeplete(tel: tel,website: website,),
        //                if(tel!='' && mobile==''&&email!=''&&website=='')
        //                 ContactTemeplete(tel: tel,email: email,),
        //                if(tel!='' && mobile==''&&email!=''&&website!='')
        //                 ContactTemeplete(tel: tel,email: email),
        //                if(tel!='' && mobile!=''&&email==''&&website=='')
        //                 ContactTemeplete(tel: tel,mobile:mobile),
        //                if(tel!='' && mobile!=''&&email==''&&website!='')
        //                 ContactTemeplete(tel: tel,mobile:mobile,website: website,),
        //                if(tel!='' && mobile!=''&&email!=''&&website!='')
        //                 ContactTemeplete(tel: tel,mobile:mobile,email: email,website: website,),
        //                if(tel=='' && mobile==''&&email!=''&&website!='')
        //                 ContactTemeplete(email: email,website: website,),
        //                if(tel=='' && mobile!=''&&email==''&&website!='')
        //                 ContactTemeplete(mobile:mobile,website: website,),
        //                if(tel=='' && mobile!=''&&email!=''&&website!='')
        //                 ContactTemeplete(mobile:mobile,email: email,website: website,),
        //                if(tel!='' && mobile==''&&email!=''&&website!='')
        //                 ContactTemeplete(tel: tel,email: email,website: website,),
        //                if(tel=='' && mobile!=''&&email==''&&website!='')
        //                 ContactTemeplete(mobile:mobile,website: website,),
                     
               
        //              ],))
                      
        //            ),
        //          ),
              
           
        //    );
     
        //  },
        //    );
       
    
}
}











































