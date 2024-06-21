import 'package:carousel_slider/carousel_slider.dart';
import 'package:chamber_of_commerce/pages/user/Business.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Agriculture/Agriculture_Listing.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Export/Export_Listing.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Transport/Transport_Listing.dart';
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


class Transport_Home extends StatefulWidget {
  const Transport_Home({super.key});
  @override
  State<Transport_Home> createState() => _Transport_HomeState();
}

class _Transport_HomeState extends State<Transport_Home> {
  String _query = '';
   List <String> title = [
  "FREIGHT FORWARDERS AND HARBOUR WORKS" ,
"ACTIVITIES OF AIR TRANSPORT" ,
// "" ,
"OTHER FREIGHT TRANSPORT BY ROAD" ,
"CUSTOMS CLEARANCE" ,
"FREIGHT FORWARDERS" ,
"TOUR OPERATORS" ,
"TELECOMMUNICATION VALUE ADDED SERVICES" ,
"TAXIS" ,
"TELECOMMUNICATION" ,
"LOCAL LABOR RECRUTMENT AND LINKAGE ACTIVITIES" ,
"SECURITY AND CLEANING SERVICE" ,
"FREIGHT TRANSPORT BY CONTAINER" ,
"TRANSPORT OF FUEL" ,
// "Sub-Sector" ,
"TELECOMMUNICATION TERMINAL EQUIPMENTS MAINTENANCE" ,
"TRAVEL AGENCY REPRESENTATION AND ONLINE TRAVEL AGENCY ACTIVITY" ,
"TRANSPORT SERVICE BY ROAD AND DRY FREIGHT" ,
"TRANSPORT OF CARGO TRUCKS" ,
"LAND TRANSPORT AND RELATED SERVICES" ,
"STORAGE AND WAREHOUSING" ,
"EVENT ORGANIZERS" ,
"TRANSPORT OF DIFFERENT CAR BY CRANES OR PULLING OR LOADING" ,
"Parking garages and parking lots" ,
"Operation of roads and toll roads" ,
"LIQUID FREIGHT TRANSPORT SERVICE" ,
"URBAN, SUB URBAN AND INTER-URBAN BUS AND COACH PASSENGER LINES" ,
"TRAVEL AGENT" ,
"SHIP AGENTS" ,
"INTER-URBAN RAILWAY TRANSPORT" ,
"GROUND HANDLING" ,
"OTHER POSTAL AND RELATED COURIER ACTIVITIES" ,
"COURIER ACTIVITIES OTHER THAN NATIONAL POSTAL ACTIVITIES" ,
"CROSS-COUNTRY PUBLIC TRANSPORT" ,
"TRANSPORT OF CONSTRUCTION MATERIALS" ,
"RETAIL TRADE OF VEHICLES" ,
"TRANSPORT AGENCIES" ,
"TOURISM PROMOTION" ,
"HOUSHOLDS INCLUDING MATTRESSES,CUSHIONS,BLANKETS ETC" ,
"Trade Promotion Service" ,
"BROKER IN VEHICLES RENTING AND SAILING" ,
"ABROAD RECRUITMENT AND LINKAGE ACTIVITIES" ,
"SPECIAL EVENT ORAGANIZTION ACTIVITIES" ,
"SALVAGING OF DISTRESSED VESSELS AND CARGOS" ,
"TELECOMMUNICATION VALUE ADDED SERVICE" ,
"CONSTRUCTION MATERIALS, HARDWARE, PLUMBING" ,
"COMMISSION/BROKERS BUSINESS ACTIVITIES" ,
"INSTALLATION OF ELECTRIC LINE" ,
"DISTRIBUTION AND SALES OF ELECTRICITY" ,
"ELECTRICITY,GAS,STEAM AND HOT WATER SUPPLY" ,
"DRY WASTE REMOVING" ,
"GENERATION OF ELECTRIC ENERGY FROM RENEWABLE SOURCES" ,
"BUILDING WORKS CONTRACTOR" ,
"GENERAL CONTRACTOR" ,
"WATER WORKS CONTRACTOR" ,
"CONSTRUCTION OF WATER WORKS" ,
"SPRAYING OF PESTICIDES FOR HOUSHOLD PURPOSES" ,
"SPINNING, WEAVING AND FINISHING OF TEXTILES" ,
"GRAIN MILL SERVICE" ,
"DIFFERENT EVENTS DECORATING ACTIVITIES" ,
"CLINICS AND RELATED HEALTH CARE SERVICES" ,
"CONSULTANCY SERVICE FOR ECONOMIC DEVELOPMENT" ,
"SHORT TERM TCHNICAL EDUCATION AND TRAINING" ,
"DECORATING ACTIVITIES" ,
"LADIES HAIR DRESSING SERVICE" ,
"MIDDLE CLINIC SERVICE" ,
"PRINTING" ,
"BEAUTY TREATMENT/BATH AND MASSAGE" ,
"MOTION PICTURE, THEATRE AND VIDEO PRODUCTION AND DISTRIBUTION" ,
"FILM PRODUCTION" ,
"SPORTING AND RECREATIONAL ACTIVITIES" ,
"CONSULTANCY ACTIVITY ON ADVERTISING" ,
"NEWSPAPERS, JOURNALS AND PERIODICALS DISTRIBUTER" ,
"MANAGEMENT CONSULTANCY SERVICES" ,
"QUALITY MANAGEMENT SYSTEM CONSULTANCY" ,
"ACTIVITIES OF PROFESSIONAL ORGANIZATIONS" ,
"SERVICE OF PRE-PRIMARY EDUCATION AND AFTER SCHOOL" ,
"MEDIA PROGRAM PREPARATION BY AIR TIME RENT" ,
"EDUCATION BY TECHNICAL COLLEGES AND TECHNICAL INSTITUTIONS" ,
"CHILD DAY CARE SERVICE" ,
"EDUCATION RELATED SERVICES" ,
"TAILORING" ,
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
"SANITARYWARE AND COSMOTICS" ,
"RETAIL TRADE OF FOOT WEAR, LEATHER AND RELATED PRODUCTS" ,
"Men's hairdressing service" ,
"ARTS FESTIVAL( MUSIC,FILM, THEATRE,GALLERY AND OTHER)" ,
"MEDIA ENTERTAINMENT PRODUCTION AND DISTRIBUTION" ,
"TRADITIONAL MEDICAL SERVICE" ,
"MUSIC AND BAND ACTIVITIES" ,
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
"OIL SEEDS FARMING" ,
"PEST CONTROL" ,
"FRUITS FARMING" ,
"VEGETABLES FARMING" ,
"VEGETABLE,FRUIT,PLANT AND PLANT SEED PRODUCTION" ,
"GROWING OF CEREALS" ,
"BEE KEEPING" ,
"FISH HATCHERIES AND FISH FARMS" ,
"Farming of cattle, sheep, goats, horses, asses, mules and hinnies; dairy farming" ,
"COFFEE FARMING" ,
"WOOL, HIDES, SKINS AND FEATHERS" ,
"FRUITS & VEGETABLES" ,
"LEATHER, LEATHER PRODUCTS, FOOTWEAR AND RELATED PRODUCTS" ,
"METAL AND NON METAL SCRAPS" ,
"RUBBER, PLASTICS AND PLASTIC PRODUCTSAND BATTERIES" ,
"STATIONARY MATERIALS, PAPER AND PAPER PRODUCTS" ,
"TEXTILE FIBER,COTTON,THREAD AND APPAREL" ,
"IMPORTING OF VEHICLES" ,
"IMPORTING OF VEHICLES SPARE PARTS,REGULATORY EQUIPMENTS AND JEWELRY/DECOR SUPPLIES" ,
"ELECTRICAL EQUIPMENTS AND APPLIANCES" ,
"NEW MOTOR VEHICLES" ,
"COMMUNICATION, COMPUTER AND RELATED EQUIPMENT" ,
"BASIC CHEMICALS, EXCEPT FERTILIZERS" ,
"DYEING, TANNING AND COLORING MATERIALS" ,
"PETROCHEMICAL/VASELINE, GRYCYLINE ETC/ PRODUCTS" ,
"PLASTICS IN PRIMARY FORMS AND NON-PRIMARY FORMS" ,
"INDUSTRIAL MACHINERY , EQUIPMENT AND ITS SPARE PARTS" ,
"USED MOTOR VEHICLES" ,
"APPAREL AND CLOTHING" ,
"LEATHER PRODUCTS" ,
"HUMAN HEALTH MEDICAL SUPPLIES AND EQUIPMENTS" ,
"COMPUTER AND COMPUTER ACCESSORIES AND PERIPHERAL EQUIPMENT" ,
"VEHICLES BODIES AND TRAILERS" ,
"CEMENTS" ,
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
    "assets/images/business_lists/13.svg"
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
          'Transport',
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
              child: Business_Top_List(index: 4),
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
                        page:  Transport_listing(index: index,title:title[index],businessCompanyProfile: businessCompanyProfile),
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