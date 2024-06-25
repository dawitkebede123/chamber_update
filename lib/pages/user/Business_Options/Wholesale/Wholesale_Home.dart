import 'package:carousel_slider/carousel_slider.dart';
import 'package:chamber_of_commerce/pages/user/Business.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Agriculture/Agriculture_Listing.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Export/Export_Listing.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Wholesale/Wholesale_Listing.dart';
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


class Wholesale_Home extends StatefulWidget {
  const Wholesale_Home({super.key});
  @override
  State<Wholesale_Home> createState() => _Wholesale_HomeState();
}

class _Wholesale_HomeState extends State<Wholesale_Home> {
  String _query = '';
    List <String> title = [
    "SAND,GRAVEL STONE AND RELATED MATERIALS" ,
"FLORA FOAM" ,
"SUPER MARKET" ,
"FRESH FRUITS & VEGETABLES" ,
"PEPPER & SPICES" ,
"WHOLESALE TRADE" ,
"HOUSEHOLD FURNITURE APPLIANCES, ARTICLES AND EQUIPMENT" ,
"ELECTRICAL EQUIPMENT" ,
"COFFEE" ,
"SHOES" ,
"ELECTRIC MITAD AND MAINTENANCE" ,
"LEATHER PRODUCTS" ,
"HARD WARE AND COMPUTER ACCESSORIES /MAINTENANCE" ,
"GARMENT AND RELATED" ,
"HOUSE HOLD AND OFFICE FURNISHINGS AND DECORATIVE (CURTAIN, CARPET AND WALL PAPER)" ,
"BOOKS AND STATIONARY MATERIALS" ,
"AUTOMOTIVE FUEL & LUBRICANTS IN GAS STATION /CAR WASH SERVICE" ,
"SALE OF TYRES" ,
"SMALL SHOP" ,
"BAKERY PRODUCTS" ,
// "Sub-Sector" ,
"SOUVENIRS,ARTIFACT AND ARTIFICIAL JEWELRY/ TRADITIONAL WEAR" ,
"PHOTOGRAPHIC AND OPTICAL INSTRUMENTS" ,
"BEVERAGES" ,
"OFFICE MACHINES AND EQUIPMENT(INCLUDING ACCESSORIES)" ,
"CONSTRUCTION EQUIPMENT MACHINERIES AND ACCESSORIES" ,
"COMPUTER AND COMPUTER ACCESSORIES AND PERIPHERAL EQUIPMENT" ,
"SOFT DRINKS" ,
"HUMAN HEALTH MEDICAL SUPPLIES AND EQUIPMENTS" ,
"CEMENTS" ,
"CEREALS" ,
"PHARMACEUTICAL AND MEDICAL GOODS, COSMETIC AND TOILET ARTICLES" ,
"MEDICAL EQUIPMENTS, PHARMACEUTICAL, COSMETICS, PERFUMERY AND SANITARY ARTICLES" ,
"SANITARYWARE AND COSMOTICS" ,
"JEWELLERY, WATCHES AND CLOCKS" ,
"SECURITY AND FIRE FIGHTING EQUIPMENT" ,
"Retail trade in reading matter and stationery" ,
"CONFECTIONERY INCLUDING COCOA AND CHOCOLATE" ,
"MEAT & MEAT PRODUCTS ,POULTRY" ,
"MINI MARKET/ SHOP" ,
"GRAIN MILLS MACHINERY AND ITS SPARE PARTS" ,
"CRUDE RUBBER" ,
"HYPER MARKET" ,
"TRADITIONAL WEAR" ,
"CONSTRUCTION MATERIALS" ,
"SALES OF NEW PARTS AND ACCESSORIES" ,
"SPORTS GOODS AND ENTERTAINMENT REQUISITES" ,
"CROCKERY, CUTLERY AND KITCHEN UTENSILS" ,
"INCENSE & GUMS" ,
"INDUSTRIAL MACHINERY AND EQUIPMENT" ,
"MEDICINES" ,
"VETERINARY DRUGS, MEDICINES AND EQUIPMENTS" ,
"SOLID,LIQUID AND GASEOUS FUELS AND RELATED PRODUCTS" ,
"APPAREL AND CLOTHING" ,
"COSMETICS ,ESSENTIAL OILS AND RESINOUS ,PERFUME AND CHEMICALS FOR PERFUMES" ,
"RETAIL TRADE OF FOOT WEAR, LEATHER AND RELATED PRODUCTS" ,
"PLASTICS IN PRIMARY FORMS AND NON-PRIMARY FORMS" ,
"CHEMICALS FOR AGRICULTURAL USE" ,
"CHEMICALS FOR INDUSTRIAL USE" ,
"FABRICATED METALS EXCEPT GENERAL HARD WARE(EG STEEL PIPES)" ,
"PLASTIC PRODUCTS" ,
"RETAIL TRADE OF VEHICLES" ,
"VEHICLES ACCESSORIES AND DECOR" ,
"AGRICULTURAL RAW MATERIALS" ,
"BOTTLED WATER" ,
"RUBBER AND RUBBER PRODUCTS" ,
"ANIMAL FEED" ,
"GAS, NATURAL AND MANUFACTURED" ,
"PROFESSIONAL SCIENTIFIC, CONTROLLING AND PRECISION EQUIPMENT" ,
"BASIC INDUSTRIAL CHEMICALS EXCEPT FERTILIZERS" ,
"COFFEE AND TEA" ,
"BROKER IN VEHICLES RENTING AND SAILING" ,
"PLASTICS IN NON-PRIMARY FORMS" ,
"SOAPS, DETERGENTS, TOILETRIES, CHEMICALS FOR CLEANSING, POLISHING AND CLEANSING" ,
"GENERAL HARDWARE" ,
"MOTOR CYCLE, BICYCLE AND TRI CYCLE (BAJAJ) PARTS AND ACCESSORIES" ,
"TYRES AND CAR BATTERIES" ,
"PETROLEUM, PETROLEUM PRODUCTS& RELATED MATERIALS" ,
"FUEL & LUBRICANTS OUT SIDE GAS STATION" ,
"FURNITURE, HOME AND OFFICE FURNISHINGS AND HOUSEHOLD AND OFFICE EQUIPMENT" ,
"HOUSEHOLD AND OFFICE FURNITURE, REQUZITE, BOARDS, APPLIANCES" ,
"Retail trade of construction equipment (e.g. concrete mixer)" ,
"TEXTILES AND LEATHER GOODS" ,
"COTTON, TEXTILE FIBERS,YARN, TEXTILES AND TEXTILES CLOTHING" ,
"BEVERAGE CROPS" ,
"LIGHTING AND LIGHTING ACCESSORIES" ,
"CONSTRUCTION MATERIALS HARDWARE, PLUMBING AND HEATING EQUIPMENT AND SUPPLIES" ,
"STATIONERY" ,
"RETAIL TRADE IN FOOD PRODUCTS" ,
"WOOL, HIDES, SKINS AND FEATHERS" ,
"CUT FLOWERS AND PLANTS" ,
"WHOLESALE TRADE IN STATIONERIES,PAPER AND PAPER PRODUCTS" ,
"AGRICULTURAL MACHINERY AND EQUIPMENT" ,
"ELECTRICITY DISTRIBUTION AND CONTROL APPARATUS" ,
"SOLAR ENERGY EQUIPMENTS" ,
"WIRING AND CABLES ACCESSORIES" ,
"PAPER AND PAPER PRODUCTS" ,
"AUTOMOTIVE FUEL AND LUBRICANTS" ,
"INDUSTRIAL,AGRICULTURAL AND CONSTRUCTION MACHINERY AND EQUIPMENTS" ,
"BROADCASTING EQUIPMENTS" ,
"FURNISHINGS (INCLUDING CURTAINS, CARPETS, WALL PAPER)/SANITARY TOOLS /BROOM," ,
"TELECOMMUNICATIONS EQUIPMENT" ,
"STRUCTURAL CLAY AND CONCRETE PRODUCTS(EG MOSAIC TILES, BRICKS)" ,
"BROKERS DUTIES" ,
"CAR DECOR" ,
"LADIES' AND GIRLS' CLOTHING" ,
"MENS LADIES AND BOYS CLOTHING" ,
"RETAIL TRADE IN BEVERAGE PRODUCTS" ,
"PRECIOUS STONES, JEWELERY AND SILVERWARE" ,
"EDUCATION EQUIPMENTS" ,
"LOGS,TIMBER AND FOREST PRODUCTS" ,
"CHEMICALS" ,
"AGRICULTURAL PRODUCTS" ,
"BAGS, LUGGAGE’S AND RELATED PRODUCTS" ,
"CHILDREN CLOTHING" ,
"HOUSEHOLD GOODS" ,
"FOOT WEAR AND LETHER GOODS" ,
"PAINTS (INCLUDING VARNISHES AND SUPPLIES)" ,
"SAWN,FIBER, PLYWOOD AND RELATED PRODUCTS" ,
"HOUSE MADE FOOD PRODUCT" ,
"PESTICIDES AND HERBICIDES" ,
"SAWN TIMBER , PLYWOOD AND RELATED PRODUCTS" ,
"PAGERS, HAND PHONES AND TELECOMMUNICATIONS APPARATUS (EGPALMTOPS, SMART WATCHES, WEARABLE COMPUTER AND ELECTRONIC BOOKS)" ,
"TELECOMMUNICATION EQUIPMENTS/ACCESSORIES/SALES/MAINTENANCE" ,
"COSMOTICS,PERFUMERY AND SANITARYARTICLES" ,
"COMMUNICATION DEVICE" ,
"VEHICLES SPARE PARTS AND ARTIFICIAL JEWLERY/DECOR" ,
"RETAIL TRADE IN OUTSIDE STORES" ,
"WHOLESALE TRADE IN HOUSEHOLD ELECTRICAL APPLIANCES AND EQUIPMENT (INCLUDING HOUSEHOLD AIR-CONDITIONERS)" ,
"HOUSE HOLD FURNITURE(BLANKET, BED SHEET, QUILT AND PILLOW)" ,
"TEXTILE FIBERS, COTTON, YARN AND APPAREL" ,
"PESTICIDES AND AGRO-CHEMICAL PRODUCTS" ,
"LIVESTOCK PRODUCTS" ,
"FRUITS & VEGETABLES" ,
"OTHER WHOLESALE TRADE" ,
"SUGAR" ,
"UNFINISHED NON AGRICULTURAL INTERMEDIATE INDUSTRIAL PRODUCTS,WASTE AND SCRAP PRODUCTS" ,
"RETAIL TRADE OF HOUSE MADE FOOD PRODUCT" ,
"PROCESSED COFFEE" ,
"LOGS AND TIMBER" ,
"WHOLESALE OF GENERAL HARDWARE" ,
"FOOTWEAR AND LEATHER GOODS" ,
"CHEMICALS AND CHEMICAL PRODUCTS" ,
"OILSEEDS" ,
"PULSES" ,
"RECORDED CD’S, VCD’S AND RELATED PRODUCTS" ,
"RUBBER,PLASTICS AND PLASTIC PRODUCTS" ,
"KEROSIN AND LUBRICANTS (WITHOUT FUEL STATIONS" ,
"SPORTSWEAR AND FOOTWEAR" ,
"VEHICLE SPARE PARTS" ,
"METAL ,NON METALS, METAL ORES AND SCRAPS" ,
"MUSICAL INSTRUMENTS AND SCORES(FILM, THEATER AND RELATED INSTRUMENTS)" ,
"OTHER BROKERS (INTERMEDIARY)DUTIES" ,
"TOYS AND GAMES" ,
"SPORTING GOODS AND EQUIPMENT" ,
"WATER WORKS CONTRACTOR" ,
"PERFUMES, COSMETICS ,ESSENTIAL OILS AND RESINOUS" ,
"SHOES AND LEATHER GOODS" ,
"FOOT WEAR" ,
"ELECTRICAL EQUIPMENTS AND APPLIANCES" ,
"PHOTO GRAPHICS AND VISUAL EQUIPMENTS" ,
"PLANT SEED" ,
"COMMUNICATION, COMPUTER AND RELATED EQUIPMENT" ,
"LABORATORY EQUIPMENTS" ,
"IRON AND STEEL" ,
"INSTALLATION OF ELECTRIC LINE" ,
"DISTRIBUTION AND SALES OF ELECTRICITY" ,
"ELECTRICITY,GAS,STEAM AND HOT WATER SUPPLY" ,
// "DRY WASTE REMOVING" ,
"GENERATION OF ELECTRIC ENERGY FROM RENEWABLE SOURCES" ,
"BUILDING WORKS CONTRACTOR" ,
"GENERAL CONTRACTOR" ,
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
// "ACTIVITIES OF PROFESSIONAL ORGANIZATIONS" ,
"SERVICE OF PRE-PRIMARY EDUCATION AND AFTER SCHOOL" ,
"MEDIA PROGRAM PREPARATION BY AIR TIME RENT" ,
"EDUCATION BY TECHNICAL COLLEGES AND TECHNICAL INSTITUTIONS" ,
"CHILD DAY CARE SERVICE" ,
"EDUCATION RELATED SERVICES" ,
"TAILORING" ,
"LAUNDRY SERVICE" ,
"FILM PRODUCTION, CINEMA HAL, FILM STUDIO AND FILM CAPTURING" ,
"EDUCATION BY TECHNIQUES AND TRANING" ,
"MENS AND LADIES HAIRDRESSING" ,
"RESTAURANTS" ,
"PICTURE, SCULPTURE,GALLERY/ STUDIO SERVICE" ,
"DRIVING EDUCATION" ,
"TRANSLATION & SECRETARIAL SERVICES" ,
"INTERNET CAFÉ" ,
// "WASHING AND DRY-CLEANING OF TEXTILES AND FUR PRODUCTS" ,
"Men's hairdressing service" ,
// "ARTS FESTIVAL( MUSIC,FILM, THEATRE,GALLERY AND OTHER)" ,
"MEDIA ENTERTAINMENT PRODUCTION AND DISTRIBUTION" ,
"TRADITIONAL MEDICAL SERVICE" ,
"MUSIC AND BAND ACTIVITIES" ,
"CUSTOMS CLEARANCE" ,
"SERVICE OF PRIMARY AND SECONDARY EDUCATION" ,
"DIAGNOSTIC LABORATORY" ,
"TOPOGRAPHIC BEAUTY" ,
"STUDIO RECORDING SERVICE" ,
"GENERAL HOSPITAL" ,
// "BROAD CAST EQUIPMENTS TELEVISION AND RADIO RECEIVERS, SOUND OR VIDEO RECORDING OR REPRODUCING APPARATUS AND ASSOCIATED GOODS" ,
"COMMISSION/BROKERS BUSINESS ACTIVITIES" ,
"POULTRY" ,
"FLOURICULTURE" ,
"FLORICULTURE" ,
"GROWING OF HERBS AND OTHERS" ,
// "AGRICULTURAL SUPPORT SERVICE" ,
"CATTLE AND PACK ANIMALS HUSBANDARY" ,
"TEA AND BEVERAGE ,SPICE CROPS, MEDICINAL AND AROMATIC CROPS FARMING" ,
"GROWING OF CROPS COMBINED WITH FARMING OF ANIMALS (MIXED FARMING)" ,
// "CEREALS/PULSES FARMING" ,
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
// "" ,
"LEATHER, LEATHER PRODUCTS, FOOTWEAR AND RELATED PRODUCTS" ,
"METAL AND NON METAL SCRAPS" ,
"RUBBER, PLASTICS AND PLASTIC PRODUCTSAND BATTERIES" ,
"STATIONARY MATERIALS, PAPER AND PAPER PRODUCTS" ,
"TEXTILE FIBER,COTTON,THREAD AND APPAREL" ,
"IMPORTING OF VEHICLES" ,
"IMPORTING OF VEHICLES SPARE PARTS,REGULATORY EQUIPMENTS AND JEWELRY/DECOR SUPPLIES" ,
"NEW MOTOR VEHICLES" ,
"PETROCHEMICAL/VASELINE, GRYCYLINE ETC/ PRODUCTS" ,
"INDUSTRIAL MACHINERY , EQUIPMENT AND ITS SPARE PARTS" ,
"USED MOTOR VEHICLES" ,
// "VEHICLES BODIES AND TRAILERS" ,
"CONSTRUCTION MATERIALS, HARDWARE, PLUMBING" ,
"PAINTS (INCLUDING VARNISHES,ADEHASIVE,GLUES AND SUPPLIES)" ,
"STRUCTURAL CLAY AND CONCRETE PRODUCTS" ,
"IMPORT TRADE IN CHEMICALS FOR AGRICULTURAL INPUT" ,
"BASIC INDUSTRIAL CHEMICALS" ,
"IMPORT TRADE IN MATERIAL METAL AND NON METAL SCRAPS" ,
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
    "assets/images/business_lists/9.svg"
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
          'Wholesale',
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
              child: Business_Top_List(index: 10),
            ),
          )
      ],
             body: Column(
              children: [
                
      //        Padding(
      //         padding: const EdgeInsets.all(8.0),
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
                        page:  Wholesale_listing(index: index,title:title[index],businessCompanyProfile: businessCompanyProfile),
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