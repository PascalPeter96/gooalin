import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gooalin/bindings/instance_binding.dart';
import 'package:gooalin/themes/theme_services.dart';
import 'package:gooalin/themes/themes.dart';
import 'package:gooalin/views/homepage/homepage.dart';
import 'package:gooalin/views/is_loggedIn.dart';
import 'package:gooalin/views/logIn.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //init getStorage
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InstanceBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemesServices().getThemeMode(),
      home: IsLoggedIn(),
    );
  }
}
