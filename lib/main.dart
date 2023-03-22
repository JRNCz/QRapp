import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qrcodeexample/scan.dart';
import 'package:qrcodeexample/home.dart';

void main() {
  runApp(
    MaterialApp(initialRoute: '/home', routes: {
      '/home': (context) => Home(),
      '/scan': (context) => ScanScreen(),
    }),
  );
}
