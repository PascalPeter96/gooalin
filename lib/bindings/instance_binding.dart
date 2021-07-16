import 'package:get/get.dart';
import 'package:gooalin/controllers/firebase_controller.dart';

class InstanceBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FirebaseController>(() => FirebaseController());
  }

}