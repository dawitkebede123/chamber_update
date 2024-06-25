import 'package:chamber_of_commerce/widgets/ContactTemplete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


  

// ignore: must_be_immutable
class ExpandedPanelUsefullAddress extends StatefulWidget {
  final List<Map<String,dynamic>> data;
  bool clickable;
  ExpandedPanelUsefullAddress({super.key,required this.data, this.clickable = false});

  @override
  State<ExpandedPanelUsefullAddress> createState() => _ExpandedPanelUsefullAddressState();
}

class _ExpandedPanelUsefullAddressState extends State<ExpandedPanelUsefullAddress> {


  @override
  Widget build(BuildContext context) {
    final List <String> category = [
     "Bank",
     "Insurance",
     "Microfinance",
      "Fintech",
     "Capital Goods", 
    
    
    ];
   return ListView.builder(
  itemCount: category.length,
  itemBuilder: (context, index) {
    final currentCategory = category[index]; // Store current category

    // Check if any data items belong to the current category
    final matchingData = widget.data.where((item) => item['category'] == currentCategory).toList();

    return ExpansionTile(
      collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      title: Text(currentCategory, style: const TextStyle(color: Colors.black)),
      children: [
        if (matchingData.isNotEmpty) // Check if there's matching data
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: matchingData.length,
              itemBuilder: (_, ind) {
                final item = matchingData[ind];
                return Card(
                        color: const Color.fromARGB(255, 229, 234, 232),
                        child: ExpansionTile(
                          collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
                          shape: const RoundedRectangleBorder(side: BorderSide.none),
                          title: Text(item['title'], style: const TextStyle(color: Colors.black)),
                          children: [
                            Container(
                              width: double.infinity,
                              color: Colors.white,
                              child:Column(
                          children: [
                            ContactTemeplete(tel: item['tel'],),
                            // Add other information from the item here
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  },
);
    
         
    
   
  }



}
