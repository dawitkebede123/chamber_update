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
"ADHESIVES, AND GLUES" ,
"AGRICULTURAL AND FORESTRY MACHINERY" ,
"AGRICULTURAL PRODUCTS" ,
"AIRCRAFT AND SPACECRAFT" ,
"ALCOHOLIC DRINKS" ,
"ANIMAL FEED" ,
"ARTICLES OF CONCRETE, CEMENT AND PLASTER" ,
"BAGS, SACKS, RAPPING & PACKING MATERIALS" ,
"BAKERY PRODUCTS" ,
"BASIC CHEMICALS" ,
"BASIC CHEMICALS, EXCEPT FERTILIZERS AND NITROGEN COMPOUNDS" ,
"BASIC IRON AND STEEL" ,
"BEER" ,
"BLANKETS, MADE-UP FURNISHING ARTICLES AND STUFFED" ,
"BODIES (COACHWORK) FOR MOTOR VEHICLES; TRAILERS AND SEMI-TRAILERS/MOTOR VEHICLES" ,
"BROAD CAST EQUIPMENTS TELEVISION AND RADIO RECEIVERS, SOUND OR VIDEO RECORDING OR REPRODUCING APPARATUS AND ASSOCIATED GOODS" ,
"BUILDERS CARPENTRY AND JOINERY" ,
"BUTTONS, BUCKLES, SLIDE FASTENERS" ,
"CANDLES AND MATCH" ,
"CANNED PRESERVED PROCESSED AND DEHYDRATED FRUIT AND VEGETABLES INCIUDING FRUIT JUICES JUICE EXTRACTS AND POTATO FLOUR MEAL" ,
"CARPETS,RUGS AND MATS" ,
"CASTING OF IRON AND STEEL" ,
"CEMENT, LIME AND PLASTER" ,
"CLEANING, COSMOTICS AND INPUTS" ,
"COFFEE AND TEA" ,
"COFFEE, COFFEE SUBSTITUTES AND TEA" ,
"COKE OVEN PRODUCTS" ,
"COMPOUND COKING FATS, MARGARINE AND EDIBLE OILS" ,
"COMPUTER AND COMPUTER ACCESSORIES AND PERIPHERAL EQUIPMENT" ,
"COMPUTER NETWORK DESIGN AND CABLE INSTALATION" ,
"CONFECTIONERY INCLUDING COCOA AND CHOCOLATE" ,
"CONSTRUCTION MATERIALS" ,
"CORDAGE,ROPE,TWINE AND NETTING" ,
"CORKS & CANS" ,
"COSMETICS ,ESSENTIAL OILS AND RESINOUS ,PERFUME AND CHEMICALS FOR PERFUMES" ,
"COTTON, TEXTILE FIBERS,YARN, TEXTILES AND TEXTILES CLOTHING" ,
"CRUDE OIL AND OILSEED CAKE AND MEAL" ,
"CUTLERY, HAND TOOLS AND GENERAL HARDWARE" ,
"CUTTING, SHAPING AND FINISHING OF STONE" ,
"DAIRY PRODUCTS" ,
"DISTILLING, RECTIFYING AND BLENDING OF SPIRITS; ETHYL ALCOHOL PRODUCTION FROM FERMENTED MATERIALS;MANUFACTURING OF WINE" ,
"DRESSING AND DYEING" ,
"EDIBLE OIL" ,
"EDIBLE SALT" ,
"EDUCATIONAL SUPPORT EQUIPMENTS" ,
"ELECTRIC LAMPS AND LIGHTING EQUIPMENT" ,
"ELECTRIC MOTORS,GENERATORS AND TRANSFORMERS" ,
"ELECTRICAL EQUIPMENT" ,
"ELECTRICITY DISTRIBUTION AND CONTROL APPARATUS" ,
"ELECTROMECHANICAL WORK" ,
"FABRICATED METAL PRODUCTS" ,
"FAST FOODS" ,
"FERTILIZERS AND NITROGEN COMPOUNDS" ,
"FLOUR AND GRAIN MILL PRODUCTS, INCLUDING RICE AND VEGETABLE MILLING; GRAIN MILL RESIDUES" ,
"FOAM AND SPONGE" ,
"FOOD AND ANIMAL FEED PROCESSING MACHINERY" ,
"FOOD PRODUCTS" ,
"FOOD STUFF" ,
"FOOT WEAR" ,
"FORGING,PRESSING STAMPING AND ROLL-FORMING OF METAL;POWDER METALLURGY" ,
"GARMENT AND RELATED" ,
"GASES" ,
"GENERAL PURPOSE MACHINERY" ,
"GLASS AND GLASSES PRODUCTS" ,
"GRINDING/MANUFACTURING OF GRAINS" ,
"GROWING OF ANIMALS FEED" ,
"HONEY AND HONEY PRODUCTS" ,
"HOUSEHOLD AND OFFICE FURNITURE, REQUZITE, BOARDS, APPLIANCES" ,
"HOUSEHOLD APPLIANCE" ,
"HOUSEHOLD ELECTRICAL APPLIANCES AND EQUIPMENT" ,
"HOUSEHOLD GOODS" ,
"INSTALLATION, AND FIXING OF ALUMINUM WINDOWS AND DOORS/ ALUMINUM WORKS" ,
"INSULATED WIRE AND CABLE" ,
"IRON, STEEL AND METALIC MINERALS" ,
"KINITTED AND CROCHETED FABRICS AND ARTICLES" ,
"LEATHER AND HIDE TANNING AND FINISHING" ,
"LEATHER AND LEATHER SUBSTITUTES WEARINGS" ,
"LEATHER ARTICLES" ,
"LUBRICANTS & GREASE" ,
"MACHINERY FOR MINING, QUARRYING AND CONSTRUCTION" ,
"MADE-UP TEXTILE ARTICLES CORDAGE, ROPE, TWINE AND NETTING, BAGS, SACKS, RAPPING & PACKING MATERIALS" ,
"MADE-UP TEXTILE ARTICLES, EXCEPT APPAREL" ,
"MAN MADE FIBER" ,
"MAN-MADE FIBRES" ,
"Manfacture of printer ink" ,
"MANUFACTUR OF CONSUMER ELECTRONIC EQUIPMENT (TV,DVD,RADIO AND SIMILAR EQUIPMENT)" ,
"MANUFACTURE OF ARTIFICIAL LEATHER SUBSTITUTES" ,
"MANUFACTURE OF COMMUNICATION MACHINERIES,SPARE PARTS AND APPARATUS AND UTILITIES" ,
"MANUFACTURE OF ELECTRICAL MACHINERY, APPARATUS UTILITIES" ,
"manufacture of knitted and crocheted fabrics and articles" ,
"MANUFACTURE OF SPRING MATTRESS" ,
"MANUFACTURE OF TRANSPORT VEHICLES PARTS,SPARE PARTS AND TYRE" ,
"MANUFACTURE OF TYRES AND PLASTIC PRODUCTS" ,
"MANUFACTURE OF WOOD AND WOOD PRODUCTS" ,
"MANUFACTURING OF FURNITURE" ,
"MANUFACTURING OF GALVANIZED STEEL SHEETS" ,
"MANUFACTURING OF MOTORCYCLES" ,
"MANUFACTURING OF RAILWAY AND TRAMWAY LOCOMOTIVES AND ROLLING STOCK VEHICLES" ,
"MATERIALS AND PAINTING INKS USED FOR PROMOTION AND ADVERTISING" ,
"MEASURING SCALES" ,
"MEDICAL AND SURGICAL EQUIPMENT AND ORTHOPEDIC APPLIANCES" ,
"METAL STRUCTURES FROM ALUMINUM" ,
"METAL STRUCTURES FROM STEEL" ,
"MILLS FROM STONE" ,
"MINERALS AND MINERAL PRODUCTS" ,
"MOTOR VECHICLES" ,
"MOTOR VEHICLE PARTS AND ACCESSORIES" ,
"NON-METALLIC MINERAL PRODUCTS" ,
"OFFICE & HOUSE HOLD EQUIPMENTS" ,
"OFFICE AND HOUSEHOLD FURNITURE" ,
"OFFICE, ACCOUNTING AND COMPUTING MACHINERY" ,
"OPTICAL INSTRUMENTS AND PHOTOGRAPHIC EQUIPMENT" ,
"OTHER PETROLEUM/SYNTHESISED PRODUCTS" ,
"OTHER TANNING AND DRESSING OF LEATHER MANUFACTURE OF BAGGAGE, HANDLBAGS,SADDLER AND HARNESS." ,
"OTHER VEHICLE PARTS AND ACCESSORIES" ,
"PACKAGING MATERIALS" ,
"PAGERS, HAND PHONES AND TELECOMMUNICATIONS APPARATUS (EGPALMTOPS, SMART WATCHES, WEARABLE COMPUTER AND ELECTRONIC BOOKS)" ,
"PAINTS, VARNISHES AND SIMILAR COATINGS, PRINTING INK AND MASTICS" ,
"PAPER AND PAPER PRODUCTS" ,
"PAPER AND PAPER PRODUCTS AND STATIONERY" ,
"PASTA, MACARONI, NOODLES, COUSCOUS AND SIMILAR FARINACEOUS PRODUCTS" ,
"PERFUMES, COSMETICS ,ESSENTIAL OILS AND RESINOUS" ,
"PESTICIDES AND AGRO-CHEMICAL PRODUCTS" ,
"PHARMACETUCALS,MEDICINALCHEMICALS AND BOTANICAL PRODUCTS FOR HUMAN USE" ,
"PHARMACEUTICALS, MEDICAL CHEMICALS AND BOTANICAL PRODUCTS FOR HUMAN USE" ,
"PHOTOGRAPHIC AND OPTICAL INSTRUMENTS" ,
"PLASTIC PRODUCTS" ,
"PLASTICS IN PRIMARY FORM AND OF SYNTHETIC RUBBER" ,
"POLISHES,WAXES ,DRESSINGS AND INCENSE" ,
"PREPARATION OF CONFECTIONERY, INCLUDING COCOA AND CHOCOLATE" ,
"PREPARED ANIMAL FEEDS" ,
"PRINTING" ,
"PRINTING AND RELATED ACTIVITIES" ,
"PRINTING MATERIALS" ,
"PRINTING OF BOOKS, BROCHURES, MUSICAL BOOKS AND OTHERS" ,
"PROCESSING AND CASTING MINERALS" ,
"PROCESSING AND PRESERVING OF FRUIT AND VEGETABLES" ,
"PROCESSING OF FRESH MILK (PASTEURISING, HOMOGENISING, STERILISING AND VITAMINISING)" ,
"PROCESSING OF MEAT BY PRODUCTS INCLUDING HIDES, BONES, ETC" ,
"PRODUCTS OF WOOD(EXCEPT FURNITURE)" ,
"PULP, PAPER AND PAPERBOARD AND OF CONTAINERS MADE FROM PAPER PRODUCT" ,
"PVC GRANULE FOR SOLE & PLASTIC SHOE" ,
"RECREATIONAL EQUIPMENTS" ,
"RECYCLING OF NON-METAL WASTE AND SCRAP" ,
"REFRACTORY CERAMIC PRODUCTS" ,
"REPRODUCTION OF RECORDED MEDIA" ,
"RUBBER PRODUCTS" ,
"SANITARY NAPKIN(PAD )AND DIAPER" ,
"SECURITY CAMERA" ,
"SHEET & PLATE GLASS, GLASS BLOCKS, TUBES & RODS; GLASS FIBERS & GLASS WOOL" ,
"SHOES/CARS/PRINTING INK" ,
"SLAUGHTERING, DRESSING AND PACKING OF LIVESTOCK, INCLUDING POULTRY AND SMALL GAME FOR MEAT" ,
"SOAP AND OTHER CLEANING COMPOUNDS" ,
"SOFT DRINK,BOTTLED WATERS/MINERAL WATERS" ,
"SOFTWARE DEVELOPMENT ( INCLUDING DESIGN, ENRICHMENT AND IMPLEMENTATION)" ,
"Software Instalation,ommissioning,Monitoring and Erection Activity" ,
"SOUVENIRS,ARTIFACT AND ARTIFICIAL JEWELRY/ TRADITIONAL WEAR" ,
"SPECIAL PURPOSE MACHINERY" ,
"SPECIAL PURPOSE MACHINERY (FOR TEXTILE)" ,
"SPICES,CONDIMENTS,VBINGAR,YEAST,EGG PRODUCE SOUPS AND OTHER FOOD PRODUCT." ,
"SPINNING OF TEXTILE FIBERS AND WEAVING OF TEXTILES" ,
"SPINNING, WEAVING AND FINISHING OF TEXTILES" ,
"SPINNING, WEAVING AND FINISHING OF TRADITIONAL CLOTHES" ,
"SPINNING, WEAVING AND FINISHING OF YARNS AND FABRICS PREDOMINANTLY OF WOOL AND ANIMAL FIBERS" ,
"SPORTS GOODS AND ENTERTAINMENT REQUISITES" ,
"STONE PRODUCTS" ,
"STRUCTURAL CLAY AND CONCRETE PRODUCTS" ,
"STRUCTURAL METAL PRODUCTS" ,
"STRUCTURAL METAL PRODUCTS, TANKS, RESERVOIRS AND STEAM GENERATORS" ,
"STRUCTURAL NON-REFRACTORY CLAY AND CERAMIC PRODUCTS" ,
"SUGAR, INCLUDING GOLDEN SYRUP AND CASTOR SUGAR" ,
"TANKS, RESERVOIRS, SAFE BOXES AND SIMILAR CONTAINERS OF METAL" ,
"TELEVISION AND RADIO RECEIVERS, SOUND OR VIDEO RECORDING OR REPRODUCING APPARATUS AND ASSOCIATED GOODS" ,
"TENTS, TARPAULINS, SAILS AND CANVAS GOODS" ,
"textile and textile articles,textile ascceris" ,
"TEXTILES AND GARMENT" ,
"TOBACCO PRODUCTS" ,
"TOILET TISSUE AND NAPKIN PAPER" ,
"TRADITIONAL FOODS" ,
"TRANSPORT EQUIPMENT" ,
"TREATMENT AND COATING OF METALS; GENERAL MECHANICAL ENGINEERING ON A FEE OR CONTRACT BASIS" ,
"TYRES AND TUBES" ,
"VEGETABLES AND ANIMAL OIL FAT" ,
"VENEER SHEETS; PLYWOOD, LAMINBOARD, PARTICLE BOARD AND OTHER PANELS AND BOARDS" ,
"VETERINARY DRUGS, MEDICINES AND EQUIPMENTS" ,
"WEARING AND APPRAL, EXCEPT FUR APPAREL" ,
"WINE" ,
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