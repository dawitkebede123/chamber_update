import 'package:carousel_slider/carousel_slider.dart';
import 'package:chamber_of_commerce/pages/user/Business.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Agriculture/Agriculture_Listing.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Export/Export_Listing.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Import/Import_Options.dart';
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


class Maintenance_Home extends StatefulWidget {
  const Maintenance_Home({super.key});
  @override
  State<Maintenance_Home> createState() => _Agriculture_HomeState();
}

class _Agriculture_HomeState extends State<Maintenance_Home> {
  String _query = '';
   List <String> title = [
    "INSTALLATION, AND FIXING OF ALUMINUM WINDOWS AND DOORS/ ALUMINUM WORKS" ,
"MULTI PURPOSE VEHICLES AND PARTS MAINTENANCE" ,
"INSTALLATION AND MAINENANCE SERVICES" ,
"INSTALLATION, AND MAINTENANCE SERVICES" ,
"SIMPLE, MEDIUM AND HEAVY TRACKS REPAIR AND MAINTENANCE" ,
"SPECIAL CARS AND VEHICLES BODY REPAIR" ,
"COMPUTER AND COMPUTER ACCESSORIES MAINTENANCE" ,
"INSTALLATION AND MAINTENANCE OF MACHINERIES" ,
"OTHER GOODS THAT USED FOR PUBLIC AND PERSONAL PURPOSE" ,
"MAINTENANCE AND REPAIR OF OFFICE, ACCOUNTING AND COMPUTING MACHINERY" ,
"RUBBER MAINTENANCE,CLEAN GREASE AND RELATED SERVICE" ,
"TELECOMMUNICATION EQUIPMENTS/ACCESSORIES/SALES/MAINTENANCE" ,
"Tyre Repairs" ,
"ELECTRICAL REPAIRS" ,
"CHEMICALS AND CHEMICAL PRODUCTS" ,
"AUTOMOTIVE FUEL & LUBRICANTS IN GAS STATION /CAR WASH SERVICE" ,
"GOODS USED FOR PUBLIC AND PERSONAL PURPOSE" ,
"RADIATION EMITTING EQUIPMENT'S INSTALLATION,COMMISSIONING MAINTENANCE" ,
"INSTALLATION AND MAINTENANCE OF COMMUNICATION AND ELECTRONIC EQUIPMENTS" ,
"FUEL STATION EQUPEMENTS" ,
"IMPORTING OF VEHICLES" ,
"HOUSEHOLD AND OFFICE FURNITURE, REQUZITE, BOARDS, APPLIANCES" ,
"MOTOR CYCLE, BICYCLE AND TRI CYCLE (BAJAJ) PARTS AND ACCESSORIES" ,
"MAINTENANCE AND REPAIR OF FOOT WARE AND LEATHER PRODUCTS" ,
"USED MOTOR VEHICLES" ,
"IMPORTING OF VEHICLES SPARE PARTS,REGULATORY EQUIPMENTS AND JEWELRY/DECOR SUPPLIES" ,
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
"MOTION PICTURE, THEATRE AND VIDEO PRODUCTION AND DISTRIBUTION" ,
"FILM PRODUCTION" ,
"SERVICE OF REGULAR HIGHER EDUCATION" ,
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
"DRIVING EDUCATION BOTH IN REGULAR AND BY SPECIAL MACHINERIES" ,
"INTERNET CAFÉ" ,
"WASHING AND DRY-CLEANING OF TEXTILES AND FUR PRODUCTS" ,
"SANITARYWARE AND COSMOTICS" ,
"RETAIL TRADE OF FOOT WEAR, LEATHER AND RELATED PRODUCTS" ,
"Men's hairdressing service" ,
"ARTS FESTIVAL( MUSIC,FILM, THEATRE,GALLERY AND OTHER)" ,
"MEDIA ENTERTAINMENT PRODUCTION AND DISTRIBUTION" ,
"TRADITIONAL MEDICAL SERVICE" ,
"MUSIC AND BAND ACTIVITIES" ,
"CUSTOMS CLEARANCE" ,
"SERVICE OF PRIMARY AND SECONDARY EDUCATION" ,
"DIAGNOSTIC LABORATORY" ,
"TOPOGRAPHIC BEAUTY" ,
"STUDIO RECORDING SERVICE" ,
"GENERAL HOSPITAL" ,
"BROAD CAST EQUIPMENTS TELEVISION AND RADIO RECEIVERS, SOUND OR VIDEO RECORDING OR REPRODUCING APPARATUS AND ASSOCIATED GOODS" ,
"COMMISSION/BROKERS BUSINESS ACTIVITIES" ,
"SECURITY AND CLEANING SERVICE" ,
"POULTRY" ,
"FLOURICULTURE" ,
"FLORICULTURE" ,
"GROWING OF HERBS AND OTHERS" ,
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
"ELECTRICAL EQUIPMENTS AND APPLIANCES" ,
"NEW MOTOR VEHICLES" ,
"COMMUNICATION, COMPUTER AND RELATED EQUIPMENT" ,
"BASIC CHEMICALS, EXCEPT FERTILIZERS" ,
"DYEING, TANNING AND COLORING MATERIALS" ,
"PETROCHEMICAL/VASELINE, GRYCYLINE ETC/ PRODUCTS" ,
"PLASTICS IN PRIMARY FORMS AND NON-PRIMARY FORMS" ,
"INDUSTRIAL MACHINERY , EQUIPMENT AND ITS SPARE PARTS" ,
"APPAREL AND CLOTHING" ,
"LEATHER PRODUCTS" ,
"HUMAN HEALTH MEDICAL SUPPLIES AND EQUIPMENTS" ,
"COMPUTER AND COMPUTER ACCESSORIES AND PERIPHERAL EQUIPMENT" ,
"VEHICLES BODIES AND TRAILERS" ,
"CEMENTS" ,
"CONSTRUCTION MATERIALS, HARDWARE, PLUMBING" ,
"GENERAL HARDWARE" ,
"PAINTS (INCLUDING VARNISHES,ADEHASIVE,GLUES AND SUPPLIES)" ,
"STRUCTURAL CLAY AND CONCRETE PRODUCTS" ,
"IMPORT TRADE IN CHEMICALS FOR AGRICULTURAL INPUT" ,
"BASIC INDUSTRIAL CHEMICALS" ,
"METAL ,NON METALS, METAL ORES AND SCRAPS" ,
"IMPORT TRADE IN MATERIAL METAL AND NON METAL SCRAPS" ,
"LOGS AND TIMBER" ,
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
    "assets/images/business_lists/10.svg"
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
          'Maintenance',
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
              child: Business_Top_List(index: 11),
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
                        page:  Import_listing(index: index,title:title[index],businessCompanyProfile: businessCompanyProfile),
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