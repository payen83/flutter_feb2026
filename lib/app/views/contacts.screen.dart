
import 'package:flutter/material.dart';
import 'package:flutter_feb2026/app/views/add_contacts.screen.dart';
import 'package:flutter_feb2026/app/views/edit_contacts.screen.dart';
import 'package:flutter_feb2026/app/services/sharedprefs.service.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {

  List<Map<String,dynamic>> contacts = [
    // {
    //   'name': 'Ali bin Abu',
    //   'phone': '0192334453',
    //   'imageURL': 'https://upload.wikimedia.org/wikipedia/commons/0/03/Twitter_default_profile_400x400.png',
    // },
    // {
    //   'name': 'Wong Siu Mei',
    //   'phone': '0192334497',
    //   'imageURL': 'https://upload.wikimedia.org/wikipedia/commons/0/03/Twitter_default_profile_400x400.png',
    // },
    // {
    //   'name': 'Muthu a/l Samy',
    //   'phone': '01732321933',
    //   'imageURL': 'https://upload.wikimedia.org/wikipedia/commons/0/03/Twitter_default_profile_400x400.png',
    // }
  ];

  @override
  void initState(){
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    final loadedContacts = await SharedPrefs.loadData('contacts');
    setState(() {
      contacts = loadedContacts;
    });
  }

  void addNewContact(Map<String,dynamic> contactData) async{
    setState(() {
      contacts.add(contactData);
    });
    await SharedPrefs.saveData('contacts', contacts);
  }

  void editContact(int index, Map<String,dynamic> contactData) async{
    setState(() {
      contacts[index] = contactData;
    });
    await SharedPrefs.saveData('contacts', contacts);
  }

  void deleteContact(int index) async{
    setState(() {
      contacts.removeAt(index);
    });
    await SharedPrefs.saveData('contacts', contacts);
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
          return ContactWidget(
            contact: contact, 
            onEdit: editContact, 
            index: index,
            onDelete: deleteContact,
          );
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
    super.key, 
    required this.contact, 
    required this.index, 
    required this.onEdit,
    required this.onDelete
  });

  final Map<String,dynamic> contact;
  final int index;
  final Function(int, Map<String,dynamic>) onEdit;
  final Function(int) onDelete;

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
      trailing: IconButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=>EditContactScreen(
              onEditContact: onEdit, 
              contact: contact, 
              contactIndex: index,
              onDeleteContact: onDelete,
            ))
          );
        }, 
        icon: Icon(Icons.edit)
      ),
    );
  }
}