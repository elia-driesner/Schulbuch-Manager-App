import 'package:flutter/material.dart';

class customActionButton extends StatelessWidget {
  const customActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(offset: Offset(4, 5), color: Color(0xFF18191F))
      ], borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, 50),
          primary: const Color(0xFFFFBD12),
          shadowColor: Color(0xFF18191F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          side: BorderSide(width: 2, color: Color(0xFF18191F)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child:
                  Text('Anmelden', style: TextStyle(color: Color(0xFF18191F))),
            ),
            Icon(Icons.arrow_forward, color: Color(0xFF18191F))
          ],
        ),
        onPressed: () => {},
      ),
    );
  }
}
