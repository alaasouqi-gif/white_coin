import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final Function onTap;
  final String text;

  MyButton({@required this.onTap, this.text}) ;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 58,
        foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            )),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              14,
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xffb621fe),
              Color(0xff1fd1f9),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            )
          ],
        ),
      ),
    );
  }
}
