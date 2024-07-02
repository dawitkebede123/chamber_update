// import 'dart:js';

// ignore_for_file: deprecated_member_use

import 'package:chamber_of_commerce/Models/favorite_Item.dart';
import 'package:chamber_of_commerce/pages/user/Company.dart';
import 'package:chamber_of_commerce/pages/user/Home.dart';
import 'package:chamber_of_commerce/widgets/BottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/CompanyDescription.dart';
import 'package:chamber_of_commerce/widgets/ContactTemplete.dart';
import 'package:chamber_of_commerce/widgets/CustomBottomNavBar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chamber_of_commerce/widgets/VideoPlayer.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyDetail extends StatefulWidget {
      // int index= 2;
  final Map<dynamic, dynamic> data;

    const CompanyDetail({super.key, required this.data});
 
  @override
  State<CompanyDetail> createState() => CompanyState();
}

class CompanyState extends State<CompanyDetail> {
    
  @override
  Widget build(BuildContext context) {

    
    // final accountNumber = widget.data['Account Number'];
    final name = widget.data['Account Name'];
    // final  profile = widget.data["Profile"];
    final tel = widget.data['Tel'];
    final mobile = widget.data['Mobile'];
    final email = widget.data['Email'];
    final website = widget.data['Website'];
    final isAdv = widget.data['Is-adv'] == "True";
      final sector = widget.data["Sector"];
         final subSector = widget.data["Sub-Sector"];
    final category = widget.data['Category'];
     final newFavoritesBox = Provider.of<Box<FavoriteItem>>(context);
      final arg= FavoriteItem(  name: name,tel: tel,email: email,website: website,category: category,);
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
             List<dynamic> data = [];
    var scaffold = Scaffold(
    
       





      appBar: AppBar(

        // backgroundColor:Color.fromARGB(255, 255, 241, 209),
         leading: IconButton(
          
          icon: Icon(Icons.arrow_back),
          onPressed:()=>{
           Navigator.of(context).pop(),
            }
          ),
        // padding: const EdgeInsets.all(16.0), // Add padding on all sides
    shape: RoundedRectangleBorder(

      borderRadius: BorderRadius.circular(30.0), // Set border radius
    ),
       
        title: Text(
          name,
          style: const TextStyle(
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
      
      body: isAdv?CompanyDescription(detail: widget.data): Padding(padding: EdgeInsets.all(10),
      child:  Container(
         decoration: BoxDecoration(
    
              color: const Color.fromARGB(255,229,234,232),

      borderRadius:BorderRadius.circular(20), // Set border width

  ),
        // color: const Color.fromARGB(255,229,234,232),
        //  width: MediaQuery.of(context).size.width * 0.8,
         height: 800,
        child:  Padding(padding: EdgeInsets.all(5),
        child: Column(children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          Row(children: [
              Spacer(),
              IconButton(onPressed: () async{
                newFavoritesBox.add(arg);
                ScaffoldMessenger.of(context).clearSnackBars();
               
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
          // Row(
          //   children: [
          //      SvgPicture.asset('assets/images/phone_icon.svg'),
          //     SizedBox(width: 10,),
          //     Text(tel),
          //   ],
          // ),
          
          SizedBox(height: 5,),
            ContactTemeplete(tel: tel,mobile: mobile,email: email,website: website,),
             SizedBox(height: 5,),
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
          height: 400.0,
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
DataTable createDataTable() {
  return DataTable(
    columns: const [
      DataColumn(label: Text('Sector', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Sub Sector', style: TextStyle(fontWeight: FontWeight.bold))),
    ],
    rows: [
      DataRow(cells: [
        DataCell(Text(company['Sector'])),
        DataCell(Text(company['Sub-Sector'])),
      ]),
    ],
  );
}
        return  createDataTable();
        //  Column(
        //   children: [
        //     Text("Sector",style: TextStyle(fontWeight: FontWeight.bold),),
        //     Text(" $sector"),
        //     Text("Sub sector",style:TextStyle(fontWeight: FontWeight.bold)),
        //     Text(" $sub_sector"),
        //   ],
        // );
      },
    ),
        );
      },
    ),
          ),                    
           SizedBox(height: 20,),
                // if(tel !="")
                //      Row(
                //        children: [
                //          InkWell( // Wrap the content in an InkWell
                //  onTap: () {
                //    launch('tel:$tel'); // Launch the phone dialer with the number
                //  },
                //         child: Row(
                //            children: [
                //               Container(
                //                // width: 20,
                //                // height: 20,
                //                decoration: BoxDecoration(
                     
                //          color: Color.fromARGB(255, 255, 255, 255),
                 
                //  borderRadius:BorderRadius.circular(999), // Set border width
                 
                //    ),
                //                child: SvgPicture.asset('assets/images/vector1.svg',width: 10,height: 10,)),
                //              SizedBox(width: 10,),
                //              Text(tel,softWrap: true,overflow: TextOverflow.ellipsis,),
                //            ],
                //          ),),
                //        ],
                //      ),
                //      SizedBox(height: 5,),
                    
                //       if(website !="")
                //      Row(
                //      children: [
                //       InkWell( // Wrap the content in an InkWell
                //          onTap: () {
                //            launch(website); // Launch the URL in a web browser
                //  },
                //        child:Row(
                //        children: [
                //           Container(
                //            // width: 20,
                //            // height: 20,
                //            decoration: BoxDecoration(
                     
                //          color: Color.fromARGB(255, 255, 255, 255),
                 
                //  borderRadius:BorderRadius.circular(999), // Set border width
                 
                //    ),
                //            child: SvgPicture.asset('assets/images/vector.svg',width: 10,height: 10,)),
                //          SizedBox(width: 10,),
                //          Text(website,softWrap: true,overflow: TextOverflow.ellipsis,),
                //        ],
                //      )),],),
                //       SizedBox(height: 5,),
                //       if(mobile !="")
                //      Row(
                //        children: [
                //           Container(
                //            // width: 10,
                //            // height: 10,
                //            decoration: BoxDecoration(
                     
                //          color: Color.fromARGB(255, 255, 255, 255),
                 
                //  borderRadius:BorderRadius.circular(999), // Set border width
                 
                //    ),
                //            child: SvgPicture.asset('assets/images/vector3.svg',width: 10,height: 10,)),
                //          SizedBox(width: 10,),
                //          Text(mobile,softWrap: true,overflow: TextOverflow.ellipsis,),
                //        ],
                //      ),
                //       SizedBox(height: 5,),
                //        if(email !="")
                //      Row(
                //    children: [
                //      InkWell( // Wrap the content in an InkWell
                //  onTap: () {
                //    launch('mailto:$email'); // Launch email app with recipient
                //  },
                //  child: Row(
                //        children: [
                //           Container(
                //            // width: 20,
                //            // height: 20,
                //            decoration: BoxDecoration(
                     
                //          color: Color.fromARGB(255, 255, 255, 255),
                 
                //  borderRadius:BorderRadius.circular(999), // Set border width
                 
                //    ),
                //            child: SvgPicture.asset('assets/images/vector2.svg',width: 10,height: 10,)),
                //           SizedBox(width: 10,),
                //          Text(email,softWrap: true,overflow: TextOverflow.ellipsis,),
                //        ],
                //      ),)]),
          // const Column(
          //   children: [
              
          //   ],
          // )
        ],))
         
      )),
        
        //  bottomNavigationBar:const CustomeButtomNavBar(index: ,),
  
        // BottomAppBar(),
    
      
     );
     
    return scaffold;
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
}