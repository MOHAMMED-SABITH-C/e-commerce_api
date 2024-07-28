// import 'package:e_commerce_app/forgotPass.dart';
import 'package:e_commerce_app/home.dart';
import 'package:e_commerce_app/login.dart';
import 'package:e_commerce_app/testjson.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class AuthService{
//     final FirebaseFirestore _firestore=FirebaseFirestore.instance();

//     final FirebaseAuth _auth=FirebaseAuth.instance;
// }
class AuthService {
  final String emailAddress;
  final String password;
  final BuildContext context;
  AuthService(this.emailAddress, this.password,String choise, this.context) {
    
    choise =='register'?createUserWithEmailAndPassword():
    signInWithEmailAndPassword();
  }
  createUserWithEmailAndPassword() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      User? user = credential.user;
      if (user != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return loginPage();
        }), (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color.fromARGB(255, 51, 53, 53),
            margin: EdgeInsets.all(10),
            content: Text(
              'The password provided is too weak.',
              style: TextStyle(color: Colors.red),
            )));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color.fromARGB(255, 51, 53, 53),
            margin: EdgeInsets.all(10),
            content: Text(
              'The account already exists for that email.',
              style: TextStyle(color: Colors.red),
            )));
        print('The account already exists for that email.');
      }else if(e.code=='invalid-email'){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color.fromARGB(255, 51, 53, 53),
            margin: EdgeInsets.all(10),
            content: Text(
              'invalid email.',
              style: TextStyle(color: Colors.red),
            )));
        print(e.code);
      }
    } catch (e) {
      print(e);
    }
  }

  signInWithEmailAndPassword() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
          User? user = credential.user;
      if (user != null) {
        Navigator.of(context).//push(
        pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return homepage();
          // return ProductListPage();
        }), (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color.fromARGB(255, 51, 53, 53),
            margin: EdgeInsets.all(10),
            content: Text(
              'No user found for that email.',
              style: TextStyle(color: Colors.red),
            )));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color.fromARGB(255, 51, 53, 53),
            margin: EdgeInsets.all(10),
            content: Text(
              'Wrong password provided for that user.',
              style: TextStyle(color: Colors.red),
            )));
        print('Wrong password provided for that user.');
      }
      else if(e.code=='invalid-email'){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color.fromARGB(255, 51, 53, 53),
            margin: EdgeInsets.all(10),
            content: Text(
              'invalid email.',
              style: TextStyle(color: Colors.red),
            )));
        print(e.code);
      }
    }
  }
}
