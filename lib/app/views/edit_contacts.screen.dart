import 'package:flutter/material.dart';

class EditContactScreen extends StatefulWidget {
  const EditContactScreen({
    super.key, 
    required this.onEditContact, 
    required this.contact,
    required this.contactIndex,
    required this.onDeleteContact
  });

  final Function(int, Map<String, dynamic>) onEditContact;
  final Function(int) onDeleteContact;
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

  void showDeleteConfirmation(){
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Contact'),
          content: Text('Are you sure you want to delete ${widget.contact['name']}?'),
          actions: [
            TextButton(
              onPressed: () { Navigator.of(context).pop(); }, 
              child: Text('Cancel')
            ),
            TextButton(
              onPressed: () { 
                Navigator.of(context).pop(); 
                deleteContact();
              }, 
              child: Text('Delete', style: TextStyle(color: Colors.red),)
            ),
          ],
        );
      }
    );
  }

  void deleteContact(){
    widget.onDeleteContact(widget.contactIndex);
    viewSnackbar('${widget.contact['name']} deleted successfully');
    Navigator.of(context).pop();
  }

  void viewSnackbar(String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
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
                keyboardType: TextInputType.text,
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
                keyboardType: TextInputType.phone,
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
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: (){ showDeleteConfirmation(); }, 
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: Text('Delete Contact')
              )           
            ],
          )
        ),
      )
    );
  }
}