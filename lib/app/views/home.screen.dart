import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  int total = 0;

  void calculate(String operation){
    int num1 = int.parse(num1Controller.text);
    int num2 = int.parse(num2Controller.text);
    
    setState(() {
      if(operation == '+'){
        total = num1 + num2;
      } else {
        total = num1 - num2;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Calculator App', 
              style: TextStyle(
                fontSize: 30, 
                fontWeight: FontWeight.w600,
                color: Colors.blue
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('First Number'),
                  hintText: 'Enter first number'
                ),
                keyboardType: TextInputType.number,
                controller: num1Controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Second Number'),
                  hintText: 'Enter 2nd number'
                ),
                keyboardType: TextInputType.number,
                controller: num2Controller,
              ),
            ),
            Text('TOTAL: $total', style: TextStyle(fontSize: 20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){ calculate('+'); }, icon: Icon(Icons.add)),
                IconButton(onPressed: (){ calculate('-'); }, icon: Icon(Icons.remove)),
              ],
            )
          ],
        ),
      )
    );
  }
}
