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
      child: ClipRect(
        child: Container(
          child: Stack(children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              color: Colors.blue,
              child: Container(
                height: 170,
                width: MediaQuery.of(context).size.width - 20,
                child: ElevatedButton(
                    child: const Text('add book'), onPressed: () => {}),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
