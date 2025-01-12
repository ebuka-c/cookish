import 'package:cookish/page_routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final emailController = TextEditingController();
  final signUpPwdC = TextEditingController();
  final loginPwdController = TextEditingController();
  final passwordObscure = true.obs;

  final acceptTerms = false.obs;

  void toggleAcceptTerms(bool value) {
    acceptTerms.value = value;
    if (value == true) {
      print('accepted');
    }
  }

  var isLoading = false.obs;

  //METHODS

  //sign up
  Future<bool> signUpwEmailPwd(String email, String pwd) async {
    isLoading.value = true;
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pwd);
      if (kDebugMode) print(userCredential);
      // print(userCredential.user?.uid);
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "${e.message}",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.errorBorder,
        colorText: AppColors.white,
        duration: const Duration(seconds: 3),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  //login
  Future<bool> loginwEmailPwd(String email, String pwd) async {
    isLoading.value = true;
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pwd);
      if (kDebugMode) print(userCredential);
      // print(userCredential.user?.uid);
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "${e.message}",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.errorBorder,
        colorText: AppColors.white,
        duration: const Duration(seconds: 3),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  //logout
  Future<bool> logout() async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(AppRoutes.signInScreen);
      if (kDebugMode) print('sign out success');
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "${e.message}",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.errorBorder,
        colorText: AppColors.white,
        duration: const Duration(seconds: 3),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
