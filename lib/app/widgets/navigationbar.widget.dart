import 'package:flutter/material.dart';
import 'package:flutter_feb2026/app/views/camera.screen.dart';
import 'package:flutter_feb2026/app/views/contacts.screen.dart';
import 'package:flutter_feb2026/app/views/layout.screen.dart';
import 'package:flutter_feb2026/app/views/products.screen.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const LayoutScreen(),
        const ContactsScreen(),
        const CameraScreen(),
        const ProductsScreen()
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.white,), 
            label: 'Home'
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: Colors.white,), 
            label: 'Contacts'
          ),
           NavigationDestination(
            icon: Icon(Icons.photo_camera, color: Colors.white,), 
            label: 'Camera'
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag, color: Colors.white,), 
            label: 'Products'
          ),
        ]
      ),
    );
  }
}