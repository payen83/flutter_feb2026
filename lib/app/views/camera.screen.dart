import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          //image
          imageFile != null ?
          Image.file(imageFile!, fit: BoxFit.cover,)
          : Image.asset('assets/images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              onPressed: () async{
                final ImagePicker picker = ImagePicker();
                final XFile? camera = await picker.pickImage(source: ImageSource.camera);
                if(camera != null){
                  setState(() {
                    imageFile = File(camera.path);
                  });
                }
              }, 
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.indigo,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.photo_camera, size: 24,),
                  SizedBox(width: 10,),
                  Text('Take Picure')
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}