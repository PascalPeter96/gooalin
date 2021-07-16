
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themes{
  final lightTheme =
      ThemeData.light().copyWith(
        primaryColor: Colors.indigo,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          textTheme: TextTheme(headline1: TextStyle(
            color: Colors.black,
          ),),
        ),
      );

  final darkTheme =
      ThemeData.dark().copyWith(
        primaryColor: Colors.pinkAccent,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          textTheme: TextTheme(headline1: TextStyle(
            color: Colors.white,
          ),),
        )
      );

}