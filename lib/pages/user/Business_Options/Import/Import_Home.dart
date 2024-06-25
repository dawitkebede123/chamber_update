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


class Import_Home extends StatefulWidget {
  const Import_Home({super.key});
  @override
  State<Import_Home> createState() => _Import_HomeState();
}

class _Import_HomeState extends State<Import_Home> {
  String _query = '';
   List <String> title = [
"ACCESSORIES AND COMPONENTS FOR FINISHING TEXTILE AND LEATHER PRODUCTS" ,
"AGRICULTURAL MACHINERY AND EQUIPMENT" ,
"AGRICULTURAL PRODUCTS/CEREALS" ,
"AGRICULTURAL RAW MATERIALS" ,
"ALCOHOLIC DRINKS" ,
"ANIMAL & WASTE PRODUCTS" ,
"ANIMAL BY PRODUCTS" ,
"ANIMAL MEDICAL SUPPLIES AND EQUIPMENTS" ,
"APPAREL AND CLOTHING" ,
"BAGS, LUGGAGE’S AND RELATED PRODUCTS" ,
"BAKERY PRODUCTS" ,
"BAKERY PRODUCTS,PREPARATION OF CONFECTIONERY, INCLUDING COCOA AND CHOCOLATE" ,
"BASIC CHEMICALS, EXCEPT FERTILIZERS" ,
"BASIC INDUSTRIAL CHEMICALS" ,
"BASIC INDUSTRIAL CHEMICALS EXCEPT FERTILIZERS" ,
"BEER" ,
"BEESWAX" ,
"BEVERAGE CROPS" ,
"BEVERAGES" ,
"BICYCLES PARTS" ,
"BOOKS AND MAGAZINES" ,
"BOOKS AND STATIONARY MATERIALS" ,
"BROAD CAST EQUIPMENTS TELEVISION AND RADIO RECEIVERS, SOUND OR VIDEO RECORDING OR REPRODUCING APPARATUS AND ASSOCIATED GOODS" ,
"BROADCASTING EQUIPMENTS" ,
"BROKER IN VEHICLES RENTING AND SAILING" ,
"CANDLES AND MATCH" ,
"CANDLES AND TEWAF" ,
"CAR BATTERY" ,
"CAR DECOR" ,
"CASH REGISTER MACHINE" ,
"CEMENTS" ,
"CEREALS" ,
"CEREALS/PULSES FARMING" ,
"CHEMICAL FERTILIZERS" ,
"CHEMICALS AND CHEMICAL PRODUCTS" ,
"CHEMICALS FOR TREATMRNT, MEDICINE AND FOOD" ,
"CLEANING AND COSMOTICS" ,
"CLOCKS AND WATCHES" ,
"COAL, COKE AND BRIQUETTES" ,
"COFFEE" ,
"COFFEE AND TEA" ,
"COMMERCIAL FOOD SERVICE EQUIPMENT" ,
"COMMERCIAL REPRESENTATIVE" ,
"COMMISSION/BROKERS BUSINESS ACTIVITIES" ,
"COMMUNICATION, COMPUTER AND RELATED EQUIPMENT" ,
"COMPUTER AND COMPUTER ACCESSORIES AND PERIPHERAL EQUIPMENT" ,
"CONSTRUCTION EQUIPMENT AND ITS SPARE PARTS" ,
"CONSTRUCTION MATERIALS HARDWARE, PLUMBING AND HEATING EQUIPMENT AND SUPPLIES" ,
"CONSTRUCTION MATERIALS, HARDWARE, PLUMBING" ,
"CONSULTANCY SERVICE FOR SOCIAL AFFAIRS" ,
"COSMETICS ,ESSENTIAL OILS AND RESINOUS ,PERFUME AND CHEMICALS FOR PERFUMES" ,
"COTTON, TEXTILE FIBERS,YARN, TEXTILES AND TEXTILES CLOTHING" ,
"CROCKERY, CUTLERY AND KITCHEN UTENSILS" ,
"CRUDE RUBBER" ,
"CRUDE TYRE" ,
"DAIRY PRODUCTS" ,
"DOMESTIC TRADE AGENT" ,
"DRY CELLS" ,
"DYEING, TANNING AND COLORING MATERIALS" ,
"EDIBLE OILS & FATS" ,
"EDIBLE SALT" ,
"EDUCATION EQUIPMENT AND TOOLS" ,
"EDUCATIONAL SUPPORT EQUIPMENTS" ,
"ELECTRIC MOTORS,GENERATORS AND TRANSFORMERS" ,
"ELECTRICAL AND WIRING ACCESSORIES" ,
"ELECTRICAL EQUIPMENTS AND APPLIANCES" ,
"ELECTRICITY" ,
"ELECTRICITY DISTRIBUTION AND CONTROL APPARATUS" ,
"ELECTROMECHANICAL WORK" ,
"ELECTRONIC VALVES AND TUBES AND ELECTRONIC COMPONENTS" ,
"FABRICATED METALS" ,
"FEEDING STUFF FOR ANIMALS" ,
"FISH" ,
"FIXED PROPERTY SUBLETTING/RENTING ACTIVITITIES" ,
"FLORA FOAM" ,
"FOOD ADDITIVES" ,
"FOOD PRODUCTS" ,
"FOOD STUFF" ,
"FOOT WEAR AND LETHER GOODS" ,
"FOOTWEAR AND LEATHER GOODS" ,
"FOREIGN TRADE AGENT" ,
"FOREIGN TRADE AUXILIARY" ,
"FRESH FRUITS & VEGETABLES" ,
"FRUITS & VEGETABLES" ,
"FURNISHINGS (INCLUDING CURTAINS, CARPETS, WALL PAPER)/SANITARY TOOLS /BROOM," ,
"FURNITURE, HOME AND OFFICE FURNISHINGS AND HOUSEHOLD AND OFFICE EQUIPMENT" ,
"GARMENT AND RELATED" ,
"GAS, NATURAL AND MANUFACTURED" ,
"GENERAL HARDWARE" ,
"GENERATORS/MOTORS /COMPRESSORS/PUMPS/THEIR ACCESSORIES/PARTS" ,
"GLASS AND GLASSES PRODUCTS" ,
"GLOBAL INFORMATION SYSTEMS (GIS) EQUIPMENTS" ,
"GRAIN MILL SPARE PARTS" ,
"HEATING EQUIPMENT AND RELATED MATERIALS" ,
"HOUSE HOLD AND OFFICE FURNISHINGS AND DECORATIVE (CURTAIN, CARPET AND WALL PAPER)" ,
"HOUSE HOLD FURNITURE(BLANKET, BED SHEET, QUILT AND PILLOW)" ,
"HOUSEHOLD AND OFFICE FURNITURE, REQUZITE, BOARDS, APPLIANCES" ,
"HOUSEHOLD ELECTRICAL APPLIANCES AND EQUIPMENT" ,
"HOUSEHOLD GOODS" ,
"HOUSHOLDS INCLUDING MATTRESSES,CUSHIONS,BLANKETS ETC" ,
"HUMAN HEALTH MEDICAL SUPPLIES AND EQUIPMENTS" ,
"IMPORT OF CUT FLOWERS AND NATURAL AGRICULTURAL INPUTS" ,
"IMPORT TRADE" ,
"IMPORT TRADE IN CHEMICALS FOR AGRICULTURAL INPUT" ,
"IMPORT TRADE IN MATERIAL METAL AND NON METAL SCRAPS" ,
"IMPORTING OF VEHICLES" ,
"IMPORTING OF VEHICLES SPARE PARTS,REGULATORY EQUIPMENTS AND JEWELRY/DECOR SUPPLIES" ,
"INCENSE & GUMS" ,
"INDUSTRIAL MACHINERY , EQUIPMENT AND ITS SPARE PARTS" ,
"INDUSTRIAL MACHINERY AND EQUIPMENT" ,
"INDUSTRIAL, AGRICULTURAL AND CONSTRUCTION MACHINERIES AND OTHER RELATED WORKS" ,
"INSTALLATION, AND FIXING OF ALUMINUM WINDOWS AND DOORS/ ALUMINUM WORKS" ,
"IRON AND STEEL" ,
"LABORATORY EQUIPMENT AND MEDICAL EQUIPMENTS" ,
"LEATHER PRODUCTS" ,
"LEATHER, LEATHER PRODUCTS, FOOTWEAR AND RELATED PRODUCTS" ,
"LIFTS, ESCALATORS AND INDUSTRIAL AND OFFICE AIR-CONDITIONING EQUIPMENT" ,
"LIGHTING AND LIGHTING ACCESSORIES" ,
"LIVE ANIMAL PRODUCTS FOR CONSUMPTION" ,
"LIVESTOCK AND LIVESTOCK PRODUCTS" ,
"LOGS AND TIMBER" ,
"MACHINERY AND EQUIPMENT" ,
"MADE-UP TEXTILE ARTICLES CORDAGE, ROPE, TWINE AND NETTING, BAGS, SACKS, RAPPING & PACKING MATERIALS" ,
"MANAGEMENT CONSULTANCY SERVICES" ,
"MARITIME CONSULTANCY SERVICE" ,
"MATERIALS AND PAINTING INKS USED FOR PROMOTION AND ADVERTISING" ,
"MATTRESSES, CUSHIONS, BLANKETS" ,
"MEASURMENTS, TESTING AND NAVIGATIONAL EQUIPMENT" ,
"Meat & poultry" ,
"MEDICAL EQUIPMENTS" ,
"MEDICINES" ,
"METAL ,NON METALS, METAL ORES AND SCRAPS" ,
"METAL AND NON METAL SCRAPS" ,
"MINING MACHINES AND ACCESSORIES" ,
"MOTOR VEHICL SPARE PARTS" ,
"MOTORCYCLES, WHEEL VEHICLES AND THEIR PARTS" ,
"MUSICAL INSTRUMENTS AND SCORES(FILM, THEATER AND RELATED INSTRUMENTS)" ,
"NAILS/PINS/BOLTS AND THE LIKE" ,
"NEW MOTOR VEHICLES" ,
"NON FERROUS METALS" ,
"NON METALLIC MINERALS (CLAY,CERAMICS,GYPSUM,LIME AND THEIR PRODUCT)" ,
"NON METALLIC SCRAPS AND WASTES" ,
"OILSEEDS" ,
"PACKAGING MATERIALS" ,
"PAGERS, HAND PHONES AND TELECOMMUNICATIONS APPARATUS (EGPALMTOPS, SMART WATCHES, WEARABLE COMPUTER AND ELECTRONIC BOOKS)" ,
"PAINTS (INCLUDING VARNISHES AND SUPPLIES)" ,
"PAINTS (INCLUDING VARNISHES,ADEHASIVE,GLUES AND SUPPLIES)" ,
"PAPER AND PAPER PRODUCTS" ,
"PAPER AND PAPER PRODUCTS AND STATIONERY" ,
"PASTA MACARONI NOODLE AND ALIKE PRODUCTS" ,
"PEPPER AND SPICES" ,
"PESTICIDES AND AGROCHEMICALS" ,
"PETRO CHEMICAL PRODUCTS" ,
"PETRO CHEMICAL PRODUCTS/VASELINE, GLYCERIN, TAR, ETC/" ,
"PETROCHEMICAL/VASELINE, GRYCYLINE ETC/ PRODUCTS" ,
"PETROLEUM AND PETROLEUM PRODUCTS" ,
"PHOTOGRAPHIC APPARATUS, EQUIPMENT AND SUPPLIES AND OPTICAL GOODS" ,
"PLANT SEED" ,
"PLASTICS IN PRIMARY FORMS AND NON-PRIMARY FORMS" ,
"PLASTICS RAW MATERIAL" ,
"POLY-PROPELINE BAGS/ SACKS, JUTES, ROPES AND THE LIKE" ,
"PRECIOUS STONES, JEWELRY AND SILVERWARE" ,
"PREPARED ANIMAL FEEDS" ,
"PRINTING MATERIALS" ,
"PROCESSED AGRICULTURAL PRODUCTS" ,
"PROCESSED FLOUR" ,
"PROCESSED PULSES" ,
"PROCESSED TOBACCO" ,
"PULSES" ,
"PULSES/CEREALS" ,
"RADIATION EMITTING EQUIPMENT’S AND RADIO ACTIVE SOURCES" ,
"Radiation Emitting Equipments& Radio active Sources" ,
"READYMADE CLOTHES & OTHER WEARS" ,
"REAL ESTATE DEVELOPMENT DISTRIBUTION AND INDUSTRY PARKS DEVELOPMENT INTO LOTS ACTIVITIES" ,
"RENTING SERVICE OF MACHINERIES AND EQUIPMENTS" ,
"RUBBER, PLASTICS AND PLASTIC PRODUCTSAND BATTERIES" ,
"SANITARY AND SANITARY ACCESSORIES" ,
"SAWN TIMBER , PLYWOOD AND RELATED PRODUCTS" ,
"SCIENTIFIC, CONTROLLING AND PRECISION EQUIPMENT" ,
"SCRAPS" ,
"SECURITY AND FIRE-FIGHTING EQUIPMENT" ,
"SECURITY CAMERA" ,
"SERVICE ESTABLISHMENT EQUIPMENT AND SUPPLIES (EG BEAUTY SALON EQUIPMENT)" ,
"SETS FOR RADIO/TV STATION INSTALLATIONS" ,
"SHOES" ,
"SHORT TERM TCHNICAL EDUCATION AND TRAINING" ,
"SOAPS, DETERGENTS, TOILETRIES, CHEMICALS FOR CLEANSING, POLISHING AND CLEANSING" ,
"SOFT DRINKS" ,
"SOFTWARE" ,
"SOLAR ENERGY EQUIPMENTS AND ELECTRICAL EQUIPMENT" ,
"SOUVENIRS , ARTIFACTS AND ARTIFICIAL JEWELRY" ,
"SPARE PARTS OF ELECTRICAL EQUPEMENTS" ,
"SPONGES AND FOAM" ,
"SPORTING GOODS AND EQUIPMENT" ,
"STATIONARY MATERIALS, PAPER AND PAPER PRODUCTS" ,
"STATIONERY" ,
"STEEL PIPE AND TUBE MILLS" ,
"STRUCTURAL CLAY AND CONCRETE PRODUCTS" ,
"STRUCTURAL METAL PRODUCTS" ,
"SUGAR" ,
"SURVEYING & DESIGNING INSTRUMENTS" ,
"SYNTHETIC LEATHER" ,
"TANTALUM MINERALS" ,
"TEA" ,
"TELECOMM AND COMPUTERS ACCESSORIES" ,
"TELECOMMUNICATION EQUIPMENTS/ACCESSORIES/SALES/MAINTENANCE" ,
"TELECOMMUNICATIONS EQUIPMENT" ,
"TEXTILE FABRICS & CLOTHINGS" ,
"TEXTILE FIBER,COTTON,THREAD AND APPAREL" ,
"TEXTILE, ARTIFICAL HAIR AND LEATHER PRODUCTS" ,
"TEXTILES FIBERS AND YARN" ,
"TORCH LIGHT" ,
"TOYS AND GAMES" ,
"TRADE AUXILIARY" ,
"TRADE IN FOOD" ,
"Tyre Repairs" ,
"TYRES AND CAR BATTERIES" ,
"USED MOTOR VEHICLES" ,
"VEHICLE SPARE PARTS" ,
"VEHICLES BODIES AND TRAILERS" ,
"VEHICLES SPARE PARTS AND ARTIFICIAL JEWLERY/DECOR" ,
"VETERINARY DRUGS, MEDICINES AND EQUIPMENTS" ,
"WHOLESALE TRADE IN STATIONERIES,PAPER AND PAPER PRODUCTS" ,
"WINE" ,
"WIRING AND CABLES ACCESSORIES" ,
"YARNS AND THREADS" ,
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
  //   try {
  //   _userStream = FirebaseDatabase.instance.ref('Query10').onValue;
  // } on FirebaseException catch (e) {
  //   print('Firebase error: ${e.code} - ${e.message}');
  //   // Handle the error appropriately, potentially display a user-friendly message
  // }
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
    "assets/images/business_lists/8.svg"
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
          'Import',
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
              child: Business_Top_List(index: 1),
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