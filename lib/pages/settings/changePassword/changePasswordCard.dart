import 'package:flutter/material.dart';
import '../../../auth/changePassword.dart';

class changePasswordCard extends StatelessWidget {
  const changePasswordCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => changePassword(oldPasswordSug: '')),
        )
      },
      child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Container(
                  child: Icon(Icons.lock_outline_rounded, size: 30),
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    child: Text(
                  'Password ändern',
                  style: TextStyle(fontSize: 18, color: Color(0xFF18191F)),
                )),
                Container(
                    child: Text('Password für diesen Account ändern',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF18191F))))
              ]),
            ]),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Icon(Icons.keyboard_arrow_right,
                  size: 30, color: Color(0xFF18191F)),
            )
          ])),
    );
  }
}
