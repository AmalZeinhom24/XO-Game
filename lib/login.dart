import 'package:flutter/material.dart';
import 'package:xo_game/gamers_model.dart';
import 'package:xo_game/xo.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  //Object from TextEditingController type
  TextEditingController name1Controller = TextEditingController();
  TextEditingController name2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text(
              'Welcom to XO Game!',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: name1Controller,

                  decoration: InputDecoration(
                      label: Text(
                        "First Gamer",
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.teal)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.teal))),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: name2Controller,
                  decoration: InputDecoration(
                      label: Text("Second Gamer"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.teal)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.teal))),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal),
                    onPressed: () {
                      if (name1Controller.text.isNotEmpty &&
                          name2Controller.text.isNotEmpty) {
                        Navigator.pushNamed(context, Xo_Game.routeName,
                            arguments: Gamer_Model(
                                name1Controller.text, name2Controller.text));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please Enter Both Gamers Names!'),
                          backgroundColor: Colors.blueGrey,));
                      }
                    },
                    child: Text(
                      "Tap to Start",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ));
  }
}
