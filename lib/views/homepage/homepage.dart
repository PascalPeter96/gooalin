import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gooalin/controllers/homepage_controller.dart';
import 'package:gooalin/themes/theme_services.dart';

class HomePage extends StatelessWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController =
        Get.put(HomePageController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('GooalIn'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                ThemesServices().changeThemeMode();
                // Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
              },
              icon: Icon(Icons.light_mode_rounded),),
            IconButton(
                onPressed: (){
                  homePageController.logOut();
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Column(
          children: [
            Image.network(homePageController.firebaseController.imageUrl.toString()),
            Text('Google SignOut: '),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  homePageController.googleLogOut();
                },
                child: Text('Google SignOut')),

          ],
        )
      ),
    );
  }
}
