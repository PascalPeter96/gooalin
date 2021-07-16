

import 'package:get/get.dart';
import 'package:gooalin/models/live_fixture.dart';
import 'package:gooalin/services/gooalin_api.dart';

class LiveFixtureController extends GetxController{
  var liveFixtureList = <LiveFixture>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getLiveFixtures();
  }

  void getLiveFixtures() async{
    // try {
    //   isLoading(true);
    //   var liveFixture = await GoalApi.getLiveFixtures();
    //   if(liveFixture!=null){
    //     liveFixtureList.value = liveFixture;
    //   }
    // } finally {
    //   isLoading(false);
    // }
  }
}