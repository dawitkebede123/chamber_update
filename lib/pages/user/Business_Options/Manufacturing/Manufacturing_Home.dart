import 'package:carousel_slider/carousel_slider.dart';
import 'package:chamber_of_commerce/pages/user/Business.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Agriculture/Agriculture_Listing.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Export/Export_Listing.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Manufacturing/Manufacturing_Options.dart';
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


class Manufacturing_Home extends StatefulWidget {
  const Manufacturing_Home({super.key});
  @override
  State<Manufacturing_Home> createState() => _Manufacturing_HomeState();
}

class _Manufacturing_HomeState extends State<Manufacturing_Home> {
  String _query = '';
  List <String> title = [
"NON-METALLIC MINERAL PRODUCTS" ,
"FOAM AND SPONGE" ,
"CEMENT, LIME AND PLASTER" ,
"SPECIAL PURPOSE MACHINERY" ,
"BLANKETS, MADE-UP FURNISHING ARTICLES AND STUFFED" ,
"PLASTIC PRODUCTS" ,
"TEXTILES AND GARMENT" ,
"BASIC IRON AND STEEL" ,
"DRESSING AND DYEING" ,
"FLOUR AND GRAIN MILL PRODUCTS, INCLUDING RICE AND VEGETABLE MILLING; GRAIN MILL RESIDUES" ,
"FOOT WEAR" ,
"PAINTS, VARNISHES AND SIMILAR COATINGS, PRINTING INK AND MASTICS" ,
"METAL STRUCTURES FROM ALUMINUM" ,
"MANUFACTURING OF MOTORCYCLES" ,
"SPICES,CONDIMENTS,VBINGAR,YEAST,EGG PRODUCE SOUPS AND OTHER FOOD PRODUCT." ,
"PRINTING" ,
// "Sub-Sector" ,
"OFFICE AND HOUSEHOLD FURNITURE" ,
"SPINNING, WEAVING AND FINISHING OF YARNS AND FABRICS PREDOMINANTLY OF WOOL AND ANIMAL FIBERS" ,
"ARTICLES OF CONCRETE, CEMENT AND PLASTER" ,
"COMPOUND COKING FATS, MARGARINE AND EDIBLE OILS" ,
"GROWING OF ANIMALS FEED" ,
"BAKERY PRODUCTS" ,
"SOAP AND OTHER CLEANING COMPOUNDS" ,
"GARMENT AND RELATED" ,
"SPORTS GOODS AND ENTERTAINMENT REQUISITES" ,
"CASTING OF IRON AND STEEL" ,
"AIRCRAFT AND SPACECRAFT" ,
"COMPUTER AND COMPUTER ACCESSORIES AND PERIPHERAL EQUIPMENT" ,
"GENERAL PURPOSE MACHINERY" ,
"BAGS, SACKS, RAPPING & PACKING MATERIALS" ,
"CLEANING, COSMOTICS AND INPUTS" ,
"SANITARY NAPKIN(PAD )AND DIAPER" ,
"MANUFACTURE OF SPRING MATTRESS" ,
"PRINTING MATERIALS" ,
"TELEVISION AND RADIO RECEIVERS, SOUND OR VIDEO RECORDING OR REPRODUCING APPARATUS AND ASSOCIATED GOODS" ,
"PRINTING OF BOOKS, BROCHURES, MUSICAL BOOKS AND OTHERS" ,
"OFFICE & HOUSE HOLD EQUIPMENTS" ,
"VENEER SHEETS; PLYWOOD, LAMINBOARD, PARTICLE BOARD AND OTHER PANELS AND BOARDS" ,
"ALCOHOLIC DRINKS" ,
"DISTILLING, RECTIFYING AND BLENDING OF SPIRITS; ETHYL ALCOHOL PRODUCTION FROM FERMENTED MATERIALS;MANUFACTURING OF WINE" ,
"PROCESSING AND PRESERVING OF FRUIT AND VEGETABLES" ,
"PULP, PAPER AND PAPERBOARD AND OF CONTAINERS MADE FROM PAPER PRODUCT" ,
"SOFT DRINK,BOTTLED WATERS/MINERAL WATERS" ,
"LEATHER ARTICLES" ,
"PAPER AND PAPER PRODUCTS AND STATIONERY" ,
"CANNED PRESERVED PROCESSED AND DEHYDRATED FRUIT AND VEGETABLES INCIUDING FRUIT JUICES JUICE EXTRACTS AND POTATO FLOUR MEAL" ,
"SPINNING OF TEXTILE FIBERS AND WEAVING OF TEXTILES" ,
"BUILDERS CARPENTRY AND JOINERY" ,
"REFRACTORY CERAMIC PRODUCTS" ,
"PASTA, MACARONI, NOODLES, COUSCOUS AND SIMILAR FARINACEOUS PRODUCTS" ,
"MANUFACTURE OF ELECTRICAL MACHINERY, APPARATUS UTILITIES" ,
"MAN MADE FIBER" ,
"MANUFACTURE OF TYRES AND PLASTIC PRODUCTS" ,
"MEDICAL AND SURGICAL EQUIPMENT AND ORTHOPEDIC APPLIANCES" ,
"STRUCTURAL METAL PRODUCTS" ,
"CANDLES AND MATCH" ,
"GLASS AND GLASSES PRODUCTS" ,
"BASIC CHEMICALS, EXCEPT FERTILIZERS AND NITROGEN COMPOUNDS" ,
"VEGETABLES AND ANIMAL OIL FAT" ,
"PREPARATION OF CONFECTIONERY, INCLUDING COCOA AND CHOCOLATE" ,
"LEATHER AND HIDE TANNING AND FINISHING" ,
"manufacture of knitted and crocheted fabrics and articles" ,
"MADE-UP TEXTILE ARTICLES, EXCEPT APPAREL" ,
"textile and textile articles,textile ascceris" ,
"STONE PRODUCTS" ,
"SPINNING, WEAVING AND FINISHING OF TEXTILES" ,
"PERFUMES, COSMETICS ,ESSENTIAL OILS AND RESINOUS" ,
"MEASURING SCALES" ,
"COSMETICS ,ESSENTIAL OILS AND RESINOUS ,PERFUME AND CHEMICALS FOR PERFUMES" ,
"COFFEE, COFFEE SUBSTITUTES AND TEA" ,
"INSULATED WIRE AND CABLE" ,
"STRUCTURAL METAL PRODUCTS, TANKS, RESERVOIRS AND STEAM GENERATORS" ,
"FABRICATED METAL PRODUCTS" ,
"TREATMENT AND COATING OF METALS; GENERAL MECHANICAL ENGINEERING ON A FEE OR CONTRACT BASIS" ,
"PRODUCTS OF WOOD(EXCEPT FURNITURE)" ,
"DAIRY PRODUCTS" ,
"PREPARED ANIMAL FEEDS" ,
"BEER" ,
"PACKAGING MATERIALS" ,
"PHOTOGRAPHIC AND OPTICAL INSTRUMENTS" ,
"WEARING AND APPRAL, EXCEPT FUR APPAREL" ,
"POLISHES,WAXES ,DRESSINGS AND INCENSE" ,
"PHARMACETUCALS,MEDICINALCHEMICALS AND BOTANICAL PRODUCTS FOR HUMAN USE" ,
"WINE" ,
"ANIMAL FEED" ,
"PLASTICS IN PRIMARY FORM AND OF SYNTHETIC RUBBER" ,
"FORGING,PRESSING STAMPING AND ROLL-FORMING OF METAL;POWDER METALLURGY" ,
"FOOD PRODUCTS" ,
"AGRICULTURAL AND FORESTRY MACHINERY" ,
"MACHINERY FOR MINING, QUARRYING AND CONSTRUCTION" ,
"BUTTONS, BUCKLES, SLIDE FASTENERS" ,
"TYRES AND TUBES" ,
"TOILET TISSUE AND NAPKIN PAPER" ,
"BODIES (COACHWORK) FOR MOTOR VEHICLES; TRAILERS AND SEMI-TRAILERS/MOTOR VEHICLES" ,
"REPRODUCTION OF RECORDED MEDIA" ,
"FOOD STUFF" ,
"MAN-MADE FIBRES" ,
"COFFEE AND TEA" ,
"IRON, STEEL AND METALIC MINERALS" ,
"MANUFACTURING OF FURNITURE" ,
"LEATHER AND LEATHER SUBSTITUTES WEARINGS" ,
"MANUFACTURE OF COMMUNICATION MACHINERIES,SPARE PARTS AND APPARATUS AND UTILITIES" ,
"PAGERS, HAND PHONES AND TELECOMMUNICATIONS APPARATUS (EGPALMTOPS, SMART WATCHES, WEARABLE COMPUTER AND ELECTRONIC BOOKS)" ,
"FOOD AND ANIMAL FEED PROCESSING MACHINERY" ,
"BROAD CAST EQUIPMENTS TELEVISION AND RADIO RECEIVERS, SOUND OR VIDEO RECORDING OR REPRODUCING APPARATUS AND ASSOCIATED GOODS" ,
"SPINNING, WEAVING AND FINISHING OF TRADITIONAL CLOTHES" ,
"ELECTRIC MOTORS,GENERATORS AND TRANSFORMERS" ,
"PRINTING AND RELATED ACTIVITIES" ,
"CRUDE OIL AND OILSEED CAKE AND MEAL" ,
"METAL STRUCTURES FROM STEEL" ,
"COMPUTER NETWORK DESIGN AND CABLE INSTALATION" ,
"Software Instalation,ommissioning,Monitoring and Erection Activity" ,
"CONFECTIONERY INCLUDING COCOA AND CHOCOLATE" ,
"CORKS & CANS" ,
"ELECTRIC LAMPS AND LIGHTING EQUIPMENT" ,
"ELECTRICITY DISTRIBUTION AND CONTROL APPARATUS" ,
"ELECTRICAL EQUIPMENT" ,
"PROCESSING OF MEAT BY PRODUCTS INCLUDING HIDES, BONES, ETC" ,
"OFFICE, ACCOUNTING AND COMPUTING MACHINERY" ,
"MOTOR VEHICLE PARTS AND ACCESSORIES" ,
"RUBBER PRODUCTS" ,
"TOBACCO PRODUCTS" ,
"MANUFACTURE OF TRANSPORT VEHICLES PARTS,SPARE PARTS AND TYRE" ,
"MANUFACTURING OF RAILWAY AND TRAMWAY LOCOMOTIVES AND ROLLING STOCK VEHICLES" ,
"MOTOR VECHICLES" ,
"SUGAR, INCLUDING GOLDEN SYRUP AND CASTOR SUGAR" ,
"PVC GRANULE FOR SOLE & PLASTIC SHOE" ,
"SECURITY CAMERA" ,
"SHEET & PLATE GLASS, GLASS BLOCKS, TUBES & RODS; GLASS FIBERS & GLASS WOOL" ,
"SLAUGHTERING, DRESSING AND PACKING OF LIVESTOCK, INCLUDING POULTRY AND SMALL GAME FOR MEAT" ,
"STRUCTURAL NON-REFRACTORY CLAY AND CERAMIC PRODUCTS" ,
"SPECIAL PURPOSE MACHINERY (FOR TEXTILE)" ,
"EDIBLE SALT" ,
"FERTILIZERS AND NITROGEN COMPOUNDS" ,
"TRADITIONAL FOODS" ,
"PROCESSING OF FRESH MILK (PASTEURISING, HOMOGENISING, STERILISING AND VITAMINISING)" ,
"MATERIALS AND PAINTING INKS USED FOR PROMOTION AND ADVERTISING" ,
"OTHER VEHICLE PARTS AND ACCESSORIES" ,
"PESTICIDES AND AGRO-CHEMICAL PRODUCTS" ,
"ADHESIVES, AND GLUES" ,
"CARPETS,RUGS AND MATS" ,
"PHARMACEUTICALS, MEDICAL CHEMICALS AND BOTANICAL PRODUCTS FOR HUMAN USE" ,
"LUBRICANTS & GREASE" ,
"EDIBLE OIL" ,
"CORDAGE,ROPE,TWINE AND NETTING" ,
"GASES" ,
"GRINDING/MANUFACTURING OF GRAINS" ,
"HOUSEHOLD APPLIANCE" ,
"CUTTING, SHAPING AND FINISHING OF STONE" ,
"MANUFACTURE OF WOOD AND WOOD PRODUCTS" ,
"SOFTWARE DEVELOPMENT ( INCLUDING DESIGN, ENRICHMENT AND IMPLEMENTATION)" ,
"HONEY AND HONEY PRODUCTS" ,
"MANUFACTUR OF CONSUMER ELECTRONIC EQUIPMENT (TV,DVD,RADIO AND SIMILAR EQUIPMENT)" ,
"TRANSPORT EQUIPMENT" ,
"CUTLERY, HAND TOOLS AND GENERAL HARDWARE" ,
"Manfacture of printer ink" ,
"FAST FOODS" ,
"RECYCLING OF NON-METAL WASTE AND SCRAP" ,
"MANUFACTURING OF GALVANIZED STEEL SHEETS" ,
"HOUSEHOLD AND OFFICE FURNITURE, REQUZITE, BOARDS, APPLIANCES" ,
"RECREATIONAL EQUIPMENTS" ,
"MADE-UP TEXTILE ARTICLES CORDAGE, ROPE, TWINE AND NETTING, BAGS, SACKS, RAPPING & PACKING MATERIALS" ,
"KINITTED AND CROCHETED FABRICS AND ARTICLES" ,
"OTHER PETROLEUM/SYNTHESISED PRODUCTS" ,
"SOUVENIRS,ARTIFACT AND ARTIFICIAL JEWELRY/ TRADITIONAL WEAR" ,
"CONSTRUCTION MATERIALS" ,
"HOUSEHOLD GOODS" ,
"TENTS, TARPAULINS, SAILS AND CANVAS GOODS" ,
"SHOES/CARS/PRINTING INK" ,
"ELECTROMECHANICAL WORK" ,
"BASIC CHEMICALS" ,
"STRUCTURAL CLAY AND CONCRETE PRODUCTS" ,
"TANKS, RESERVOIRS, SAFE BOXES AND SIMILAR CONTAINERS OF METAL" ,
"MINERALS AND MINERAL PRODUCTS" ,
"INSTALLATION, AND FIXING OF ALUMINUM WINDOWS AND DOORS/ ALUMINUM WORKS" ,
"PROCESSING AND CASTING MINERALS" ,
"AGRICULTURAL PRODUCTS" ,
"HOUSEHOLD ELECTRICAL APPLIANCES AND EQUIPMENT" ,
"COTTON, TEXTILE FIBERS,YARN, TEXTILES AND TEXTILES CLOTHING" ,
"INSTALLATION OF ELECTRIC LINE" ,
"DISTRIBUTION AND SALES OF ELECTRICITY" ,
"ELECTRICITY,GAS,STEAM AND HOT WATER SUPPLY" ,
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
"BEAUTY TREATMENT/BATH AND MASSAGE" ,
"MOTION PICTURE, THEATRE AND VIDEO PRODUCTION AND DISTRIBUTION" ,
"FILM PRODUCTION" ,
"SERVICE OF REGULAR HIGHER EDUCATION" ,
"SPORTING AND RECREATIONAL ACTIVITIES" ,
"CONSULTANCY ACTIVITY ON ADVERTISING" ,
"NEWSPAPERS, JOURNALS AND PERIODICALS DISTRIBUTER" ,
"MANAGEMENT CONSULTANCY SERVICES" ,
"QUALITY MANAGEMENT SYSTEM CONSULTANCY" ,
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
"INTERNET CAFÉ" ,
"WASHING AND DRY-CLEANING OF TEXTILES AND FUR PRODUCTS" ,
"SANITARYWARE AND COSMOTICS" ,
"RETAIL TRADE OF FOOT WEAR, LEATHER AND RELATED PRODUCTS" ,
"Men's hairdressing service" ,
"ARTS FESTIVAL( MUSIC,FILM, THEATRE,GALLERY AND OTHER)" ,
"MEDIA ENTERTAINMENT PRODUCTION AND DISTRIBUTION" ,
"MUSIC AND BAND ACTIVITIES" ,
"CUSTOMS CLEARANCE" ,
"SERVICE OF PRIMARY AND SECONDARY EDUCATION" ,
"DIAGNOSTIC LABORATORY" ,
"TOPOGRAPHIC BEAUTY" ,
"STUDIO RECORDING SERVICE" ,
"GENERAL HOSPITAL" ,
"COMMISSION/BROKERS BUSINESS ACTIVITIES" ,
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
"VEGETABLE,FRUIT,PLANT AND PLANT SEED PRODUCTION" ,
"GROWING OF CEREALS" ,
"BEE KEEPING" ,
"FISH HATCHERIES AND FISH FARMS" ,
"Farming of cattle, sheep, goats, horses, asses, mules and hinnies; dairy farming" ,
"COFFEE FARMING" ,
"WOOL, HIDES, SKINS AND FEATHERS" ,
"STONE CARVINGS,CLAY SAND AND SIMILAR MINING AND QUARRYING" ,
"CONSULTANCY SERVICE ON CHEMICAL ENGINEERING" ,
"DIMENSION STONE (GRANITE, MARBLE, SLATE, AND WONDER STONE)" ,
"EXPLORATION" ,
"MINING SUPPORTIVE ACTIVITIES" ,
"RENTING SERVICE OF MACHINERIES AND EQUIPMENTS" ,
"REFINING OF PRECIOUS METALS" ,
"QUARRYING OF MINERALS" ,
"INSTALLATION AND MAINTENANCE OF MACHINERIES" ,
"COMPUTER AND COMPUTER ACCESSORIES MAINTENANCE" ,
"MULTI PURPOSE VEHICLES AND PARTS MAINTENANCE" ,
"FRUITS & VEGETABLES" ,
"LEATHER, LEATHER PRODUCTS, FOOTWEAR AND RELATED PRODUCTS" ,
"METAL AND NON METAL SCRAPS" ,
"RUBBER, PLASTICS AND PLASTIC PRODUCTSAND BATTERIES" ,
"STATIONARY MATERIALS, PAPER AND PAPER PRODUCTS" ,
"IMPORTING OF VEHICLES" ,
"IMPORTING OF VEHICLES SPARE PARTS,REGULATORY EQUIPMENTS AND JEWELRY/DECOR SUPPLIES" ,
"ELECTRICAL EQUIPMENTS AND APPLIANCES" ,
"NEW MOTOR VEHICLES" ,
"COMMUNICATION, COMPUTER AND RELATED EQUIPMENT" ,
"BASIC CHEMICALS, EXCEPT FERTILIZERS" ,
"CHEMICALS AND CHEMICAL PRODUCTS" ,
"DYEING, TANNING AND COLORING MATERIALS" ,
"PETROCHEMICAL/VASELINE, GRYCYLINE ETC/ PRODUCTS" ,
"PLASTICS IN PRIMARY FORMS AND NON-PRIMARY FORMS" ,
"INDUSTRIAL MACHINERY , EQUIPMENT AND ITS SPARE PARTS" ,
"USED MOTOR VEHICLES" ,
"APPAREL AND CLOTHING" ,
"LEATHER PRODUCTS" ,
"HUMAN HEALTH MEDICAL SUPPLIES AND EQUIPMENTS" ,
"VEHICLES BODIES AND TRAILERS" ,
"CEMENTS" ,
"CONSTRUCTION MATERIALS, HARDWARE, PLUMBING" ,
"GENERAL HARDWARE" ,
"PAINTS (INCLUDING VARNISHES,ADEHASIVE,GLUES AND SUPPLIES)" ,
"IMPORT TRADE IN CHEMICALS FOR AGRICULTURAL INPUT" ,
"BASIC INDUSTRIAL CHEMICALS" ,
"METAL ,NON METALS, METAL ORES AND SCRAPS" ,
"LOGS AND TIMBER" ,
"CRUDE RUBBER" ,
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
    "assets/images/business_lists/11.svg"
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
          'Manufacturing',
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
              child: Business_Top_List(index: 2),
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
                        page:  Manufacturing_listing(index: index,title:title[index],businessCompanyProfile: businessCompanyProfile),
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