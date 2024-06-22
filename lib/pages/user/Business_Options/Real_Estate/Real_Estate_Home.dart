import 'package:carousel_slider/carousel_slider.dart';
import 'package:chamber_of_commerce/pages/user/Business.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Agriculture/Agriculture_Listing.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Export/Export_Listing.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Real_Estate/Real_Estate_Listing.dart';
import 'package:chamber_of_commerce/pages/user/Business_listing.dart';
import 'package:chamber_of_commerce/pages/user/Home.dart';
import 'package:chamber_of_commerce/widgets/BottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/CustomBottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/GridScreen.dart';
import 'package:chamber_of_commerce/widgets/GridScreenForBusiness.dart';
import 'package:chamber_of_commerce/widgets/GridSingle.dart';
import 'package:chamber_of_commerce/widgets/SearchField.dart';
import 'package:chamber_of_commerce/widgets/SearchFieldBusiness.dart';
import 'package:chamber_of_commerce/widgets/business_top_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class Real_Estate_Home extends StatefulWidget {
  const Real_Estate_Home({super.key});
  @override
  State<Real_Estate_Home> createState() => _Agriculture_HomeState();
}

class _Agriculture_HomeState extends State<Real_Estate_Home> {
  String _query = '';
   List <String> title = [
"ABROAD RECRUITMENT AND LINKAGE ACTIVITIES" ,
"ACTIVITIES AUXILIARY TO PENSION FUNDING" ,
"ACTIVITIES OF COST AND MANAGEMENT ACCOUNTANTS" ,
"ACTIVITIES OF EMPLOYMENT AGENCIES AND RECRUITING ORGANIZATIONS" ,
"ADVERTISING" ,
"ADVERTISING BY BROADCAST MEDIA" ,
"ASSET VALUATION" ,
"AUTHORIZED ACCOUNTANT" ,
"AUTHORIZED AUDITOR" ,
"BROKERS DUTIES" ,
"BUILDING, INDUSTRIES, AIRPLANE, RESIDENT HOUSE AND OTHER RELATED CLEANING ACTIVITIES" ,
"BUSINESS AND MANAGEMENT CONSULTANCY ACTIVITIES" ,
"CERTIFIED ACCOUNTANT" ,
"COFFEE AND TEA" ,
"COMMERCIAL REPRESENTATIVE" ,
"COMMISSION/BROKERS BUSINESS ACTIVITIES" ,
"COMMUNICATION, COMPUTER AND RELATED EQUIPMENT" ,
"COMPUTER AND COMPUTER ACCESSORIES MAINTENANCE" ,
"COMPUTER NETWORK DESIGN AND CABLE INSTALATION" ,
"COMPUTER RELATED ACTIVITIES" ,
"CONSTRUCTION AND RELATED SPECIALIZED CONSULTANCY SERVICES" ,
"CONSTRUCTION MATERIALS" ,
"CONSTRUCTION RELATED PROFESSIONAL CONSULTANCY SERVICES" ,
"CONSTRUCTION SITE PREPARATION CONTRACTOR" ,
"CONSULTANCY ACTIVITY ON ADVERTISING" ,
"CONSULTANCY ON SOCIAL SCIENCE" ,
"CONSULTANCY SERVICE FOR BUSINESS AND INVESTMENT" ,
"CONSULTANCY SERVICE FOR ECONOMIC DEVELOPMENT" ,
"CONSULTANCY SERVICE FOR ENVIRONMENTAL AUDITING AND ENVIRONMENTAL PROTECTION" ,
"CONSULTANCY SERVICE FOR INVESTMENT" ,
"CONSULTANCY SERVICE FOR SOCIAL AFFAIRS" ,
"CONSULTANCY SERVICE FOR STATISTICAL WORK" ,
"CONSULTANCY SERVICE FOR TAX AND FINANCE" ,
"CONSULTANCY SERVICE ON CHEMICAL ENGINEERING" ,
"CONSULTANCY SERVICE ON CONSTRUCTION SERVICE" ,
"CONSULTANCY SERVICE ON EDUCATION" ,
"CONSULTANCY SERVICE ON ELECTRICAL ENGINEERING" ,
"CONSULTANCY SERVICE ON FOOD AND BEVERAGES PREPARATION" ,
"CONSULTANCY SERVICE ON MECHANICAL ENGINEERING" ,
"CONSULTANCY SERVICE ON MINIMG ENGINEERING" ,
"CONSULTANCY SERVICE ON NUTRITION" ,
"CONSULTANCY SERVICE ON WATER WORKS" ,
"CONSULTATION OF WATER WORKS" ,
"CONSULTING ARCHITECTS" ,
"CONSULTING ENGINEERS" ,
"DATA BASE ACTIVITIES AND DATA PROCESSING" ,
"DATA CENTER/HOSTING" ,
"DEVELOPING REAL ESTATE, SUBDIVIDING REAL ESTATE INTO LOTS AND RESIDENTIAL DEVELOPMENT" ,
"DIFFERENT EVENTS DECORATING ACTIVITIES" ,
"DOMESTIC TRADE AGENT" ,
"FINANCE AND ADMINISTRATION SERVICES" ,
"FIXED PROPERTY SUBLETTING/RENTING ACTIVITITIES" ,
"FOREIGN TRADE AGENT" ,
"FOREIGN TRADE AUXILIARY" ,
"FRESH FRUITS & VEGETABLES" ,
"GENERAL CONTRACTOR" ,
"GIS WORKS SERVICE" ,
"HEALTH CONSULTANCY SERVICE" ,
"HISTORIC CITES AND BUILDINGS FOR RECREATION AND CARE SERVICES" ,
"HOTEL & TOURISM CONSULTANCY" ,
"INDUSTRIAL CONSULTING ENGINEER" ,
"INFORMATION COMMUNICATION TECHNOLOGY CONSULTANCY SERVICES" ,
"INSPECTION" ,
"INSTALLATION AND MAINENANCE SERVICES" ,
"INTERNATIONAL BID" ,
"LADIES HAIR DRESSING SERVICE" ,
"LOCAL ACTIVITIES OF EMPLOYMENT AGENCIES AND RECRUITING ORGANIZATIONS" ,
"LOCAL LABOR RECRUTMENT AND LINKAGE ACTIVITIES" ,
"MANAGEMENT CONSULTANCY SERVICES" ,
"MARKET RESEARCH AND PUBLIC OPINION POLLING" ,
"MEDIA ENTERTAINMENT PRODUCTION AND DISTRIBUTION" ,
"MICRO FINANCE INSTITUTIONS" ,
"MINING CONSULTING ENGINEERS" ,
"MOTOR VECHICLES" ,
"NEWSPAPERS, JOURNALS AND PERIODICALS DISTRIBUTER" ,
"NEWSPAPERS, JOURNALS AND PERIODICALS PUBLISHER" ,
"OCCUPATIONAL SAFETY & HEALTH CONTROL CONSULTANCY" ,
"OTHER BROKERS (INTERMEDIARY)DUTIES" ,
"OTHER COMPUTER RELATED ACTIVITIES" ,
"Other passenger transport, including the renting of passenger motor vehicles with drivers ." ,
"OTHER PRINTING SERVICES" ,
"PACKAGING ACTIVITIES" ,
"PHOTOGRAPHIC ACTIVITIES" ,
"PRINTING" ,
"PRINTING AND RELATED ACTIVITIES" ,
"PRODUCT CERTIFICATION" ,
"PROFESSIONAL CONSULTANCY SERVICES" ,
"PROPERTY MANAGEMENT" ,
"PROPERTY OWNING AND LETTING" ,
"PUBLISHING SERVICE OF BOOKS, BROCHURES AND MUSICAL BOOKS" ,
"PULSES/CEREALS" ,
"REAL ESTATE AND BUSINESS SERVICE" ,
"REAL ESTATE DEVELOPMENT DISTRIBUTION AND INDUSTRY PARKS DEVELOPMENT INTO LOTS ACTIVITIES" ,
"RENTING OF AGRICULTURAL MACHINERY AND EQUIPMENT" ,
"Renting of building" ,
"RENTING OF CONSTRUCTION AND CIVIL ENGINEERING MACHINERY AND EQUIPMENT" ,
"RENTING OF LAND TRANSPORT ( CAR) EQUIPMENT" ,
"RENTING OF PERSONAL AND HOUSEHOLD GOODS" ,
"RENTING SERVICE OF MACHINERIES AND EQUIPMENTS" ,
"RESEARCH" ,
"RESEARCH AND EXPERIMENTAL DEVELOPMENT ON ECONOMY AND DEVELOPMENT" ,
"RUBBER, PLASTICS AND PLASTIC PRODUCTSAND BATTERIES" ,
"SECURITY ACTIVITIES" ,
"SECURITY AND CLEANING SERVICE" ,
"SOFTWARE" ,
"SOFTWARE DESIGN, DEVELOPMENT AND IMPLEMENTATION/COMPUTER NETWORK DESIGN AND INSTALLATION" ,
"SOFTWARE DEVELOPMENT ( INCLUDING DESIGN, ENRICHMENT AND IMPLEMENTATION)" ,
"SOLAR ENERGY EQUIPMENTS" ,
"SPECIAL EVENT ORAGANIZTION ACTIVITIES" ,
"STORAGE AND WAREHOUSING" ,
"SUBLETTING/RENTING OF BUILDING(FIXED PROPERTY)AND HOUSES" ,
"SUBLETTING/RENTING OF FIXED PROPERTY" ,
"SYSTEM CERTIFICATION" ,
"TAILORING" ,
"TOUR OPERATORS" ,
"TRAINING/CONSULTANCY SERVICE INFORMATION AND COMMUNICATION TECHNOLOGY" ,
"TRAVEL AGENCY REPRESENTATION AND ONLINE TRAVEL AGENCY ACTIVITY" ,
"URBAN PLANNING AND RELATED CONSULTANCY" ,
     ];
 final slideImages = [
   "assets/images/business_lists/adv_logo/1.jpg",
   "assets/images/business_lists/adv_logo/2.jpg",
   "assets/images/business_lists/adv_logo/3.jpg",
   "assets/images/business_lists/adv_logo/4.jpg",
   "assets/images/business_lists/adv_logo/5.jpg",
   "assets/images/business_lists/adv_logo/7.jpg",
   "assets/images/business_lists/adv_logo/8.jpg",
   "assets/images/business_lists/adv_logo/9.jpg",
   "assets/images/business_lists/adv_logo/10.jpg",
   "assets/images/business_lists/adv_logo/11.jpg",
     "assets/images/business_lists/adv_logo/12.jpg",
     "assets/images/business_lists/adv_logo/13.jpg",
     "assets/images/business_lists/adv_logo/14.jpg",
     "assets/images/business_lists/adv_logo/15.jpg",
     "assets/images/business_lists/adv_logo/16.jpg",
     "assets/images/business_lists/adv_logo/17.jpg",
     "assets/images/business_lists/adv_logo/18.jpg",
     "assets/images/business_lists/adv_logo/19.jpg",
     "assets/images/business_lists/adv_logo/20.jpg",
     "assets/images/business_lists/adv_logo/21.jpg",
     "assets/images/business_lists/adv_logo/22.jpg",
     "assets/images/business_lists/adv_logo/23.jpg",
     "assets/images/business_lists/adv_logo/24.jpg",
     "assets/images/business_lists/adv_logo/25.jpg",
     "assets/images/business_lists/adv_logo/26.jpg",
     "assets/images/business_lists/adv_logo/27.jpg",
     "assets/images/business_lists/adv_logo/28.jpg",
     "assets/images/business_lists/adv_logo/29.jpg",
     "assets/images/business_lists/adv_logo/30.jpg",
     "assets/images/business_lists/adv_logo/31.jpg",
     "assets/images/business_lists/adv_logo/32.jpg",
     "assets/images/business_lists/adv_logo/33.jpg",
     "assets/images/business_lists/adv_logo/34.jpg",
     "assets/images/business_lists/adv_logo/35.jpg",
     "assets/images/business_lists/adv_logo/36.jpg",
     "assets/images/business_lists/adv_logo/37.jpg",
     "assets/images/business_lists/adv_logo/38.jpg",
     "assets/images/business_lists/adv_logo/39.jpg",
     "assets/images/business_lists/adv_logo/40.jpg",
     "assets/images/business_lists/adv_logo/41.jpg",
     "assets/images/business_lists/adv_logo/42.jpg",
     "assets/images/business_lists/adv_logo/43.jpg",
  ];
   final _searchController = TextEditingController();
  String _searchTerm = '';
  Stream<DatabaseEvent>? _userStream;

  @override
  void initState() {
    super.initState();
    try {
    _userStream = FirebaseDatabase.instance.ref('Query10').onValue;
  } on FirebaseException catch (e) {
    print('Firebase error: ${e.code} - ${e.message}');
    // Handle the error appropriately, potentially display a user-friendly message
  }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchCompany(String searchTerm) {
    setState(() {
      _searchTerm = searchTerm.toLowerCase();
    });
  }
  @override
  
  Widget build(BuildContext context) {
  
  //    [
  //      "assets/images/business_lists/5.svg",
  // ];
  
     title.sort((a,b)=>a.compareTo(b));
    List <String> categories = List .generate(title.length, (index) => 
    "assets/images/business_lists/14.svg"
    );

  final List<Map<String, String>> businessCompanyProfile = [
 
   
   ];
     var scaffold = Scaffold(
      //  drawer:const BackButton(
      //   //  backgroundColor: Colors.white,
      //  ),
      
       





   

     appBar: 
     
     AppBar(
        backgroundColor:Colors.white,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed:()=>{
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Business() ),

            ),
            }
          ),
      
        // padding: const EdgeInsets.all(16.0), // Add padding on all sides
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0), // Set border radius
    ),
       
        title:const Text(
          'Business Service',
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
              
    
            // SvgPicture.asset('assets/images/Adv_slider.svg'),
            // Slider(value: value, onChanged: onChanged),
           NestedScrollView(
            headerSliverBuilder:(context, innerChildOverscrollIndicator)=> [
           const SliverAppBar(
            automaticallyImplyLeading: false,
            collapsedHeight: 300,
            expandedHeight: 300,
            flexibleSpace: Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20,bottom: 16),
              child: Business_Top_List(index: 13),
            ),
          )
      ],
             body: Column(
              children: [
                
             
             
      //        Padding(
      //         padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 16),
      //         child: TextField(
      //        onChanged: (value) {
      //                                     setState(() {
      //                                       _query = value.toLowerCase();
      //                                     });},
      //   maxLines: 1,
      //   // controller: _searchController,
      //   decoration: InputDecoration(
      //     contentPadding: const EdgeInsets.only(left: 20.0),
      //     filled: true,
      //     fillColor: Color.fromARGB(255, 229, 234, 232),
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(50),
      //       borderSide: BorderSide.none,
      //     ),
      //     // contentPadding: EdgeInsets.all(1),
      //     hintText: 'Search Business',
      //     // suffixIcon: widget.filter? _buildSuffixIcon():null,
      //   ),
      // ),
      //       ),
             
                //  const Padding(
                //         padding: EdgeInsets.only(left: 20.0,right: 20,bottom: 16),
                //         child: SearchFieldBusiness(),
                //       ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 16),
                     child: GridView.builder(
                             itemCount: _filteredItems.length,
                             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 3, // Number of columns
                               crossAxisSpacing: 20.0, // Spacing between columns
                               mainAxisSpacing: 10.0, 
                               childAspectRatio: 120/160 // Spacing between rows
                             ),
                             itemBuilder: (context, index) {
                               final item = categories[index];
                               return GestureDetector(
                                 child: Column(
                                   children: [
                                     Container(
                                      decoration: BoxDecoration(
                                                   color:Color.fromARGB(255, 229, 234, 232) ,
                                                   border: Border.all(
                                                     color: Colors.white,
                                                     width: 1.0,
                                                   ),
                                                   borderRadius: BorderRadius.circular(20.0),
                                                 ),
                                      height: 94,
                                      width: 94,
                                       child: Center(
                                         child:SvgPicture.asset(item)
                                       ),
                                     ),
                                     Text(_filteredItems[index],
                                      style: TextStyle(fontSize: 12,),
                                      textAlign: TextAlign.center,
                                     maxLines: 2,
                    overflow: TextOverflow.ellipsis,)
                                   ],
                                 ),
                              
                              onTap: () {
                                                       
                                    
                                          Navigator.push(
                                    context,
                                    TransparentRoute(
                        page:  Real_Estate_listing(index: index,title:title[index],businessCompanyProfile: businessCompanyProfile),
                              ),
                                  );
                                     }                 
                               
                                                        
                                 
                               );
                             },
                           ),
                   ),
             
             
             
             
                 ),
              
             
             
             
               ]
             ),
           ), 
           // Define scrollable grid
          
                                
  
         
       
          bottomNavigationBar:const CustomeButtomNavBar(index: 2,),


     
    );
    return scaffold;
  }
List<String> get _filteredItems => title
      .where((item) => item.toLowerCase().startsWith(_query))
      .toList();
 Widget buildImage(String urlImage,int index)=>
          Container(
                 margin: EdgeInsets.symmetric(horizontal:5),
                 child:Image.asset(urlImage,fit: BoxFit.cover,),
          ); 
}