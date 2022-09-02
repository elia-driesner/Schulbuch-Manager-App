import 'package:flutter/material.dart';

class qrCodeCard extends StatelessWidget {
  const qrCodeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(
          MediaQuery.of(context).size.width * .0,
          MediaQuery.of(context).size.height * .35,
          0.0),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(child: Text('Bücher hinzufügen ->')),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(3, 3),
                          color: Color.fromARGB(255, 0, 0, 0))
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(13),
                        primary: const Color(0xFFDF5953),
                        onPrimary: const Color.fromARGB(255, 46, 43, 59),
                        side: const BorderSide(
                            width: 1, color: Color(0xFF103A24))),
                    child: const Icon(Icons.qr_code,
                        size: 25, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
