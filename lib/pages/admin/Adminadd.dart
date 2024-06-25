import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// Import additional libraries if needed, like Firebase or form validation

class AddBusinessPage extends StatefulWidget {
  AddBusinessPage({super.key});
 
  
// - Account Name
// - Category
// - Email
// - Image - 
// - Is-adv - false
// - Mobile 
// - Profile 
// - Sector
// - Sub-Sector
// - Tel
// - Video - 
// - Website
// - logo - 
// - status - business
  @override
  State<AddBusinessPage> createState() => _AddBusinessPageState();
}

class _AddBusinessPageState extends State<AddBusinessPage> {
  bool? _isAdv = false;
    String? _selectedValue = 'business';
   final accountNameController = TextEditingController();
  // final categoryController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final telController = TextEditingController();
  final websiteController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // For form validation
  // Define form fields and state variables here
  // String _name = '';
  // String _email = '';
  // String _tel = '';
  // String _mobile = ''; // Possible values: "Almanac" or "Business Directory"
  // String _contact = '';
  // ... other fields

Future<void> addDataToRealTimeDatabase( Map<String, dynamic> data) async {
  // Get a reference to the desired database location
  if(data['Category']=='business'){
  final databaseRef = FirebaseDatabase.instance.ref('Query10').push();
  await databaseRef.set(data);
  }
  else{
     final databaseRef = FirebaseDatabase.instance.ref('Almanac').push();
  await databaseRef.set(data);
  }

  // Set the data at the reference location
  
  print('Data added successfully!');
}


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
         title: const Text('Add Business'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign form key
          child: Column(
            children: [
              TextFormField(
                controller: accountNameController,
                decoration: const InputDecoration(labelText: 'Business Name'),
                       validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a business name';
                  }
                  return null; // Valid
                },

                // onSaved: (value) => setState(() => _name = value!),
              ),
              TextFormField(
                 controller: emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
             
                // onSaved: (value) => setState(() => _email = value!),
              ),
              TextFormField(
                 controller: telController,
                decoration: const InputDecoration(labelText: 'Office Phone  Number'),
               
                // onSaved: (value) => setState(() => _Tel = value!),
              ),
               TextFormField(
                 controller: mobileController,
                decoration: const InputDecoration(labelText: 'Mobile  Number'),
              
                // onSaved: (value) => setState(() => _Tel = value!),
              ),
                TextFormField(
                 controller: websiteController,
                decoration: const InputDecoration(labelText: 'Website'),
       
              ),
              SizedBox(height: 20,),
              const Row(children: [
               Text('Category'),
        
              ],),
              Row(children: [
              Radio<String>(
                value: 'business',
                groupValue: _selectedValue,
                onChanged: (value) => setState((){
                 _selectedValue = value;
                //  uniqueBusinesses = [];
                } ),
              ),
              Text('Business'),
              ],),
              
              Row(
                children: [
                Radio<String>(
                value: 'almanac',
                groupValue: _selectedValue,
                onChanged: (value) => setState((){
                 _selectedValue = value;
                //  uniqueBusinesses = [];
                } ),
              ),
              Text('Almanac'),
                ],
              ),
              SizedBox(height: 20,),
               Row(
                 children: [
                   Checkbox(
                                 value: _isAdv, // Set the current value
                                 onChanged: (newValue) {
                    setState(() { // Update the state when checkbox changes
                      _isAdv = newValue!;
                    });
                                 },
                                 activeColor: Colors.green, // Color when checked
                                
                               ),
                Text('Is Adv'),

                 ],
               ),
                           ElevatedButton(
                onPressed: () async {
                  // if (_formKey.currentState!.validate()) {
                    // _formKey.currentState!.save(); // Save form data
                
                    final data = {
                     'Account Name':accountNameController.text.toUpperCase(),
                     'Email': emailController.text,
                     'Tel':telController.text,
                     'Mobile':mobileController.text,
                     'Website':websiteController.text,
                     'Is-adv':'False',
                     'Image':'',
                     'Profile':'',
                     'Sector':'',
                     'Sub-Sector':'',
                     'Video':'',
                     'Category':_selectedValue,
                     'logo':'',
                     'status':'',
                    };
                     await addDataToRealTimeDatabase(data);
                      const snackBar = SnackBar(content: Text('added successfully'),
                backgroundColor: Colors.red,
                
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context); // Close the Add Business page
                  // }
                },
                child: const Text('Register Business'),
              ),
             
              ])))

      );
      }}





