import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:white_coin/Resources/ScreenId.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then((value) =>Navigator.pushReplacementNamed(context, IdSignIn)
                );
              },
              child: Text('Sign out'),
            ),
          ),
        ),
      ),
    );
  }
}
