import 'package:flutter/material.dart';
import 'package:xo_game/xo.dart';
import 'login.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName : (context) => LoginScreen(),
        Xo_Game.routeName : (context) => Xo_Game(),
      },
    );
  }
}
