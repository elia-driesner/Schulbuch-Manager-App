import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import '../main.dart';
import 'qrFunctions.dart';

class qrCodeScannerWidget extends StatefulWidget {
  final purpose;
  final uid;
  qrCodeScannerWidget({Key? key, required this.purpose, this.uid})
      : super(key: key);
  @override
  State<qrCodeScannerWidget> createState() => _qrCodeScannerWidgetState();
}

class _qrCodeScannerWidgetState extends State<qrCodeScannerWidget> {
  QRViewController? controller;
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  var bookCode = 'GZIALGdzagfzdlgbailzuwfgbiazuGHfi';
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

  void runFunctions(bookCode) async {
    if (widget.purpose == 'login') {
      await loginBook(bookCode, widget.uid);
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pop(context, true);
    } else if (widget.purpose == 'logout') {
      await logoutBook(bookCode);
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pop(context, true);
    }
  }

  void initState() {
    setState(() => {});
    runFunctions(bookCode);
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
      Text(barcode != null ? 'Result: ${barcode}' : 'Scan a code',
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
