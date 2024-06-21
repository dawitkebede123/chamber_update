import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTemeplete extends StatefulWidget {
   String tel = '';
  String mobile = '';
  String website = '';
  String email = '';

   ContactTemeplete({super.key,this.tel = '',this.mobile='',this.website='',this.email=''});

  @override
  State<ContactTemeplete> createState() => _ContactTemepleteState();
}

class _ContactTemepleteState extends State<ContactTemeplete> {
  @override
  Widget build(BuildContext context) {
  String tel = widget.tel;
  String mobile = widget.mobile;
  String website = widget.website;
  String email = widget.email;
  
    return  Column(
      children: [
        //  Text('hellp'),
         if(tel!='')
             Padding(
               padding: const EdgeInsets.only(left: 20.0,right: 20),
               child: Row(
                             children: [
                               InkWell( // Wrap the content in an InkWell
                                              onTap: () {
                                                launch('tel:$tel'); // Launch the phone dialer with the number
                                              },
                              child: Row(
                                 children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Container(
                                                                           // color: Colors.amber,
                                                           decoration: BoxDecoration(
                                                             color:Color.fromARGB(255, 0, 114, 63),
                                                             borderRadius:BorderRadius.circular(999) ,
                                                           ),
                                                           child: const Padding(
                                                             padding: EdgeInsets.all(12.0),
                                                             child: Icon(Icons.call,color: Colors.white,size: 16 ,),
                                                           )),
                                     ),
                                   SizedBox(width: 10,),

                                    Text('$tel',softWrap: true,overflow: TextOverflow.ellipsis,),
                                
                                      // SvgPicture.asset('assets/images/vector1.svg',width: 10,height: 10,),

                                 ],
                               ),),
                             ],
                           ),
             ),
         if(mobile!='')
          Padding(
               padding: const EdgeInsets.only(left: 20.0,right: 20),
               child: Row(
                             children: [
                               InkWell( // Wrap the content in an InkWell
                                              onTap: () {
                                                launch('tel:$mobile'); // Launch the phone dialer with the number
                                              },
                              child: Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Container(
                                      // color: Colors.amber,
                                                         decoration: BoxDecoration(
                                                           color:Color.fromARGB(255, 0, 114, 63),
                                                           borderRadius:BorderRadius.circular(999) ,
                                                         ),
                                                         child: const Padding(
                                                           padding: EdgeInsets.all(12.0),
                                                           child: Icon(Icons.mobile_screen_share,color: Colors.white,size: 16 ,),
                                                         )),
                                   ),
                                   SizedBox(width: 10,),
                                   Text('$mobile',softWrap: true,overflow: TextOverflow.ellipsis,),
                                 ],
                               ),),
                             ],
                           ),
             ),
          if(website!='')
            Padding(
                         padding: const EdgeInsets.only(left: 20.0,right: 20),
                         child: Row(
                         children: [
                          InkWell( // Wrap the content in an InkWell
                             onTap: () {
                               // ignore: deprecated_member_use
                               launch('$website'); // Launch the URL in a web browser
                                            },
                           child:Row(
                           children: [
                             Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Container(
                                      // color: Colors.amber,
                                                         decoration: BoxDecoration(
                                                           color:Color.fromARGB(255, 0, 114, 63),
                                                           borderRadius:BorderRadius.circular(999) ,
                                                         ),
                                                         child: const Padding(
                                                           padding: EdgeInsets.all(12.0),
                                                           child: Icon(Icons.web,color: Colors.white,size: 16 ,),
                                                         )),
                                   ),
                             
                             SizedBox(width: 10,),
                             Text(website,softWrap: true,overflow: TextOverflow.ellipsis,),
                           ],
                         )),],),
                       ),
          if(email!='')
                Padding(
                         padding: const EdgeInsets.only(left: 20.0,right: 20),
                         child: Row(
                                              children: [
                         InkWell( // Wrap the content in an InkWell
                                            onTap: () {
                                              launch('mailto:$email'); // Launch email app with recipient
                                            },
                                            child: Row(
                           children: [
                              Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Container(
                                                                           // color: Colors.amber,
                                                           decoration: BoxDecoration(
                                                             color:const Color.fromARGB(255, 0, 114, 63),
                                                             borderRadius:BorderRadius.circular(999) ,
                                                           ),
                                                           child: const Padding(
                                                             padding: EdgeInsets.all(12.0),
                                                             child: Icon(Icons.email, color: Colors.white,size: 16 ,),
                                                           )),
                                     ),
                              
                              SizedBox(width: 10,),
                             Text(email,softWrap: true,overflow: TextOverflow.ellipsis,),
                           ],
                         ),)]),
                       ),
      ],
    );
  }
}