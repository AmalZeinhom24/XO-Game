import 'package:flutter/material.dart';

class GameBtn extends StatelessWidget {
  String txt;
  //Call Back Function
  Function onGameClick;
  int index;

  GameBtn(this.txt, this.onGameClick, this.index);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 6,
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.white, width: 2)),
          ),
          onPressed: () {
            onGameClick(index);
          },
          child: Text(txt,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w500))),
    );
  }
}
