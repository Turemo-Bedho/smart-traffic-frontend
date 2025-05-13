import 'package:flutter/material.dart';

class RecognizedFacePage extends StatelessWidget {
  final String imageUrl;
  const RecognizedFacePage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recognized Face'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Face Recognized Successfully!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Image.network(imageUrl, width: 200, height: 200, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
