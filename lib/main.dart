import 'package:flutter/material.dart';
import 'package:white_coin/Screens/LogIn.dart';
import 'package:white_coin/Screens/SignUp.dart';
import 'constant.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: IdSignIn,
      routes: {
        IdSignIn:(context)=> LogIn(),
        IdSignUp:(context)=> SignUp(),
      },
    );
  }
}
