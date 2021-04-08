import 'package:flutter/material.dart';
import 'package:white_coin/constant.dart';
import 'package:white_coin/Widget/MyButton.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16, left: 16, right: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome,',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Sign in to continue!',
                      style: TextStyle(
                        color: KSecondColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(

                  children: [
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: KDecoration.copyWith(labelText: 'Full Name'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: KDecoration.copyWith(labelText: 'Email'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: KDecoration.copyWith(labelText: 'Password'),
                    ),
                  ],
                ),
                MyButton(
                  text: 'Login',
                  onTap: () {},
                )

              ],
            ),
          )),
    );
  }
}
