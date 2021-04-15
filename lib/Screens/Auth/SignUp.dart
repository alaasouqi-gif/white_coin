import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:white_coin/Resources/ScreenId.dart';
import 'package:white_coin/Widget/scrollview.dart';
import 'package:white_coin/resources/constant.dart';
import 'package:white_coin/Widget/MyButton.dart';
import 'package:white_coin/Widget/welcomeMessage.dart';
import 'package:white_coin/Functions/FirebaseSginUP.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseSignUp a = new FirebaseSignUp();

  String email = '';
  String name = '';
  String lastName = '';
  String pass = '';
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(top: 32, bottom: 16, left: 16, right: 16),
        child: ScrollViewWithHeight(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WelcomeMessage(
                text1: 'Create Account,',
                text2: 'Sign up to get started!',
              ),
              Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        a.errorNameMessage = null;
                      });
                      name = value;
                    },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: KDecoration.copyWith(
                        labelText: 'First Name', errorText: a.errorNameMessage),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        a.errorLastNameMessage = null;
                      });
                      lastName = value;
                    },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: KDecoration.copyWith(
                        labelText: 'Last Name', errorText: a.errorLastNameMessage),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                      validator: (value) {
                        return value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          a.errorEmailMessage = null;
                        });
                        email = value;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: KDecoration.copyWith(
                          labelText: 'Email', errorText: a.errorEmailMessage)),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        a.errorPhoneMessage = null;
                      });
                      phone = value;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: KDecoration.copyWith(
                        labelText: 'Phone', errorText: a.errorPhoneMessage),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          a.errorPassMessage = null;
                        });
                        pass = value;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: KDecoration.copyWith(
                          labelText: 'Password',
                          errorText: a.errorPassMessage)),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
              MyButton(
                  text: 'Sign Up',
                  onTap: () async {

                    if (await a.createAccount(
                        email, pass, name, lastName, phone)) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      await FirebaseAuth.instance.currentUser.sendEmailVerification();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          IdEmailVerification, (Route<dynamic> route) => false);
                      //Navigator.pushNamed(context,IdEmailVerification );
                    }
                    setState(() {});
                  })
            ],
          ),
        ),
      )),
    );
  }
}
