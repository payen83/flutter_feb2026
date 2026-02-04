import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call, color: Colors.blue,),
                      Text('Call', 
                        style: TextStyle(
                          fontSize: 12, 
                          fontWeight: FontWeight.w400,
                          color: Colors.blue
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.near_me, color: Colors.blue,),
                      Text('Route', 
                        style: TextStyle(
                          fontSize: 12, 
                          fontWeight: FontWeight.w400,
                          color: Colors.blue
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share, color: Colors.blue,),
                      Text('Share', 
                        style: TextStyle(
                          fontSize: 12, 
                          fontWeight: FontWeight.w400,
                          color: Colors.blue
                        ),
                      ),
                    ],
                  )
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