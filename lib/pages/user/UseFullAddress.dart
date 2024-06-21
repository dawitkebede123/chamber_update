import 'package:chamber_of_commerce/pages/user/Almanac.dart';
import 'package:chamber_of_commerce/pages/user/Home.dart';
import 'package:chamber_of_commerce/widgets/CustomBottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/FAQ.dart';
import 'package:chamber_of_commerce/widgets/GridScreen.dart';
import 'package:chamber_of_commerce/widgets/expandedPanel%20_usefull_address.dart';
import 'package:chamber_of_commerce/widgets/expandedPanel.dart';
import 'package:chamber_of_commerce/widgets/expandedPanelUsefulAddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UsefullAddress extends StatelessWidget {
  const UsefullAddress ({super.key});

  @override
  Widget build(BuildContext context) {
     final List<Map<String,dynamic>> data = [
      {
       "category":"Bank",
       "title":"National Bank of Ethiopia ",
       "tel": "+251 115-175271"
      },
       {
   "category":"Bank",     
  "title":"Ahadu Bank S.C.",
"tel": "+251-115261717"
  },
  {
    "category":"Bank",     
"title":"Gadaa Bank S.C.",
 "tel":"+251-911225229"
  },
{
  "category":"Bank",     
"title":"Omo Bank S.C.",
"tel": "+251-462202053"
},
{
  "category":"Bank",     
"title":"Rammis Bank S.C.",
 "tel": "+251-115621202"
},
{
  "category":"Bank",     
"title":"Shabelle Bank S.C.",
"tel": "+251-117756976/77"
},
{
  "category":"Bank",
"title": "Sidama Bank S.C",
 "tel":"+251-114-704-726"

},
{
  "category":"Insurance",
"title": "Zemen Insurance ",
 "tel":"+251-116-686-274/+251-116-151-493"
},
{
  "category":"Capital Goods",
        "title": "Addis Capital Goods Finance Business S.C.",
        "tel": "+251-111-262-445 / +251-111-262-411"
    },
    {
      "category":"Capital Goods",
        "title": "Debub Capital Goods Finance Business S.C.",
        "tel": "+251-462-125-191; +251-936-475-076"
    },
    {
      "category":"Capital Goods",
        "title": "Ethio-Lease Ethiopian Capital Goods Finance Business S.C.",
        "tel": "+251-116-393-397/ +251-116-393-395/ +251-930- 681-819"
    },
    {
      "category":"Capital Goods",
        "title": "Kaza Capital Goods Finance Business S.C.",
        "tel": "+251 -342-400-087/+251-344-400-085/ +251-930-469-095"
    },
    {
      "category":"Capital Goods",
        "title": "Oromia Capital Goods Finance Business S.C.",
        "tel": "+251-115-571-307/251-115-571-337/251-911-019-828"
    },
    {
      "category":"Capital Goods",
        "title": "Waliya Capital Goods Finance Business S.C.",
        "tel": "+251-582-206-780/251-582-206-728/251-930-111-703"
    },
    {
      "category":"Microfinance",
    "title":"Adaday Microfinance Institution S.C.",
    "tel":"+251-342405095/342405069/914749064",
  },
   {
    "category":"Microfinance",
    "title":"Afar Microfinance Institution S.C",
    "tel":"+251-336660868/919982378",
  },
  {
    "category":"Microfinance",
    "title":"Africa Village Financial Services S.C.",
    "tel":"+251-116463569/ 251-911370880/ 251-930362553",
  },

 {
  "category":"Microfinance",
    "title":"Aggar Microfinance S.C.",
    "tel":"+251-115577133/ 116183382; +251-911254761",
  },
  {
    "category":"Microfinance",
    "title":"Amhara Credit and Saving Institution S. Co.",
    "tel":"058-2201652 0918340256/0918784701/0912901739",
  },
  {
    "category":"Microfinance",
    "title":"Benishangul-Gumuz Microfinancing S.C.",
    "tel":" +251-577750666/ 251-577752042/ 251-913939415",
  },
  {
    "category":"Microfinance",
   "title":"Buusaa Gonofaa MicroFinancing S.C.",
   "tel": "+251-114-162-621/ 251-114-162-210/ 251-911-223-679",
  },
 
   {
    "category":"Microfinance",
    "title":"Debo Microfinance Institution S.C.",
  
    "tel":"+251-116721518/19; +251-917823995"
    ,
  },
   {
    "category":"Microfinance",
    "title":"Dedebit  Credit and Saving Institution S.C."
    ,
    "tel":
 "+251-344409306/251-988269371"
    ,
  },
   {
    "category":"Microfinance",
    "title":"Dire Microfinance Institution S.C."
    ,
    "tel":" +251-251129702/1127072/1119246/47 +251-915754951",
  },
  
   {
    "category":"Microfinance",
    "title":"Dynamic Microfinance S.C.",
    "tel":"+251-115156817/115577285/911246806",
  },
  {
    "category":"Microfinance",
    "title":"ESHET Microfinance Institution S.C.",
    "tel":"+251-113206451/52; +251-902481762",
  },
  {
    "category":"Microfinance",
    "title":"Gambella Microfinancing S.C.",
    "tel":"+251-475511271/910460091",
  },
   {
    "category":"Microfinance",
    "title":"Gasha Micro Financing S.C",
    "tel":"0118952389/90/91; +251-911240437",
  },
   {
    "category":"Microfinance",
    "title":"GOGIBA Microfinance Institution S.C.",
    "tel":" +251-911951484",
  },
   {
    "category":"Microfinance",
    "title":"Grand Microfinance Institution S.C",
    "tel":" +251-911133287/948852760/114705102",
  },
  {
    "category":"Microfinance",
    "title":"Harbu Microfinancing Institution S.C.",
    "tel":" +251-116185510/911306545",
  },
  {
    "category":"Microfinance",
    "title":"KAAFI Microfinance Institution S.C.",
    "tel":" +251-946877364/911832091",
  },
   {
    "category":"Microfinance",
    "title":"Kendil Microfinance Institution S.C.",
    "tel":" +251-461105952/3831/5663; +251-913252247",
  },
   {
    "category":"Microfinance",
    "title":"Kershi Microfinance Institution S.C.",
    "tel":" +251-118721106/2; +251-966566609",
  },
    {
      "category":"Microfinance",
    "title":"Lefayeda Credit and Saving S.C.",
    "tel":" +251-115581546/914 317010",
  },
 {
     "category":"Microfinance",
    "title":"Lideta Microfinance Institution S.C.",
    "tel":" +251-919032777/914766154",
  },
  {
    "category":"Microfinance",
    "title":"Liyu Microfinance Institution S.C",
    "tel":" +251-115576638/116622780/911625576",
  },
  {
     "category":"Microfinance",
    "title":"Meklit Microfinance Institution S.C.",
    "tel":"+251-113484152/ 251-113482183/ 251-912611723",
  },
   {
     "category":"Microfinance",
    "title":"ONE Microfinance Institution S.C.",
    "tel":"+251-116595363/116636947/911319055",
  },
   {
     "category":"Microfinance",
    "title":"Peace Micro Financing S.C.",
    "tel":"+251-116521541/ 251-116616986/ 251-911219506",
  },
  {
    "category":"Microfinance",
    "title":"Rays Microfinance Institution S.C.",
    "tel":"+251-114701834/913386180",
  },
  {
     "category":"Microfinance",
    "title":"SAHAL Microfinance Institution S.C",
    "tel":"+251-915768505",
  },
  {
     "category":"Microfinance",
    "title":"Sheger Microfinance Institution S.C.",
    "tel":"+251-113698998/113698894/113699612/911245736",
  },
   {
     "category":"Microfinance",
    "title":"Tesfa Microfinance Institution S.C.",
    "tel":"+251-911261007/913157521",
  },
  {
     "category":"Microfinance",
    "title":"Vision Fund Microfinance Institution S.C.",
    "tel":"+251-116463569/251-911370880/251-930362553",
  },
   {
     "category":"Microfinance",
    "title":"Wasasa Microfinance Institution S.C.",
    "tel":"+251-911673822/ 251-113384133",
  },
   {
     "category":"Microfinance",
    "title":"Yemsirach Microfinance Institution S.C.",
    "tel":"+251-118312404/911318625",
  },






  {
  "title":"telebirr",
"tel": ""
  },
  {
"title":"mpesa",
 "tel":""
  },
    {
       "category":"Fintech",
      "title": "Addis Pay Financial Technology S.C", "tel": "+251-116-684-243"},
   {
     "category":"Fintech",
    "title": "Arifpay", "tel": "+251-989-967-575"}, 

    {
      "category":"Fintech",
      "title": "Belcash", "tel": "+251-116-174-455"},
    {"category":"Fintech",
      "title": "Chapa", "tel": "+251-960-724-272"},

    {"category":"Fintech",
      "title": "EBirr", "tel": "+251-6836"},
    {"category":"Fintech",
      "title": "Kifiya", "tel": "+251-116-671-579"},
    {"category":"Fintech",
      "title": "Premier Switch Solution S.C", "tel": "+251-115-570-581"},
    {"category":"Fintech",
      "title": "Santim Pay Financial Technology S.C", "tel": "+251-115-576-369"},
    {"category":"Fintech",
      "title": "Yagout Pay Financial Technology S.C", "tel": "+251-116-722-572"},

 {"category":"Fintech",
  "title": "Yaya Payment Instrument Issuer S.C", "tel": "+251-118-494-836"},
   
 ];

     var scaffold = Scaffold(
      //  drawer:const BackButton(
      //   //  backgroundColor: Colors.white,
      //  ),
      
       



      
      appBar: AppBar(
        backgroundColor:Colors.white,
        
         leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed:()=>{
          Navigator.push(
                context,
                 TransparentRoute(
               
                page:  Almanac(),
              ),
              ),
            }
          ),
        // padding: const EdgeInsets.all(16.0), // Add padding on all sides
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0), // Set border radius
    ),
       
        title:const Text(
          'Usefull Addresses',
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
        Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20),
          child: ExpandedPanelUsefullAddress(data: data,clickable: true,),
        )
        
         
         
          
    
      
     );
     
    return scaffold;
  // );
  }
 
  // }
  
}