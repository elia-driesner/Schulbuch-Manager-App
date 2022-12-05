import 'package:flutter/material.dart';
import '../../user_data_cache.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../classPages/classBook/classBookView.dart';

class teacherHomepage extends StatelessWidget {
  const teacherHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SingleChildScrollView(
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
                  margin: const EdgeInsets.fromLTRB(320, 7, 7, 0),
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
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: <Widget>[
                              Text(
                                'Lehrer',
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
                                'Lehrer',
                                style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ]),
                  )),
            ])),
          )),
    );
  }
}
