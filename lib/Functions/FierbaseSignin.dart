import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'validation.dart';

class FirebaseSignIn{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  String errorEmailMessage;
  String errorPassMessage;

  Future<bool>signIn (String email,String pass)  async{
    errorEmailMessage=isEmail(email);
    errorPassMessage=weakPassword(pass);

    if(errorEmailMessage!=null|| errorPassMessage!=null){
      return false;
    }

    try {
      await auth.signInWithEmailAndPassword(
          email: email, password: pass);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorEmailMessage='No user found for that email';
      } else if (e.code == 'wrong-password') {
        errorPassMessage='Wrong password provided for that user';
      }
      else if(e.code=='too-many-requests'){
        errorPassMessage='many time of trying please try again later';

      }

      return false;

    }
  }

}


