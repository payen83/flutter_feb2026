import 'package:flutter/material.dart';

class AddContactScreen extends StatelessWidget {
  AddContactScreen({super.key, required this.onAddContact});
  final Function(Map<String, dynamic>) onAddContact;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void submitForm(BuildContext context) {
    if(formKey.currentState!.validate()){
      final contactData = {
        'name': nameController.text,
        'phone': phoneController.text
        // 'imageURL': imageURLController.text
      };
      onAddContact(contactData);

      nameController.clear();
      phoneController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Contact'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter contact name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Enter phone number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.call)
                ),
              ),
              SizedBox(height: 8),
              // TextFormField(
              //   controller: imageURLController,
              //   decoration: InputDecoration(
              //     labelText: 'Image URL',
              //     hintText: 'Enter image link',
              //     border: OutlineInputBorder(),
              //     prefixIcon: Icon(Icons.image)
              //   ),
              // ),
              // SizedBox(height: 8),
              ElevatedButton(
                onPressed: (){ 
                  submitForm(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white
                ),
                child: Text('Add Contact')
              )              
            ],
          )
        ),
      )
      
    );
  }
}