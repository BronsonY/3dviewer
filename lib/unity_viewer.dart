import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityViewer extends StatelessWidget {
  final String fileName;

  const UnityViewer({Key? key, required this.fileName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building UnityViewer for $fileName');

    return Scaffold(
      appBar: AppBar(
        title: Text('3D Viewer - $fileName'),
      ),
      body: UnityWidget(
        onUnityCreated: (controller) {
          // Load your 3D model based on fileName
          controller.postMessage(
            'UnityViewer',
            'LoadModel',
            'models/$fileName.glb', // Correct the path by using single quotes
          );
        },
      ),
    );
  }
}