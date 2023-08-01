import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(_auth.currentUser);
    _user.bindStream(_auth.authStateChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed("/signin");
    } else {
      Get.offAllNamed("/");
    }
  }

  void registerUserwithEmailnPassword(String email, password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      Get.snackbar(
        "Can't sign up",
        "Error in creating user account",
        titleText: Text(
          "Error!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.height18,
          ),
        ),
        messageText: Text(
          error.toString(),
          style: TextStyle(
            fontSize: Dimensions.height16,
          ),
        ),
        isDismissible: true,
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
          size: Dimensions.height24,
        ),
      );
    }
  }

  void signinUserwithEmailnPassword(String email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      Get.snackbar(
        "Can't sign in",
        "Error in creating user account",
        titleText: Text(
          "Error!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.height18,
          ),
        ),
        messageText: Text(
          error.toString(),
          style: TextStyle(
            fontSize: Dimensions.height16,
          ),
        ),
        isDismissible: true,
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
          size: Dimensions.height24,
        ),
      );
    }
  }

  void signOut() async {
    await _auth.signOut();
    Get.offAllNamed("/signin");
  }
}
