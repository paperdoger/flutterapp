
import 'package:flutter/material.dart';
import 'package:flutter_xv/home/home_page.dart';
import 'package:flutter_xv/main.dart';
import 'package:flutter_driver/driver_extension.dart';

/// 运行 flutter drive --target=test_driver/statistic/statistic.dart
void main() {
  enableFlutterDriverExtension();
  runApp(MyApp(home: const Home()));
}
