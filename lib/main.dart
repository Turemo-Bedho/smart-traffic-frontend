import 'package:flutter/material.dart';
import 'package:my_flutter_application/traffic_app.dart';
import 'dependency_injection.dart' as di;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const TrafficApp());
}