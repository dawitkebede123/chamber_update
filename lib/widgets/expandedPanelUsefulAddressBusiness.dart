import 'package:chamber_of_commerce/widgets/ContactTemplete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ExpandedPanelUsefullAddressBusiness extends StatefulWidget {
  final List<dynamic> data;
  bool clickable;

  ExpandedPanelUsefullAddressBusiness({super.key, required this.data, this.clickable = false});

  @override
  State<ExpandedPanelUsefullAddressBusiness> createState() => _ExpandedPanelUsefullAddressBusinessState();
}

class _ExpandedPanelUsefullAddressBusinessState extends State<ExpandedPanelUsefullAddressBusiness> {
  @override
  Widget build(BuildContext context) {
    final List<dynamic> category = [
      "High Offices",
      "Ministry",
      "Addis Ababa City Administration Offices",
      "Corporation and Enterprise",
      "Agency",
      "Authority",
      "Institutes",
      "Business Associations",
      "Deplomatic Mission in Ethiopia",
      "Ethiopian Deplomatic Mission Ab",
      "International and Regional Organization",
      "Regional Chamber of Commerce",
    ];

    return ListView.builder(
      itemCount: category.length,
      itemBuilder: (context, index) {
        final currentCategory = category[index];
        final matchingData = widget.data.where((item) => item['Category'] == currentCategory).toList();

        return ExpansionTile(
          collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
          shape: const RoundedRectangleBorder(side: BorderSide.none),
          title: Text(currentCategory, style: const TextStyle(color: Colors.black)),
          children: [
            if (matchingData.isNotEmpty)
              SingleChildScrollView( // Wrap with SingleChildScrollView
                child: ListView.builder(
                  shrinkWrap: true, // Set shrinkWrap to true
                  physics: const NeverScrollableScrollPhysics(), // Disable scrolling in inner ListView
                  itemCount: matchingData.length,
                  itemBuilder: (_, ind) {
                    final item = matchingData[ind];
                    final tel = item['Tel'].toString();
                    final mobile = item['Mobile'].toString();
                    final email = item['Email'];
                    final website = item['Website'].toString();

                    return Card(
                      color: const Color.fromARGB(255, 229, 234, 232),
                      child: ExpansionTile(
                        collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
                        shape: const RoundedRectangleBorder(side: BorderSide.none),
                        title: Text(item['Institution'], style: const TextStyle(color: Colors.black)),
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            child:Column(
                        children: [
                     if(tel=='' && mobile==''&&email==''&&website=='')
                        ContactTemeplete(),
                       if(tel=='' && mobile==''&&email==''&&website!='')
                        ContactTemeplete(website: website,),
                       if(tel=='' && mobile==''&&email!=''&&website=='')
                        ContactTemeplete(email: email,),
                       if(tel=='' && mobile!=''&&email==''&&website=='')
                        ContactTemeplete(mobile: mobile,),
                       if(tel!='' && mobile==''&&email==''&&website=='')
                        ContactTemeplete(tel: tel),
                       if(tel!='' && mobile==''&&email==''&&website!='')
                        ContactTemeplete(tel: tel,website: website,),
                       if(tel!='' && mobile==''&&email!=''&&website=='')
                        ContactTemeplete(tel: tel,email: email,),
                       if(tel!='' && mobile==''&&email!=''&&website!='')
                        ContactTemeplete(tel: tel,email: email),
                       if(tel!='' && mobile!=''&&email==''&&website=='')
                        ContactTemeplete(tel: tel,mobile:mobile),
                       if(tel!='' && mobile!=''&&email==''&&website!='')
                        ContactTemeplete(tel: tel,mobile:mobile,website: website,),
                       if(tel!='' && mobile!=''&&email!=''&&website!='')
                        ContactTemeplete(tel: tel,mobile:mobile,email: email,website: website,),
                       if(tel=='' && mobile==''&&email!=''&&website!='')
                        ContactTemeplete(email: email,website: website,),
                       if(tel=='' && mobile!=''&&email==''&&website!='')
                        ContactTemeplete(mobile:mobile,website: website,),
                         if(tel!='' && mobile!=''&&email!=''&&website=='')
                        ContactTemeplete(tel:tel,mobile: mobile,email: email),
                       if(tel=='' && mobile!=''&&email!=''&&website!='')
                        ContactTemeplete(mobile:mobile,email: email,website: website,),
                       if(tel!='' && mobile==''&&email!=''&&website!='')
                        ContactTemeplete(tel: tel,email: email,website: website,),
                       if(tel=='' && mobile!=''&&email==''&&website!='')
                        ContactTemeplete(mobile:mobile,website: website,),
                            // Add other information from the item here
                        ],
                      ),
                          ),
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
