
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:white_coin/Widget/scrollview.dart';
import 'package:white_coin/Widget/MyButton.dart';
import '../constant.dart';
import 'package:email_validator/email_validator.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String email = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  String messageError;


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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reset Password,',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16,),
                      Text(
                        'Enter You\'r email and we will send an email with Instructions to change you\'r Password.',
                        style: TextStyle(
                          color: KSecondColor,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        messageError = null;
                      });
                      email = value;
                    },
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: KDecoration.copyWith(
                        labelText: 'Email', errorText: messageError),
                  ),
                  MyButton(
                    onTap: () async {

                      if (email==null||email=='') {
                        messageError = 'Enter You\'r Email';
                      }else if(!EmailValidator.validate(email)){
                        messageError = 'Invalid email';
                      }

                      else {
                        try {
                          await auth.sendPasswordResetEmail(email: email);
                          FocusScope.of(context).requestFocus(FocusNode());
                          Navigator.pop(context);
                          Navigator.pushNamed(context, IdForgetPasswordEmailSent);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            messageError = 'No user found for that email';
                          } else if (e.code == 'too-many-requests') {
                            messageError =
                            'many time of trying please try again later';
                          }
                        }
                      }
                        setState(() {

                        });



                    },
                    text: 'Send Instructions ',
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
