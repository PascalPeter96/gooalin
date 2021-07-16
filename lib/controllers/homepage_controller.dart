

import 'package:get/get.dart';
import 'package:gooalin/controllers/firebase_controller.dart';

class HomePageController extends GetxController{
  late FirebaseController firebaseController;

  @override
  void onInit() {
    super.onInit();
    firebaseController = FirebaseController();
  }

  @override
  void onClose() {
    firebaseController.dispose();
  }

  void logOut(){
    firebaseController.logOut();
  }

}