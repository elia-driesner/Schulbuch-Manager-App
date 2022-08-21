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
              actions: [
                ElevatedButton(
                    child: Text('a'),
                    onPressed: () => {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => App(),
                            ),
                            (route) => false,
                          )
                        })
              ],
            ),
            body: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ElevatedButton(child: Text('a'), onPressed: () => {}),
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
          borderRadius: 30,
          borderLength: 40,
          borderWidth: 12,
          borderColor: Color(0xFF7A6DA9),
          cutOutSize: MediaQuery.of(context).size.width * 0.60));

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}
