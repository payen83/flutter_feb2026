import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListTile(
        title: Text('Ali bin Abu', style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text('019-23455049'),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network('https://upload.wikimedia.org/wikipedia/commons/0/03/Twitter_default_profile_400x400.png',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
      )
    );
  }
}