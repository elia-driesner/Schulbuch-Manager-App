import 'package:flutter/material.dart';
import 'widgets/sideMenu.dart';

import '../../user_data_cache.dart';

import '../../codeScanner/qrCodeWidget.dart';

class studentHomepage extends StatelessWidget {
  const studentHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFECEBE7),
        child: SafeArea(
            child: Column(children: [
          // ElevatedButton(
          //     onPressed: () => {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => new qrCodeScannerWidget()),
          //           )
          //         },
          //     child: Text('a'))
          Text('Schulbuch Manager')
        ])));
  }
}