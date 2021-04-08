import 'package:flutter/material.dart';
import 'package:white_coin/constant.dart';
import 'package:white_coin/Widget/MyButton.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email;
  String name;
  String pass;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create account,',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Sign up to get started!',
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
                        name = value;
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: KDecoration.copyWith(labelText: 'Full Name'),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: KDecoration.copyWith(labelText: 'Email'),
                    ),

                    SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        email = value;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: KDecoration.copyWith(labelText: 'Phone'),
                    ),
                    SizedBox(
                      height: 14,
                    ),

                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {
                        pass = value;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: KDecoration.copyWith(labelText: 'Password'),
                    ),
                  ],
                ),
                MyButton(
                  text: 'Sign Up',
                  onTap: () {},
                )

              ],
            ),
          )),
    );
  }
}
