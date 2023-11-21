import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'unity_viewer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GalleryScreen(),
    );
  }
}

class GalleryScreen extends StatelessWidget {
  final List<String> imagePaths = [
    'images/dog.4001.jpg',
    'images/dog.4002.jpg',
    'images/dog.4003.jpg',
    'images/dog.4004.jpg',
    'images/dog.4005.jpg',
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Your Model'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _launch3DViewer(context, imagePaths[index]);
            },
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  void _launch3DViewer(BuildContext context, String imagePath) {
    // Extract the file name from the image path
    String fileName = imagePath.split('/').last.split('.').first;

    // Ensure that the numeric part is included
    String numericPart = imagePath.split('/').last.split('.').elementAt(1);

    // Construct the full fileName with the numeric part
    fileName = '$fileName.$numericPart';

    print('Launching 3D Viewer for $fileName');
  
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UnityViewer(fileName: fileName),
      ),
    );
  }
}