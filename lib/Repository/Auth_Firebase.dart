
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../Model/Account.dart';

class Auth_Firebase{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> signInWithEmailAndPassword(BuildContext context, Account account) async {
    var login = false;
    try {
      await auth.signInWithEmailAndPassword(
        email: account.email!,
        password: account.password!,
      );
      context.go('/Home');
    } catch (e) {
      login = true;
      print("Đăng nhập thất bại: $e");
    }
    return login;
  }

  Future<bool> registerWithEmailAndPassword(BuildContext context, Account account) async {
    var signup = false;
    try {
      await auth.createUserWithEmailAndPassword(
        email: account.email!,
        password: account.password!,
      );
      User? user = FirebaseAuth.instance.currentUser;
      await firestore.collection('users').doc(user?.uid).set({
        'email': account.email!,
        'password': account.password!,
      });
      context.go('/');
      print("Đăng ký thành công!");
    } catch (e) {
      signup = true;
      print("Đăng ký thất bại: $e");
    }
    return signup;
  }
}