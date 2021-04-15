import 'package:regexpattern/regexpattern.dart';
import 'package:email_validator/email_validator.dart';

String isEmail(String email){
  String message;
  if(email==''){
    message='Please Write your Email';

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
    message='Please Write your phone number';
  }
  else if(!phone.isPhone()){
    message='Invalid phone number';
  }
  return message;
}
String isName(String name){

  String message;

  if(name==''){
    message='Please Write your Name';

  }else if(!name.isAlphabet()){
    message='The name must have just letters';

  }
  return message;
}