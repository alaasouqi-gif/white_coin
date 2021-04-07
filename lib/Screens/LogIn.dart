import 'package:flutter/material.dart';
import 'package:white_coin/constant.dart';
import 'package:white_coin/Widget/MyButton.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String pass;
  String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding:
            const EdgeInsets.only(top: 32, bottom: 16, left: 16, right: 16),
        child: Column(
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
                  decoration: KDecoration.copyWith(labelText: 'Email'),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscureText: false,
                  onChanged: (value) {
                    pass = value;
                  },
                  decoration: KDecoration.copyWith(labelText: 'Password'),
                ),
                SizedBox(
                  height: 6,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: (){

                    },
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
                  onTap: () {},
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
                TextButton(onPressed: () {}, child: Text('Sign up'))
              ],
            )
          ],
        ),
      )),
    );
  }
}
