import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:gooalin/controllers/firebase_controller.dart';
import 'package:gooalin/views/homepage/homepage.dart';
import 'package:gooalin/views/logIn.dart';


class IsLoggedIn extends StatelessWidget {
  const IsLoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Get.find<FirebaseController>().user!=null
          ? HomePage() : Login();
    });
  }
}
