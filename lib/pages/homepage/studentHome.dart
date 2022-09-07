import 'package:flutter/material.dart';
import 'widgets/sideMenu.dart';
import '../../user_data_cache.dart';
import '../../codeScanner/qrCodeWidget.dart';
import 'booksListView.dart';
import 'widgets/qrCodeCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class studentHomepage extends StatelessWidget {
  const studentHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SafeArea(
            child: Column(children: [
          Container(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(offset: Offset(3, 3), color: Color(0xFF18191F))
                ],
              ),
              margin: const EdgeInsets.fromLTRB(320, 0, 0, 0),
              child: ElevatedButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(13),
                    primary: Colors.white,
                    onPrimary: Color(0xFF18191F),
                    side: BorderSide(width: 2, color: Color(0xFF18191F))),
                child: FaIcon(FontAwesomeIcons.user,
                    size: 25, color: Color(0xFF18191F)),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: <Widget>[
                        Text(
                          'Meine',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Color(0xFF18191F),
                          ),
                        ),
                        const Text(
                          'Meine',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Bücher',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF18191F),
                      ),
                    )
                  ])),
          Container(
              margin: const EdgeInsets.fromLTRB(15, 35, 15, 0),
              child: const bookListView()),
          Stack(children: <Widget>[])
        ])));
  }
}
