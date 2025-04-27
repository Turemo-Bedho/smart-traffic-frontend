import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Traffic - Face Recognition',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: FaceRecognitionScreen(cameras: cameras),
    );
  }
}

class FaceRecognitionScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const FaceRecognitionScreen({super.key, required this.cameras});

  @override
  _FaceRecognitionScreenState createState() => _FaceRecognitionScreenState();
}

class _FaceRecognitionScreenState extends State<FaceRecognitionScreen> {
  CameraController? _cameraController;
  String? _licenseNumber;
  String? _processedImage;
  Map<String, dynamic>? _driverInfo;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameraController = CameraController(
      widget.cameras[0],
      ResolutionPreset.medium,
    );
    await _cameraController!.initialize();
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _captureAndRecognize() async {
    if (_isProcessing || _cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    setState(() => _isProcessing = true);

    try {
      final image = await _cameraController!.takePicture();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.155.99:8000/api/recognize-face/'),
      );
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
      request.headers['Content-Type'] = 'multipart/form-data';

      var response = await request.send();
      var responseData = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        var data = json.decode(responseData);
        setState(() {
          _licenseNumber = data['license_number'];
          _processedImage = data['processed_image'];
        });
        await _fetchDriverInfo(_licenseNumber!);
      } else {
        var data = json.decode(responseData);
        setState(() {
          _licenseNumber = 'No face recognized';
          _processedImage = data['processed_image']; // Still display processed image
          _driverInfo = null;
        });
        _showMessage("Face not recognized.");
      }
    } catch (e) {
      _showMessage("Failed to recognize face: $e");
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  Future<void> _fetchDriverInfo(String licenseNumber) async {
    final response = await http.get(
      Uri.parse('http://192.168.155.99:8000/api/driver/$licenseNumber/'),
    );
    if (response.statusCode == 200) {
      setState(() {
        _driverInfo = json.decode(response.body);
      });
    } else {
      setState(() {
        _driverInfo = {'error': 'Driver not found'};
      });
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Traffic - Face Scanner'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Camera Preview
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: CameraPreview(_cameraController!),
            ),

            const SizedBox(height: 10),

            // Processed Image
            if (_processedImage != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.memory(base64Decode(_processedImage!)),
                ),
              ),

            const SizedBox(height: 10),

            // Driver Info
            if (_driverInfo != null)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Driver Information',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Divider(),
                        Text('Name: ${_driverInfo!['name']}'),
                        Text('License Number: ${_driverInfo!['license_number']}'),
                        Text('License Status: ${_driverInfo!['license_status']}'),
                        Text('Violation History: ${_driverInfo!['violation_history']}'),
                        Text('Penalties: ${_driverInfo!['penalties']}'),
                      ],
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 10),

            // Action Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: _isProcessing ? null : _captureAndRecognize,
                child: _isProcessing
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                          SizedBox(width: 12),
                          Text('Processing...'),
                        ],
                      )
                    : const Text('Capture and Recognize'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
