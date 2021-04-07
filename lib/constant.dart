import 'package:flutter/material.dart';

const Color KSecondColor = Color(0xffB4BAC0);

const KDecoration = InputDecoration(
  
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
    Radius.circular(12),
  )),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: KSecondColor),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      )),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff1fd1f9), width: 2),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      )),
  labelText: '',
  errorText: null,
);
