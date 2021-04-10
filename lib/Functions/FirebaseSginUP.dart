import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:white_coin/Functions/validation.dart';

class FirebaseSignUp {
  FirebaseAuth auth = FirebaseAuth.instance;
  User currentUser;
  UserCredential newUser;
  UserCredential signUser;
  CollectionReference data = FirebaseFirestore.instance.collection('users');
  User current;

  String errorEmailMessage;
  String errorPassMessage;
  String errorPhoneMessage;
  String errorNameMessage;



  Future<bool> createAccount(String email, String password,String name,String phone) async {

    try{
      errorEmailMessage=isEmail(email);
      errorPassMessage=weakPassword(password);
      errorPhoneMessage=isPhone(phone);
      errorNameMessage=isName(name);

      if((errorEmailMessage!=null|| errorPassMessage!=null|| errorPhoneMessage!=null ||errorNameMessage!=null)){
        return false;
      }

      newUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      current=newUser.user;
      
      data.doc(current.uid).collection('personal info').doc('personal').set({
        'email': current.email,
        'name':name,
        'phone':phone,
        'money':5000,
      });
      return true;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorPassMessage='The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorEmailMessage='The account already exists for that email.';
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }


}
