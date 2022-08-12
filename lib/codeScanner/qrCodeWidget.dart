import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';

class qrCodeScannerWidget extends StatefulWidget {
  qrCodeScannerWidget({Key? key}) : super(key: key);

  @override
  State<qrCodeScannerWidget> createState() => _qrCodeScannerWidgetState();
}

class _qrCodeScannerWidgetState extends State<qrCodeScannerWidget> {
  QRViewController? contoller;
  final qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildQrView(context));
  }

  Widget buildQrView(BuildContext context) =>
      QRView(key: qrKey, onQRViewCreated: onQRViewCreated);

  void onQRViewCreated(QRViewController controller) {}
}
