import 'package:flutter/material.dart';

final ThemeData mainTheme = _mainTheme();

ThemeData _mainTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary:const Color.fromARGB(255, 116, 215, 97),
      onPrimary: Colors.white,
      secondary: const  Color.fromARGB(255, 50, 114, 37),
      onSecondary: Colors.white, 
      background: Color.fromARGB(255, 165, 198, 159),
      onBackground: Colors.black,
    )
  );

}

TextTheme _mainTextTheme(TextTheme base) => base.copyWith(
  headline1: base.headline1!.copyWith(
    fontFamily: "Roboto", 
    fontSize: 30,
    fontWeight: FontWeight.w500, 
    color: Colors.white
  ),

  headline2: base.headline1!.copyWith(
    fontFamily: "Roboto", 
    fontSize: 26,
    fontWeight: FontWeight.w400, 
    color: Colors.white
  ),

  headline3: base.headline1!.copyWith(
    fontFamily: "Roboto", 
    fontSize: 24,
    fontWeight: FontWeight.w300, 
    color: Colors.white
  ),

  // for widgets contents/paragraph
      bodyText1: base.bodyText1!.copyWith(
          fontFamily: "Roboto",
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: Colors.black),
// for sub-widgets contents/paragraph
      bodyText2: base.bodyText2!.copyWith(
          fontFamily: "Roboto",
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.black),
    );

)