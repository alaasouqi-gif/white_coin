import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:white_coin/Resources/ScreenId.dart';
import 'package:white_coin/resources/constant.dart';
import 'package:white_coin/Widget/MyButton.dart';

class EmailVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            User user = _firebaseAuth.currentUser;
            await user.reload();
            user = _firebaseAuth.currentUser;
            bool flag = user.emailVerified;

            if (flag) {
              print(user.email);
              Navigator.pushReplacementNamed(context, IdMain);
            } else {
              showVerificationAppsDialog(context);
            }
          },
          child: Icon(
            Icons.arrow_forward_outlined,
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    _firebaseAuth.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, IdSignIn, (route) => false);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back,size: 28,),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Sign out',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    ],
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/message.svg',
                    width: 180,
                    height: 180,
                  ),
                  Text(
                    'Check your email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'We have sent verification account instructions to you\'r email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: KSecondColor,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  MyButton(
                    onTap: () async {
                      // Android: Will open mail app or show native picker.
                      // iOS: Will open mail app if single mail app found.
                      var result = await OpenMailApp.openMailApp();

                      // If no mail apps found, show error
                      if (!result.didOpen && !result.canOpen) {
                        showNoMailAppsDialog(context);

                        // iOS: if multiple mail apps found, show dialog to select.
                        // There is no native intent/default app system in iOS so
                        // you have to do it yourself.
                      } else if (!result.didOpen && result.canOpen) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return MailAppPickerDialog(
                              mailApps: result.options,
                            );
                          },
                        );
                      }
                    },
                    text: 'Open email app',
                    width: 170.0,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: () async {
                      User user = _firebaseAuth.currentUser;
                      await user.sendEmailVerification();
                      await Navigator.pushNamedAndRemoveUntil(context, IdMain, (route) => false);
                    },
                    child: Text(
                      'Resend Email',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.lightBlueAccent[100],
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Text('')
            ],
          ),
        ),
      ),
    );
  }
}

void showVerificationAppsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Verification Account"),
        content: Text("Please Verify You\'r Account"),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}

void showNoMailAppsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Open Mail App"),
        content: Text("No mail apps installed"),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
