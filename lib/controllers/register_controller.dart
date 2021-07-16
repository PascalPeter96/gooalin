

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gooalin/controllers/firebase_controller.dart';

class RegisterController extends GetxController{
  GlobalKey<FormState> regFormKey =
  GlobalKey<FormState>();
  late FirebaseController firebaseController;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    firebaseController = FirebaseController();
  }

  @override
  void onClose() {
    firebaseController.dispose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();

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

  void registerCheck(){
    firebaseController.createUser(firstName.text, lastName.text, email.text, password.text);

  }
}
