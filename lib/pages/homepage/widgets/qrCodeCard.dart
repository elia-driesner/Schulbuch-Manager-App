import 'package:flutter/material.dart';

class qrCodeCard extends StatelessWidget {
  const qrCodeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            color: Colors.blue,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  child: const Text('add book'), onPressed: () => {}),
            ),
          ),
        )
      ]),
    );
  }
}
