import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:white_coin/Resources/ScreenId.dart';
import 'package:white_coin/Screens/Auth/ForgetPasswordEmailSent.dart';
import 'package:white_coin/Screens/Auth/LogIn.dart';
import 'package:white_coin/Screens/Auth/SignUp.dart';
import 'package:white_coin/Screens/Auth/ForgetPassword.dart';
import 'package:white_coin/Screens/Auth/EmailVerification.dart';
import 'package:white_coin/Screens/MainScreen.dart';

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
        IdEmailVerification:(context)=>EmailVerification(),
        IdMain:(context)=>MainScreen()

      },
    );
  }


}

