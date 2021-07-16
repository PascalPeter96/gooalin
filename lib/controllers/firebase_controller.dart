
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gooalin/views/homepage/homepage.dart';
import 'package:gooalin/views/logIn.dart';

class FirebaseController extends GetxController{

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Rxn<User> _firebaseUser = Rxn<User>();

  String? get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_firebaseAuth.authStateChanges());

  }

  //create user
void createUser(String firstName, String lastName, String email, String password) async{
    CollectionReference userReference = FirebaseFirestore.instance.collection('Users');
    Map<String,String> userInfo = {
      'First Name': firstName,
      'Last Name': lastName,
      'Email': email
    };

    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value){
          userReference.add(userInfo).then((value){
            Get.off(()=>Login());
          });
    }).catchError((onError){
          Get.snackbar('Create User Error', onError.message);
    });

}

//create login
void login(String email, String password) async {
  await _firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password)
      .then((value) => Get.offAll(()=> HomePage())).catchError((onError) {
    Get.snackbar('LogIn Error', 'input a valid email or password > 5 chars');
  });
}

//logOut User
void logOut() async{
    await _firebaseAuth.signOut().then((value) => Get.offAll(()=>Login()));
}

}