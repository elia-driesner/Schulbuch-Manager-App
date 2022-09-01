import 'package:flutter/material.dart';
import 'widgets/sideMenu.dart';
import '../../user_data_cache.dart';
import '../../codeScanner/qrCodeWidget.dart';
import 'booksListView.dart';

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
          //     child: Text('a'))d

          Container(
              margin: EdgeInsets.fromLTRB(15, 90, 15, 0),
              child: bookListView()),
          Container(
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  color: Colors.blue,
                  child: ElevatedButton(
                      child: const Text('add book'), onPressed: () => {}),
                ),
              )
            ]),
          )
        ])));
  }
}
