import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:white_coin/Screens/ForgetPasswordEmailSent.dart';
import 'package:white_coin/Screens/LogIn.dart';
import 'package:white_coin/Screens/SignUp.dart';
import 'package:white_coin/Screens/ForgetPassword.dart';
import 'constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        IdForgetPassword:(context)=>ForgetPassword(),
        IdForgetPasswordEmailSent:(context)=>ForgetPasswordEmailSent(),

      },
    );
  }


}
