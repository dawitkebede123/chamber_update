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
  "NON FERROUS METALS" ,
"NON METALLIC MINERALS (CLAY,CERAMICS,GYPSUM,LIME AND THEIR PRODUCT)" ,
"PLASTICS RAW MATERIAL" ,
"IRON AND STEEL" ,
"INDUSTRIAL MACHINERY , EQUIPMENT AND ITS SPARE PARTS" ,
"MACHINERY AND EQUIPMENT" ,
"AGRICULTURAL MACHINERY AND EQUIPMENT" ,
"CHEMICALS AND CHEMICAL PRODUCTS" ,
"COMPUTER AND COMPUTER ACCESSORIES AND PERIPHERAL EQUIPMENT" ,
"SPONGES AND FOAM" ,
"ELECTRICAL AND WIRING ACCESSORIES" ,
"SOLAR ENERGY EQUIPMENTS AND ELECTRICAL EQUIPMENT" ,
"ELECTRICITY" ,
"BASIC INDUSTRIAL CHEMICALS" ,
"DYEING, TANNING AND COLORING MATERIALS" ,
"FOREIGN TRADE AGENT" ,
"PETRO CHEMICAL PRODUCTS" ,
"PLASTICS IN PRIMARY FORMS AND NON-PRIMARY FORMS" ,
"INDUSTRIAL, AGRICULTURAL AND CONSTRUCTION MACHINERIES AND OTHER RELATED WORKS" ,
// "Sub-Sector" ,
"METAL ,NON METALS, METAL ORES AND SCRAPS" ,
// "" ,
"LIGHTING AND LIGHTING ACCESSORIES" ,
"STATIONERY" ,
"FURNITURE, HOME AND OFFICE FURNISHINGS AND HOUSEHOLD AND OFFICE EQUIPMENT" ,
"CONSTRUCTION MATERIALS, HARDWARE, PLUMBING" ,
"USED MOTOR VEHICLES" ,
"EDIBLE OILS & FATS" ,
"VEHICLE SPARE PARTS" ,
"ELECTRONIC VALVES AND TUBES AND ELECTRONIC COMPONENTS" ,
"IMPORT TRADE" ,
"CROCKERY, CUTLERY AND KITCHEN UTENSILS" ,
"HOUSEHOLD AND OFFICE FURNITURE, REQUZITE, BOARDS, APPLIANCES" ,
"SPORTING GOODS AND EQUIPMENT" ,
"TEXTILE FABRICS & CLOTHINGS" ,
"SOAPS, DETERGENTS, TOILETRIES, CHEMICALS FOR CLEANSING, POLISHING AND CLEANSING" ,
"RUBBER, PLASTICS AND PLASTIC PRODUCTSAND BATTERIES" ,
"EDUCATION EQUIPMENT AND TOOLS" ,
"RADIATION EMITTING EQUIPMENT’S AND RADIO ACTIVE SOURCES" ,
"BOOKS AND MAGAZINES" ,
"READYMADE CLOTHES & OTHER WEARS" ,
"ELECTRICAL EQUIPMENTS AND APPLIANCES" ,
"GENERATORS/MOTORS /COMPRESSORS/PUMPS/THEIR ACCESSORIES/PARTS" ,
"TELECOMMUNICATIONS EQUIPMENT" ,
"PACKAGING MATERIALS" ,
"CAR BATTERY" ,
"IMPORTING OF VEHICLES SPARE PARTS,REGULATORY EQUIPMENTS AND JEWELRY/DECOR SUPPLIES" ,
"PULSES/CEREALS" ,
"Tyre Repairs" ,
"NAILS/PINS/BOLTS AND THE LIKE" ,
"HOUSEHOLD GOODS" ,
"HOUSEHOLD ELECTRICAL APPLIANCES AND EQUIPMENT" ,
"IMPORTING OF VEHICLES" ,
"SAWN TIMBER , PLYWOOD AND RELATED PRODUCTS" ,
"CONSTRUCTION EQUIPMENT AND ITS SPARE PARTS" ,
"FOREIGN TRADE AUXILIARY" ,
"WIRING AND CABLES ACCESSORIES" ,
"PROCESSED PULSES" ,
"MEDICAL EQUIPMENTS" ,
"MEDICINES" ,
"ACCESSORIES AND COMPONENTS FOR FINISHING TEXTILE AND LEATHER PRODUCTS" ,
"APPAREL AND CLOTHING" ,
"BAGS, LUGGAGE’S AND RELATED PRODUCTS" ,
"FOOT WEAR AND LETHER GOODS" ,
"LEATHER PRODUCTS" ,
"TEXTILE, ARTIFICAL HAIR AND LEATHER PRODUCTS" ,
"TEXTILES FIBERS AND YARN" ,
"SECURITY AND FIRE-FIGHTING EQUIPMENT" ,
"SOFTWARE" ,
"NEW MOTOR VEHICLES" ,
"PAINTS (INCLUDING VARNISHES,ADEHASIVE,GLUES AND SUPPLIES)" ,
"STRUCTURAL CLAY AND CONCRETE PRODUCTS" ,
"LABORATORY EQUIPMENT AND MEDICAL EQUIPMENTS" ,
"ELECTRICITY DISTRIBUTION AND CONTROL APPARATUS" ,
"TELECOMMUNICATION EQUIPMENTS/ACCESSORIES/SALES/MAINTENANCE" ,
"VEHICLES BODIES AND TRAILERS" ,
"MATERIALS AND PAINTING INKS USED FOR PROMOTION AND ADVERTISING" ,
"MOTOR VEHICL SPARE PARTS" ,
"PAPER AND PAPER PRODUCTS" ,
"PAPER AND PAPER PRODUCTS AND STATIONERY" ,
"SERVICE ESTABLISHMENT EQUIPMENT AND SUPPLIES (EG BEAUTY SALON EQUIPMENT)" ,
"ALCOHOLIC DRINKS" ,
"ELECTRIC MOTORS,GENERATORS AND TRANSFORMERS" ,
"FURNISHINGS (INCLUDING CURTAINS, CARPETS, WALL PAPER)/SANITARY TOOLS /BROOM," ,
"GENERAL HARDWARE" ,
"GLASS AND GLASSES PRODUCTS" ,
"HOUSHOLDS INCLUDING MATTRESSES,CUSHIONS,BLANKETS ETC" ,
"SANITARY AND SANITARY ACCESSORIES" ,
"FOOD PRODUCTS" ,
"LIVE ANIMAL PRODUCTS FOR CONSUMPTION" ,
"VETERINARY DRUGS, MEDICINES AND EQUIPMENTS" ,
"GRAIN MILL SPARE PARTS" ,
"FEEDING STUFF FOR ANIMALS" ,
"LOGS AND TIMBER" ,
"METAL AND NON METAL SCRAPS" ,
"PROCESSED AGRICULTURAL PRODUCTS" ,
"PRINTING MATERIALS" ,
"FOOD STUFF" ,
"SUGAR" ,
"MOTORCYCLES, WHEEL VEHICLES AND THEIR PARTS" ,
"AGRICULTURAL RAW MATERIALS" ,
"COSMETICS ,ESSENTIAL OILS AND RESINOUS ,PERFUME AND CHEMICALS FOR PERFUMES" ,
"BAKERY PRODUCTS" ,
"DAIRY PRODUCTS" ,
"EDIBLE SALT" ,
"PETROLEUM AND PETROLEUM PRODUCTS" ,
"CEMENTS" ,
"TOYS AND GAMES" ,
"BEVERAGES" ,
"FOOD ADDITIVES" ,
"COAL, COKE AND BRIQUETTES" ,
"SETS FOR RADIO/TV STATION INSTALLATIONS" ,
"IMPORT TRADE IN CHEMICALS FOR AGRICULTURAL INPUT" ,
"DRY CELLS" ,
"CHEMICAL FERTILIZERS" ,
"GARMENT AND RELATED" ,
"EDUCATIONAL SUPPORT EQUIPMENTS" ,
"SURVEYING & DESIGNING INSTRUMENTS" ,
"BASIC CHEMICALS, EXCEPT FERTILIZERS" ,
"COMMUNICATION, COMPUTER AND RELATED EQUIPMENT" ,
"STATIONARY MATERIALS, PAPER AND PAPER PRODUCTS" ,
"TEXTILE FIBER,COTTON,THREAD AND APPAREL" ,
"HEATING EQUIPMENT AND RELATED MATERIALS" ,
"CANDLES AND MATCH" ,
"CRUDE TYRE" ,
"COMMERCIAL REPRESENTATIVE" ,
"YARNS AND THREADS" ,
"FRUITS & VEGETABLES" ,
"MATTRESSES, CUSHIONS, BLANKETS" ,
"INCENSE & GUMS" ,
"PEPPER AND SPICES" ,
"BASIC INDUSTRIAL CHEMICALS EXCEPT FERTILIZERS" ,
"BICYCLES PARTS" ,
"BROADCASTING EQUIPMENTS" ,
"CLEANING AND COSMOTICS" ,
"MADE-UP TEXTILE ARTICLES CORDAGE, ROPE, TWINE AND NETTING, BAGS, SACKS, RAPPING & PACKING MATERIALS" ,
"PASTA MACARONI NOODLE AND ALIKE PRODUCTS" ,
"SOUVENIRS , ARTIFACTS AND ARTIFICIAL JEWELRY" ,
"LIFTS, ESCALATORS AND INDUSTRIAL AND OFFICE AIR-CONDITIONING EQUIPMENT" ,
"FOOTWEAR AND LEATHER GOODS" ,
"SYNTHETIC LEATHER" ,
"WINE" ,
"LEATHER, LEATHER PRODUCTS, FOOTWEAR AND RELATED PRODUCTS" ,
"AGRICULTURAL PRODUCTS/CEREALS" ,
"GAS, NATURAL AND MANUFACTURED" ,
"SCIENTIFIC, CONTROLLING AND PRECISION EQUIPMENT" ,
"CAR DECOR" ,
"FLORA FOAM" ,
"CLOCKS AND WATCHES" ,
"STEEL PIPE AND TUBE MILLS" ,
"PETRO CHEMICAL PRODUCTS/VASELINE, GLYCERIN, TAR, ETC/" ,
"SCRAPS" ,
"ANIMAL MEDICAL SUPPLIES AND EQUIPMENTS" ,
"PHOTOGRAPHIC APPARATUS, EQUIPMENT AND SUPPLIES AND OPTICAL GOODS" ,
"DOMESTIC TRADE AGENT" ,
"IMPORT TRADE IN MATERIAL METAL AND NON METAL SCRAPS" ,
"CHEMICALS FOR TREATMRNT, MEDICINE AND FOOD" ,
"COMMERCIAL FOOD SERVICE EQUIPMENT" ,
"BEVERAGE CROPS" ,
"CEREALS" ,
"Meat & poultry" ,
"BOOKS AND STATIONARY MATERIALS" ,
"CONSTRUCTION MATERIALS HARDWARE, PLUMBING AND HEATING EQUIPMENT AND SUPPLIES" ,
"SECURITY CAMERA" ,
"PROCESSED TOBACCO" ,
"MUSICAL INSTRUMENTS AND SCORES(FILM, THEATER AND RELATED INSTRUMENTS)" ,
"TELECOMM AND COMPUTERS ACCESSORIES" ,
"TRADE AUXILIARY" ,
"TORCH LIGHT" ,
"HOUSE HOLD FURNITURE(BLANKET, BED SHEET, QUILT AND PILLOW)" ,
"PAGERS, HAND PHONES AND TELECOMMUNICATIONS APPARATUS (EGPALMTOPS, SMART WATCHES, WEARABLE COMPUTER AND ELECTRONIC BOOKS)" ,
"GLOBAL INFORMATION SYSTEMS (GIS) EQUIPMENTS" ,
"COMMISSION/BROKERS BUSINESS ACTIVITIES" ,
"PRECIOUS STONES, JEWELRY AND SILVERWARE" ,
"COFFEE AND TEA" ,
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
"TAILORING" ,
"LAUNDRY SERVICE" ,
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
"MEDIA ENTERTAINMENT PRODUCTION AND DISTRIBUTION" ,
"TRADITIONAL MEDICAL SERVICE" ,
"MUSIC AND BAND ACTIVITIES" ,
"CUSTOMS CLEARANCE" ,
"SERVICE OF PRIMARY AND SECONDARY EDUCATION" ,
"DIAGNOSTIC LABORATORY" ,
"TOPOGRAPHIC BEAUTY" ,
"GENERAL HOSPITAL" ,
"BROAD CAST EQUIPMENTS TELEVISION AND RADIO RECEIVERS, SOUND OR VIDEO RECORDING OR REPRODUCING APPARATUS AND ASSOCIATED GOODS" ,
"SECURITY AND CLEANING SERVICE" ,
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
"GROWING OF CEREALS" ,
"BEE KEEPING" ,
"FISH HATCHERIES AND FISH FARMS" ,
"Farming of cattle, sheep, goats, horses, asses, mules and hinnies; dairy farming" ,
"WOOL, HIDES, SKINS AND FEATHERS" ,
"LIVESTOCK AND LIVESTOCK PRODUCTS" ,
"POLY-PROPELINE BAGS/ SACKS, JUTES, ROPES AND THE LIKE" ,
"PULSES" ,
"NON METALLIC SCRAPS AND WASTES" ,
"PETROCHEMICAL/VASELINE, GRYCYLINE ETC/ PRODUCTS" ,
"TANTALUM MINERALS" ,
"SPARE PARTS OF ELECTRICAL EQUPEMENTS" ,
"Radiation Emitting Equipments& Radio active Sources" ,
"HOUSE HOLD AND OFFICE FURNISHINGS AND DECORATIVE (CURTAIN, CARPET AND WALL PAPER)" ,
"ELECTROMECHANICAL WORK" ,
"BEER" ,
"MARITIME CONSULTANCY SERVICE" ,
"ANIMAL & WASTE PRODUCTS" ,
"BAKERY PRODUCTS,PREPARATION OF CONFECTIONERY, INCLUDING COCOA AND CHOCOLATE" ,
"TEA" ,
"COTTON, TEXTILE FIBERS,YARN, TEXTILES AND TEXTILES CLOTHING" ,
"BROKER IN VEHICLES RENTING AND SAILING" ,
"CANDLES AND TEWAF" ,
"INSTALLATION, AND FIXING OF ALUMINUM WINDOWS AND DOORS/ ALUMINUM WORKS" ,
"PAINTS (INCLUDING VARNISHES AND SUPPLIES)" ,
"CRUDE RUBBER" ,
"SHOES" ,
"FISH" ,
"FIXED PROPERTY SUBLETTING/RENTING ACTIVITITIES" ,
"ANIMAL BY PRODUCTS" ,
"CONSULTANCY SERVICE FOR SOCIAL AFFAIRS" ,
"PROCESSED FLOUR" ,
"VEHICLES SPARE PARTS AND ARTIFICIAL JEWLERY/DECOR" ,
"COFFEE" ,
"BEESWAX" ,
"PREPARED ANIMAL FEEDS" ,
"RENTING SERVICE OF MACHINERIES AND EQUIPMENTS" ,
"INDUSTRIAL MACHINERY AND EQUIPMENT" ,
"STRUCTURAL METAL PRODUCTS" ,
"SOFT DRINKS" ,
"CASH REGISTER MACHINE" ,
"REAL ESTATE DEVELOPMENT DISTRIBUTION AND INDUSTRY PARKS DEVELOPMENT INTO LOTS ACTIVITIES" ,
"IMPORT OF CUT FLOWERS AND NATURAL AGRICULTURAL INPUTS" ,
"TRADE IN FOOD" ,
"WHOLESALE TRADE IN STATIONERIES,PAPER AND PAPER PRODUCTS" ,
"FRESH FRUITS & VEGETABLES" ,
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