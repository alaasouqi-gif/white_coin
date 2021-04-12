import 'package:regexpattern/regexpattern.dart';
import 'package:email_validator/email_validator.dart';

String isEmail(String email){
  String message;
  if(email==''){
    message='Please Write you\'r Email';

  }
  else if(!EmailValidator.validate(email)){
    message='InValid Email';
  }
  return message;
}
String weakPassword(String password){
  String message;
  if(password==''){
    message='Please Write Password';
  }
  return message;
}

String isPhone(String phone){
  String message;
  if(phone==''){
    message='Please Write you\'r phone number';
  }
  else if(!phone.isPhone()){
    message='Invalid phone number';
  }
  return message;
}
String isName(String name){

  String message;

  if(name==''){
    message='Please Write you\'r Name';

  }else if(!name.isAlphabet()){
    message='Invalid Name';

  }
  return message;
}