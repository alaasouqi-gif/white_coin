import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:white_coin/resources/constant.dart';
import 'package:white_coin/Widget/MyButton.dart';
import 'package:open_mail_app/open_mail_app.dart';

class ForgetPasswordEmailSent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                'We have sent password recover instructions to your email.',
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
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
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
