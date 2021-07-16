

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gooalin/controllers/firebase_controller.dart';

class LoginController extends GetxController{
  GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>();
  late FirebaseController firebaseController;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    firebaseController = FirebaseController();

  }

  @override
  void onClose() {

  }

  String? validateEmail(String value){
    if(!GetUtils.isEmail(value)){
      return 'Use valid email';
    }else{
      return null;
    }
  }

  String? validatePassword(String value){
    if(value.length<=5){
      return 'Password should atleast have 6 chars';
    }else{
      return null;
    }
  }

  void loginCheck(){
    final loginForm = loginFormKey.currentState!;
    if(loginForm.validate()){
      print('Welcome $email');
      firebaseController.login(email.text, password.text);
      email.clear();
      password.clear();
    }else{
      return null;
    }
  }

  void googleLogIn(){
    firebaseController.googleLogIn();
  }

}