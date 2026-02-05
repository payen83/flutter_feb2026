import 'package:flutter/material.dart';

class EditContactScreen extends StatefulWidget {
  const EditContactScreen({
    super.key, 
    required this.onEditContact, 
    required this.contact,
    required this.contactIndex
  });

  final Function(int, Map<String, dynamic>) onEditContact;
  final Map<String, dynamic> contact;
  final int contactIndex;

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    nameController = TextEditingController(text: widget.contact['name']);
    phoneController = TextEditingController(text: widget.contact['phone']);
  }

  void submitForm(BuildContext context){
    if(formKey.currentState!.validate()){
      final contactData = {
        'name': nameController.text,
        'phone': phoneController.text
      };
      widget.onEditContact(widget.contactIndex, contactData);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contact'),
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
              ElevatedButton(
                onPressed: (){ 
                  submitForm(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white
                ),
                child: Text('Save Contact')
              )              
            ],
          )
        ),
      )
    );
  }
}