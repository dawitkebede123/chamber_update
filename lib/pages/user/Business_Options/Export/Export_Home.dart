import 'package:carousel_slider/carousel_slider.dart';
import 'package:chamber_of_commerce/pages/user/Business.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Agriculture/Agriculture_Listing.dart';
import 'package:chamber_of_commerce/pages/user/Business_Options/Export/Export_Listing.dart';
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


class Export_Home extends StatefulWidget {
  const Export_Home({super.key});
  @override
  State<Export_Home> createState() => _Export_HomeState();
}

class _Export_HomeState extends State<Export_Home> {
  String _query = '';
  List <String> title = [
"ACCESORIES & COMPONENTS" ,
"ACCESSORIES AND COMPONENTS FOR FINISHING TEXTILE AND LEATHER PRODUCTS" ,
"AGRICULTURAL PRODUCTS" ,
"AGRICULTURAL RAW MATERIALS" ,
"ALUMINIUM PRODUCTS" ,
"ANIMAL & WASTE PRODUCTS" ,
"ANIMAL BY PRODUCTS" ,
"ANIMAL FEED" ,
"APPAREL AND CLOTHING" ,
"BAGS, LUGGAGE’S AND RELATED PRODUCTS" ,
"BAKERY PRODUCTS" ,
"BEER" ,
"BEEWAX" ,
"BEVERAGE CROPS" ,
"BEVERAGES" ,
"BOOKS AND MAGAZINES" ,
"BOOKS AND STATIONARY MATERIALS" ,
"BOTTLED WATER" ,
"BROKERS DUTIES" ,
"CANDLES AND TEWAF" ,
"CEREALS" ,
"CLEANING AND COSMOTICS" ,
"CLEANING AND COSMOTICS EQUIPMENTS" ,
"COAL, COKE AND BRIQUETTES" ,
"COFFEE" ,
"COFFEE AND TEA" ,
"COMMUNICATION, COMPUTER AND RELATED EQUIPMENT" ,
"CONSTRUCTION EQUIPMENT AND ITS SPARE PARTS" ,
"CONSTRUCTION MATERIALS" ,
"CONSTRUCTION MATERIALS HARDWARE, PLUMBING AND HEATING EQUIPMENT AND SUPPLIES" ,
"CONSTRUCTION MATERIALS, HARDWARE, PLUMBING" ,
"COSMETICS ,ESSENTIAL OILS AND RESINOUS ,PERFUME AND CHEMICALS FOR PERFUMES" ,
"COTTON" ,
"COTTON, TEXTILE FIBERS,YARN, TEXTILES AND TEXTILES CLOTHING" ,
"CROCKERY, CUTLERY AND KITCHEN UTENSILS" ,
"CULTURAL CLOTHES" ,
"CUSTOMS CLEARANCE" ,
"CUT FLOWERS AND PLANTS" ,
"DAIRY PRODUCTS" ,
"EDIBLE OILS & FATS" ,
"EDUCATION EQUIPMENT AND TOOLS" ,
"ELECTRICAL EQUIPMENTS AND APPLIANCES" ,
"Ethanol and Molasses" ,
"EXPORT OF BEVERAGE CROPS (EXCEPT COFFEE AND TEA)" ,
"EXPORT TRADE" ,
"EXPORT TRADE IN BEVERAGE PRODUCTS" ,
"EXPORT TRADE IN INTERMEDIATE PRODUCTS,WASTE AND SCRAPS" ,
"EXPORT TRADE IN LIVE ANIMALS AND ANIMAL BY PRODUCTS" ,
"EXPORT TRADE IN PROCESSED COFFEE AND COFFEE LEAVES" ,
"FABRICATED METALS" ,
"FEEDING STUFF FOR ANIMALS" ,
"FLOUR" ,
"FOOD ADDITIVES" ,
"FOOD PRODUCTS" ,
"FOOD STUFF" ,
"FOOTWEAR AND LEATHER GOODS" ,
"FRUITS & VEGETABLES" ,
"GRAIN MILL SPARE PARTS" ,
"HONEY AND HONEY PRODUCTS" ,
"HOUSEHOLD AND OFFICE FURNITURE, REQUZITE, BOARDS, APPLIANCES" ,
"HOUSEHOLD ELECTRICAL APPLIANCES AND EQUIPMENT" ,
"HUMAN HEALTH MEDICAL SUPPLIES AND EQUIPMENTS" ,
"HUMAN MEDICAL SUPPLIES AND EQUIPMENTS" ,
"IMPORTING OF VEHICLES" ,
"INCENSE & GUMS" ,
"INDUSTRIAL MACHINERY , EQUIPMENT AND ITS SPARE PARTS" ,
"INDUSTRIAL, AGRICULTURAL AND CONSTRUCTION MACHINERIES AND OTHER RELATED WORKS" ,
"INDUSTRIAL,AGRICULTURAL AND CONSTRUCTION MACHINERY AND EQUIPMENTS" ,
"INEDIBLE ANIMAL PRODUCT" ,
"IRON AND STEEL" ,
"LEATHER, LEATHER PRODUCTS, FOOTWEAR AND RELATED PRODUCTS" ,
"LIVE ANIMAL PRODUCTS FOR CONSUMPTION" ,
"LIVESTOCK" ,
"LIVESTOCK AND LIVESTOCK PRODUCTS" ,
"LIVESTOCK PRODUCTS" ,
"LOG AND TIMBER" ,
"LOGS AND TIMBER" ,
"MADE-UP TEXTILE ARTICLES CORDAGE, ROPE, TWINE AND NETTING, BAGS, SACKS, RAPPING & PACKING MATERIALS" ,
"MATERIALS AND PAINTING INKS USED FOR PROMOTION AND ADVERTISING" ,
"MEAT & POULTRY" ,
"MEDICINAL CROPS" ,
"MEDICINES" ,
"METAL ,NON METALS, METAL ORES AND SCRAPS" ,
"METAL AND NON METAL SCRAPS" ,
"MINERALS AND MINERAL PRODUCTS" ,
"MUSICAL, RECREATIONAL, CRAFT AND SOUVENIR GOODS" ,
"NON FERROUS METALS" ,
"NON METALLIC MINERALS" ,
"NON METALLIC MINERALS (CLAY,CERAMICS,GYPSUM,LIME AND THEIR PRODUCT)" ,
"NON METALLIC SCRAPS AND WASTES" ,
"NONE METALLIC MINERALS" ,
"OILSEEDS" ,
"PACKAGING MATERIALS" ,
"PAPER AND PAPER PRODUCTS" ,
"PAPER AND PAPER PRODUCTS AND STATIONERY MATERIALS" ,
"PASTAS MACARONI NOODULE AND ALIKE PRODUCTS" ,
"PEPPER AND SPICES" ,
"PHARMACEUTICAL AND MEDICALS EQUIPMENTS" ,
"PHOTOGRAPHIC APPARATUS, EQUIPMENT AND SUPPLIES AND OPTICAL GOODS" ,
"PICKLE WET BLUE CRUST AND FINISHED LEATHER" ,
"PLANT SEED" ,
"PLANT SEEDS" ,
"PLASTICS IN PRIMARY FORMS AND NON-PRIMARY FORMS" ,
"PLUMBING" ,
"PRECIOUS STONES, JEWELERY AND SILVERWARE" ,
"PRECIOUS STONES, JEWELLERY AND SILVERWARE" ,
"PROCESSED AGRICULTURAL PRODUCTS" ,
"PROCESSED COFFEE" ,
"PROCESSED PULSES" ,
"PULSES" ,
"PULSES/CEREALS" ,
"RAW RUBBER AND FIBER PRODUCTS" ,
"RECORDED CD’S, VCD’S AND RELATED PRODUCTS" ,
"RUBBER, PLASTICS AND PLASTIC PRODUCTSAND BATTERIES" ,
"SHEEP / GOATS & RELATED PRODUCTS" ,
"SOAPS, DETERGENTS, TOILETRIES, CHEMICALS FOR CLEANSING, POLISHING AND CLEANSING" ,
"SOFTWARE" ,
"SOUVENIR , ARTIFACTS AND ARTIFICIAL JEWELRY/CULTURAL CLOTHES" ,
"SOUVENIRS , ARTIFACTS AND ARTIFICIAL JEWELRY" ,
"STATIONARY MATERIALS, PAPER AND PAPER PRODUCTS" ,
"STATIONERY" ,
"STRUCTURAL CLAY AND CONCRETE PRODUCTS" ,
// "Sub-Sector" ,
"SUGAR" ,
"TANTALEM PRECIOUS STONES, JEWELLERY AND SILVERWARE" ,
"TANTALUM MINERALS" ,
"TEA" ,
"TEXTILE AND LEATHER PRODUCTS" ,
"textile and textile articles,textile ascceris" ,
"TEXTILE FIBERS, COTTON, YARN AND APPAREL" ,
"TEXTILE PRODUCTS EXCEPT GARMENT" ,
"TEXTILES AND LEATHER GOODS" ,
"TEXTILES FIBERS AND YARN" ,
"TRADE IN TEXTILES" ,
"TRADITIONAL DRINK SERVING HOUSES" ,
"USED MOTOR VEHICLES" ,
"VEGETABLES AND ANIMAL OIL FAT" ,
"WILD ANIMAL PRODUCTS (TAXIDERMY)" ,
"WOOL, HIDES, SKINS AND FEATHERS" ,
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
    "assets/images/business_lists/5.svg"
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
          'Export',
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
              child: Business_Top_List(index: 0),
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
                              //  final item = categories[index];
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
                                         child:SvgPicture.asset(categories[index])
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
                        page:  Export_listing(index: index,title:title[index],businessCompanyProfile: businessCompanyProfile),
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