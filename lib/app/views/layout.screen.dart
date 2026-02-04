import 'package:flutter/material.dart';
import 'package:flutter_feb2026/app/views/home.screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) 
              => MyHomePage(title: 'Kelas Programming'))
            );
          }, 
            icon: Icon(Icons.calculate_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text('Kelas Programming', 
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Text('Taman Melawati, KL', style: TextStyle(color: Colors.grey),)
                      ],
                    )
                  ),
                  Icon(Icons.star, color: Colors.redAccent,),
                  Text('41')
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconWithText(icon: Icons.call, label: 'CALL',),
                  IconWithText(icon: Icons.near_me, label: 'ROUTE',),
                  IconWithText(icon: Icons.share, label: 'SHARE',),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text('This is the description of the location that you want to go'),
            )
          ],
        ),
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key,
    required this.icon,
    required this.label
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blue,),
        Text(label, 
          style: TextStyle(
            fontSize: 12, 
            fontWeight: FontWeight.w400,
            color: Colors.blue
          ),
        ),
      ],
    );
  }
}