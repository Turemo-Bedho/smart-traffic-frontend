import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_application/app/presentation/blocs/driver_recognition/driver_recognition_bloc.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  Timer? _timer;
  bool _isCameraInitialized = false;


  @override
  void initState() {
    super.initState();
    _initializeCamera().then((_) {
      _startPeriodicCapture();
    }).catchError((e) {
      debugPrint("Error initializing camera: $e");
    });
  }

  Future<void> _initializeCamera() async {
  try {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      throw 'No cameras available';
    }
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();
    if (mounted) {
      setState(() {
        _isCameraInitialized = true;
      });
    }
  } catch (e) {
    debugPrint("Error initializing camera: $e");
  }
}


  void _startPeriodicCapture() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      if (!_cameraController.value.isInitialized) {
        debugPrint("Camera is not initialized yet");
        return;
      }
      await _captureAndDispatch();
    });
  }

  Future<void> _captureAndDispatch() async {
    if (!_cameraController.value.isInitialized ||
        _cameraController.value.isTakingPicture) {
      return;
    }

    try {
      final image = await _cameraController.takePicture();
      if (!mounted) return;
      context
          .read<DriverRecognitionBloc>()
          .add(ProcessFrameDriverRecognitionEvent(filePath: image.path));
    } catch (e) {
      debugPrint("Error capturing image: $e");
      // You can also add error handling here (e.g., showing an error message to the user)
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return BlocConsumer<DriverRecognitionBloc, DriverRecognitionState>(
      listener: (context, state) {
        if (state is DriverRecognitionError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is DriverRecognitionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Driver recognized successfully!")),
          );
          context.go('/detail', extra: state.driver);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Camera Feed")),
          body: CameraPreview(_cameraController),
        );
      },
    );
  }
}
