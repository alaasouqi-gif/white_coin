import 'package:flutter/material.dart';
import 'package:white_coin/Functions/FierbaseSignin.dart';
import 'package:white_coin/Widget/scrollview.dart';
import 'package:white_coin/constant.dart';
import 'package:white_coin/Widget/welcomeMessage.dart';
import 'package:white_coin/Widget/MyButton.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  FirebaseSignIn signIn = new FirebaseSignIn();

  String pass = '';
  String email = '';

  String passError;
  String emailError;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ScrollViewWithHeight(
            child: Padding(
        padding: EdgeInsets.only(top: 32, bottom: 16, left: 16, right: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WelcomeMessage(
                text1: 'Welcome,',
                text2: 'Sign in to continue!',
              ),
              Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        signIn.errorEmailMessage = null;
                      });
                      email = value;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: KDecoration.copyWith(
                      labelText: 'Email',
                      errorText: signIn.errorEmailMessage,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        signIn.errorPassMessage =null;
                      });
                      pass = value;
                    },
                    decoration: KDecoration.copyWith(
                        labelText: 'Password',
                        errorText: signIn.errorPassMessage),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MyButton(
                    text: 'Login',
                    onTap: () async {
                      if (await signIn.signIn(email, pass)) {print('m');}
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' I\'m a new user,',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, IdSignUp);
                      },
                      child: Text('Sign up'))
                ],
              )
            ],
        ),
      ),
          )),
    );
  }
}
