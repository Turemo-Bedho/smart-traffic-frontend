import 'dart:async';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CameraService {
  CameraController? _controller;
  List<CameraDescription> cameras = [];
  bool isInitialized = false;

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras.isEmpty) throw Exception('No cameras available');
    _controller = CameraController(
      cameras[0], // Use the first camera (usually rear)
      ResolutionPreset.high,
      enableAudio: false,
    );
    await _controller!.initialize();
    isInitialized = true;
  }

  CameraController? get controller => _controller;

  Future<String> captureImage() async {
    if (!isInitialized || _controller == null) {
      throw Exception('Camera not initialized');
    }
    final tempDir = await getTemporaryDirectory();
    final filePath =
        join(tempDir.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');
    final XFile file = await _controller!.takePicture();
    await file.saveTo(filePath);
    return filePath;
  }

  void dispose() {
    _controller?.dispose();
    isInitialized = false;
  }
}