import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String userscan = "";
  List<Barcode> barcodes = [];
  @override
  Widget build(BuildContext context) {
    bool done = true;
    return Scaffold(
        appBar: AppBar(
          title: Text('QR Code scanner'),
          centerTitle: true,
          backgroundColor: Colors.green[500],
        ),
        body: MobileScanner(
          controller: MobileScannerController(
            detectionSpeed: DetectionSpeed.normal,
            facing: CameraFacing.back,
            torchEnabled: true,
          ),
          onDetect: (capture) {
            barcodes = capture.barcodes;
            userscan = barcodes[0].rawValue as String;
            if (done == true) {
              done = false;
              Navigator.pop(context, userscan);
            }
          },
        ));
  }
}
