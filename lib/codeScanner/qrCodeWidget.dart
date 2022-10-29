import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import '../main.dart';

class qrCodeScannerWidget extends StatefulWidget {
  qrCodeScannerWidget({Key? key}) : super(key: key);

  @override
  State<qrCodeScannerWidget> createState() => _qrCodeScannerWidgetState();
}

class _qrCodeScannerWidgetState extends State<qrCodeScannerWidget> {
  QRViewController? controller;
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void initState() {
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [],
            ),
            body: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                buildQrView(context),
                Positioned(child: buildResult(), bottom: 10)
              ],
            )));
  }

  Widget buildResult() =>
      Text(barcode != null ? 'Result: ${barcode!.code}' : 'Scan a code',
          maxLines: 3, style: TextStyle(color: Colors.white));

  Widget buildQrView(BuildContext context) => QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderRadius: 20,
          borderLength: 40,
          borderWidth: 11,
          borderColor: Color.fromARGB(255, 0, 0, 0),
          cutOutSize: MediaQuery.of(context).size.width * 0.60));

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}
