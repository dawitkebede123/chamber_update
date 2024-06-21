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
   "FIXED PROPERTY SUBLETTING/RENTING ACTIVITITIES" ,
"REAL ESTATE DEVELOPMENT DISTRIBUTION AND INDUSTRY PARKS DEVELOPMENT INTO LOTS ACTIVITIES" ,
"BUSINESS AND MANAGEMENT CONSULTANCY ACTIVITIES" ,
"CONSULTANCY SERVICE ON CONSTRUCTION SERVICE" ,
"CONSULTING ENGINEERS" ,
"DEVELOPING REAL ESTATE, SUBDIVIDING REAL ESTATE INTO LOTS AND RESIDENTIAL DEVELOPMENT" ,
"ADVERTISING" ,
"CONSULTANCY SERVICE FOR INVESTMENT" ,
"CONSULTANCY SERVICE FOR TAX AND FINANCE" ,
// "" ,
"PROFESSIONAL CONSULTANCY SERVICES" ,
"CONSTRUCTION RELATED PROFESSIONAL CONSULTANCY SERVICES" ,
"AUTHORIZED ACCOUNTANT" ,
"RENTING OF CONSTRUCTION AND CIVIL ENGINEERING MACHINERY AND EQUIPMENT" ,
"PROPERTY OWNING AND LETTING" ,
"ACTIVITIES OF COST AND MANAGEMENT ACCOUNTANTS" ,
"SUBLETTING/RENTING OF BUILDING(FIXED PROPERTY)AND HOUSES" ,
"Sub-Sector" ,
"SOFTWARE DESIGN, DEVELOPMENT AND IMPLEMENTATION/COMPUTER NETWORK DESIGN AND INSTALLATION" ,
"CONSULTANCY SERVICE FOR SOCIAL AFFAIRS" ,
"RENTING SERVICE OF MACHINERIES AND EQUIPMENTS" ,
"GIS WORKS SERVICE" ,
"Renting of building" ,
"PHOTOGRAPHIC ACTIVITIES" ,
"ACTIVITIES OF EMPLOYMENT AGENCIES AND RECRUITING ORGANIZATIONS" ,
"CONSULTANCY ACTIVITY ON ADVERTISING" ,
"MANAGEMENT CONSULTANCY SERVICES" ,
"COMPUTER NETWORK DESIGN AND CABLE INSTALATION" ,
"CONSULTING ARCHITECTS" ,
"PRINTING AND RELATED ACTIVITIES" ,
"ADVERTISING BY BROADCAST MEDIA" ,
"FINANCE AND ADMINISTRATION SERVICES" ,
"RENTING OF LAND TRANSPORT ( CAR) EQUIPMENT" ,
"INSPECTION" ,
"NEWSPAPERS, JOURNALS AND PERIODICALS PUBLISHER" ,
"RENTING OF AGRICULTURAL MACHINERY AND EQUIPMENT" ,
"NEWSPAPERS, JOURNALS AND PERIODICALS DISTRIBUTER" ,
"BUILDING, INDUSTRIES, AIRPLANE, RESIDENT HOUSE AND OTHER RELATED CLEANING ACTIVITIES" ,
"HOTEL & TOURISM CONSULTANCY" ,
"ABROAD RECRUITMENT AND LINKAGE ACTIVITIES" ,
"RENTING OF PERSONAL AND HOUSEHOLD GOODS" ,
"FOREIGN TRADE AGENT" ,
"CONSTRUCTION MATERIALS HARDWARE, PLUMBING AND HEATING EQUIPMENT AND SUPPLIES" ,
"OTHER COMPUTER RELATED ACTIVITIES" ,
"CONSTRUCTION AND RELATED SPECIALIZED CONSULTANCY SERVICES" ,
"CONSULTANCY SERVICE ON ELECTRICAL ENGINEERING" ,
"COMMERCIAL REPRESENTATIVE" ,
"SECURITY AND CLEANING SERVICE" ,
"DATA BASE ACTIVITIES AND DATA PROCESSING" ,
"DATA CENTER/HOSTING" ,
"INFORMATION COMMUNICATION TECHNOLOGY CONSULTANCY SERVICES" ,
"SECURITY ACTIVITIES" ,
"PRINTING" ,
"PULSES/CEREALS" ,
"TRAINING/CONSULTANCY SERVICE INFORMATION AND COMMUNICATION TECHNOLOGY" ,
"CONSULTANCY SERVICE ON CHEMICAL ENGINEERING" ,
"CONSULTANCY SERVICE ON MECHANICAL ENGINEERING" ,
"LADIES HAIR DRESSING SERVICE" ,
"CONSULTANCY SERVICE ON WATER WORKS" ,
"URBAN PLANNING AND RELATED CONSULTANCY" ,
"BROKERS DUTIES" ,
"AUTHORIZED AUDITOR" ,
"MARKET RESEARCH AND PUBLIC OPINION POLLING" ,
"COMMISSION/BROKERS BUSINESS ACTIVITIES" ,
"PACKAGING ACTIVITIES" ,
"CONSULTATION OF WATER WORKS" ,
"SYSTEM CERTIFICATION" ,
"INDUSTRIAL CONSULTING ENGINEER" ,
"HISTORIC CITES AND BUILDINGS FOR RECREATION AND CARE SERVICES" ,
"REAL ESTATE AND BUSINESS SERVICE" ,
"CONSULTANCY SERVICE FOR ECONOMIC DEVELOPMENT" ,
"LOCAL ACTIVITIES OF EMPLOYMENT AGENCIES AND RECRUITING ORGANIZATIONS" ,
"SUBLETTING/RENTING OF FIXED PROPERTY" ,
"CONVEYANCES" ,
"CONSULTANCY SERVICE ON FOOD AND BEVERAGES PREPARATION" ,
"DOMESTIC TRADE AGENT" ,
"LOGISTICS,SUPPLIES AND SUPPORTIVE ACTIVITIES" ,
"QUALITY MANAGEMENT SYSTEM CONSULTANCY" ,
"PRODUCT CERTIFICATION" ,
"INTERNATIONAL BID" ,
"CONSULTANCY SERVICE FOR BUSINESS AND INVESTMENT" ,
"SPECIAL EVENT ORAGANIZTION ACTIVITIES" ,
"ASSET VALUATION" ,
"MINING CONSULTING ENGINEERS" ,
"SOFTWARE" ,
"LOCAL LABOR RECRUTMENT AND LINKAGE ACTIVITIES" ,
"OTHER PRINTING SERVICES" ,
"RESEARCH" ,
"TOUR OPERATORS" ,
"Other passenger transport, including the renting of passenger motor vehicles with drivers ." ,
"CONSTRUCTION SITE PREPARATION CONTRACTOR" ,
"CONSULTANCY SERVICE ON NUTRITION" ,
"CONSULTANCY SERVICE ON EDUCATION" ,
"TAILORING" ,
"MICRO FINANCE INSTITUTIONS" ,
"OTHER BROKERS (INTERMEDIARY)DUTIES" ,
"SOLAR ENERGY EQUIPMENTS" ,
"CERTIFIED ACCOUNTANT" ,
"TAX AGENT" ,
"SOFTWARE DEVELOPMENT ( INCLUDING DESIGN, ENRICHMENT AND IMPLEMENTATION)" ,
"RUBBER, PLASTICS AND PLASTIC PRODUCTSAND BATTERIES" ,
"COMPUTER AND COMPUTER ACCESSORIES MAINTENANCE" ,
"HEALTH CONSULTANCY SERVICE" ,
"DIFFERENT EVENTS DECORATING ACTIVITIES" ,
"MEDIA ENTERTAINMENT PRODUCTION AND DISTRIBUTION" ,
"COMPUTER RELATED ACTIVITIES" ,
"STORAGE AND WAREHOUSING" ,
"COFFEE AND TEA" ,
"CONSULTANCY SERVICE FOR STATISTICAL WORK" ,
"FRESH FRUITS & VEGETABLES" ,
"MOTOR VECHICLES" ,
"COMMUNICATION, COMPUTER AND RELATED EQUIPMENT" ,
"TRAVEL AGENCY REPRESENTATION AND ONLINE TRAVEL AGENCY ACTIVITY" ,
"ACTIVITIES AUXILIARY TO PENSION FUNDING" ,
"CONSTRUCTION MATERIALS" ,
"GENERAL CONTRACTOR" ,
"PUBLISHING SERVICE OF BOOKS, BROCHURES AND MUSICAL BOOKS" ,
"OCCUPATIONAL SAFETY & HEALTH CONTROL CONSULTANCY" ,
"INSTALLATION AND MAINENANCE SERVICES" ,
"CONSULTANCY SERVICE ON MINIMG ENGINEERING" ,
"INSTALLATION OF ELECTRIC LINE" ,
"DISTRIBUTION AND SALES OF ELECTRICITY" ,
"ELECTRICITY,GAS,STEAM AND HOT WATER SUPPLY" ,
"DRY WASTE REMOVING" ,
"GENERATION OF ELECTRIC ENERGY FROM RENEWABLE SOURCES" ,
"BUILDING WORKS CONTRACTOR" ,
"WATER WORKS CONTRACTOR" ,
"CONSTRUCTION OF WATER WORKS" ,
"SPRAYING OF PESTICIDES FOR HOUSHOLD PURPOSES" ,
"SPINNING, WEAVING AND FINISHING OF TEXTILES" ,
"GRAIN MILL SERVICE" ,
"CLINICS AND RELATED HEALTH CARE SERVICES" ,
"SHORT TERM TCHNICAL EDUCATION AND TRAINING" ,
"DECORATING ACTIVITIES" ,
"MIDDLE CLINIC SERVICE" ,
"BEAUTY TREATMENT/BATH AND MASSAGE" ,
"MOTION PICTURE, THEATRE AND VIDEO PRODUCTION AND DISTRIBUTION" ,
"FILM PRODUCTION" ,
"SERVICE OF REGULAR HIGHER EDUCATION" ,
"ACTIVITIES OF PROFESSIONAL ORGANIZATIONS" ,
"SERVICE OF PRE-PRIMARY EDUCATION AND AFTER SCHOOL" ,
"MEDIA PROGRAM PREPARATION BY AIR TIME RENT" ,
"EDUCATION BY TECHNICAL COLLEGES AND TECHNICAL INSTITUTIONS" ,
"CHILD DAY CARE SERVICE" ,
"EDUCATION RELATED SERVICES" ,
"LAUNDRY SERVICE" ,
"BOOKS AND STATIONARY MATERIALS" ,
"FILM PRODUCTION, CINEMA HAL, FILM STUDIO AND FILM CAPTURING" ,
"EDUCATION BY TECHNIQUES AND TRANING" ,
"MENS AND LADIES HAIRDRESSING" ,
"RESTAURANTS" ,
"PICTURE, SCULPTURE,GALLERY/ STUDIO SERVICE" ,
"DRIVING EDUCATION" ,
"TRANSLATION & SECRETARIAL SERVICES" ,
"DRIVING EDUCATION BOTH IN REGULAR AND BY SPECIAL MACHINERIES" ,
"INTERNET CAFÉ" ,
"WASHING AND DRY-CLEANING OF TEXTILES AND FUR PRODUCTS" ,
"SANITARYWARE AND COSMOTICS" ,
"RETAIL TRADE OF FOOT WEAR, LEATHER AND RELATED PRODUCTS" ,
"Men's hairdressing service" ,
"ARTS FESTIVAL( MUSIC,FILM, THEATRE,GALLERY AND OTHER)" ,
"TRADITIONAL MEDICAL SERVICE" ,
"SERVICE OF PRIMARY AND SECONDARY EDUCATION" ,
"DIAGNOSTIC LABORATORY" ,
"TOPOGRAPHIC BEAUTY" ,
"STUDIO RECORDING SERVICE" ,
"GENERAL HOSPITAL" ,
"BROAD CAST EQUIPMENTS TELEVISION AND RADIO RECEIVERS, SOUND OR VIDEO RECORDING OR REPRODUCING APPARATUS AND ASSOCIATED GOODS" ,
"POULTRY" ,
"FLOURICULTURE" ,
"FLORICULTURE" ,
"GROWING OF HERBS AND OTHERS" ,
"AGRICULTURAL SUPPORT SERVICE" ,
"CATTLE AND PACK ANIMALS HUSBANDARY" ,
"TEA AND BEVERAGE ,SPICE CROPS, MEDICINAL AND AROMATIC CROPS FARMING" ,
"COTTON FARMING" ,
"GROWING OF CROPS COMBINED WITH FARMING OF ANIMALS (MIXED FARMING)" ,
"CEREALS/PULSES FARMING" ,
"DIFFERENT SEEDLINGS FARMING" ,
"OIL SEEDS FARMING" ,
"PEST CONTROL" ,
"FRUITS FARMING" ,
"VEGETABLES FARMING" ,
"VEGETABLE,FRUIT,PLANT AND PLANT SEED PRODUCTION" ,
"BEE KEEPING" ,
"FISH HATCHERIES AND FISH FARMS" ,
"Farming of cattle, sheep, goats, horses, asses, mules and hinnies; dairy farming" ,
"COFFEE FARMING" ,
"WOOL, HIDES, SKINS AND FEATHERS" ,
"FRUITS & VEGETABLES" ,
"LEATHER, LEATHER PRODUCTS, FOOTWEAR AND RELATED PRODUCTS" ,
"METAL AND NON METAL SCRAPS" ,
"STATIONARY MATERIALS, PAPER AND PAPER PRODUCTS" ,
"TEXTILE FIBER,COTTON,THREAD AND APPAREL" ,
"IMPORTING OF VEHICLES" ,
"IMPORTING OF VEHICLES SPARE PARTS,REGULATORY EQUIPMENTS AND JEWELRY/DECOR SUPPLIES" ,
"ELECTRICAL EQUIPMENTS AND APPLIANCES" ,
"NEW MOTOR VEHICLES" ,
"BASIC CHEMICALS, EXCEPT FERTILIZERS" ,
"CHEMICALS AND CHEMICAL PRODUCTS" ,
"DYEING, TANNING AND COLORING MATERIALS" ,
"PETROCHEMICAL/VASELINE, GRYCYLINE ETC/ PRODUCTS" ,
"PLASTICS IN PRIMARY FORMS AND NON-PRIMARY FORMS" ,
"INDUSTRIAL MACHINERY , EQUIPMENT AND ITS SPARE PARTS" ,
"USED MOTOR VEHICLES" ,
"APPAREL AND CLOTHING" ,
"LEATHER PRODUCTS" ,
"COMPUTER AND COMPUTER ACCESSORIES AND PERIPHERAL EQUIPMENT" ,
"VEHICLES BODIES AND TRAILERS" ,
"CEMENTS" ,
"CONSTRUCTION MATERIALS, HARDWARE, PLUMBING" ,
"GENERAL HARDWARE" ,
"PAINTS (INCLUDING VARNISHES,ADEHASIVE,GLUES AND SUPPLIES)" ,
"STRUCTURAL CLAY AND CONCRETE PRODUCTS" ,
"IMPORT TRADE IN CHEMICALS FOR AGRICULTURAL INPUT" ,
"BASIC INDUSTRIAL CHEMICALS" ,
"HOUSEHOLD AND OFFICE FURNITURE, REQUZITE, BOARDS, APPLIANCES" ,
"METAL ,NON METALS, METAL ORES AND SCRAPS" ,
"IMPORT TRADE IN MATERIAL METAL AND NON METAL SCRAPS" ,
"LOGS AND TIMBER" ,
"CRUDE RUBBER" ,
"FOOD PRODUCTS" ,
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
          'Real Estate',
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