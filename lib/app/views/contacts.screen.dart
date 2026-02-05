import 'package:flutter/material.dart';
import 'package:flutter_feb2026/app/views/add_contacts.screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {

  final List<Map<String,dynamic>> contacts = [
    {
      'name': 'Ali bin Abu',
      'phone': '0192334453',
      'imageURL': 'https://upload.wikimedia.org/wikipedia/commons/0/03/Twitter_default_profile_400x400.png',
    },
    {
      'name': 'Wong Siu Mei',
      'phone': '0192334497',
      'imageURL': 'https://upload.wikimedia.org/wikipedia/commons/0/03/Twitter_default_profile_400x400.png',
    },
    {
      'name': 'Muthu a/l Samy',
      'phone': '01732321933',
      'imageURL': 'https://upload.wikimedia.org/wikipedia/commons/0/03/Twitter_default_profile_400x400.png',
    }
  ];

  void addNewContact(Map<String,dynamic> contactData){
    setState(() {
      contacts.add(contactData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index){
          final contact = contacts[index];
          return ContactWidget(contact: contact);
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ 
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>AddContactScreen(onAddContact: addNewContact))
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key, required this.contact
  });
  final Map<String,dynamic> contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contact['name'], style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(contact['phone']),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network('https://upload.wikimedia.org/wikipedia/commons/0/03/Twitter_default_profile_400x400.png',
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}