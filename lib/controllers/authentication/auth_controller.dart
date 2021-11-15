import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/constants/custom_snackbar.dart';
import 'package:rtt_nurse_app/constants/rrt_colors.dart';
import 'package:rtt_nurse_app/constants/utils/auth_exception_handler.dart';
import 'package:rtt_nurse_app/controllers/service/database.dart';
import 'package:rtt_nurse_app/models/authentication/auth_model.dart';
import 'package:rtt_nurse_app/models/authentication/avalibleSlots.dart';
import 'package:rtt_nurse_app/view/ui/auth/rtt_nurse_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firebaseUser = FirebaseAuth.instance.currentUser.obs;
  var currentUser = AuthModel().obs;
  AuthResultStatus? _status;

  var selectedSlot = <Slots>[].obs;

  @override
  void onInit() {
    super.onInit();
    // BINDING AUTH LISTENER
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  // CHECKING DUPLICATE EMAIL
  Future<List<String>> checkDuplicateEmail(String email) async {
    try {
      return await _auth.fetchSignInMethodsForEmail(email);
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  void getUserById(String uid) async {
    currentUser.value = await Database().getUser(uid);
  }

  //  CREATE USER WITH EMAIL AND PASSWORD
  Future<AuthResultStatus> createUser(
      String email, String password, String firstName, String lastName) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      if (_authResult.user != null) {
        _status = AuthResultStatus.successful;
        AuthModel _user = AuthModel(
            uid: _authResult.user!.uid,
            firstName: firstName,
            lastName: lastName,
            email: email.trim(),
            status: "online",
            imageUrl: '',
            createdAt: Timestamp.now(),
            role: "Nurse");

        Database()
            .createUserInDatabase(_user)
            .then((value) => debugPrint(value.toString()));

        currentUser.value = _user;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status!;
  }

  // Login with email and password
  Future<AuthResultStatus> loginUser(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);

      if (_authResult.user != null) {
        _status = AuthResultStatus.successful;

        AuthModel _user = AuthModel(
          uid: _authResult.user!.uid,
          email: email.trim(),
        );

        currentUser.value = _user;
        saveUserState(_authResult.user!.uid);
        // TODO :: LOAD USER INFO FROM FIRESTORE COLLECTION
        currentUser.value = await Database().getUser(_authResult.user!.uid);
      } else {
        _status = AuthResultStatus.undefined;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status!;
  }

  // LOGOUT
  void logOut() async {
    try {
      await _auth.signOut();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('uid');
      Get.offAll(() => Login());
    } catch (e) {
      CustomSnackBar.showSnackBar(
          title: e.toString(), message: '', backgroundColor: snackBarError);
    }
  }

  void saveUserState(String uid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', uid);
  }

  Future getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }
}
