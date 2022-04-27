import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        textTheme: Theme.of(context).textTheme.copyWith(
            headline6: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.blue)),
        primaryColor: yellowButtonColor,
        //buttonColor is depreciated that's why i use primary color
        primarySwatch: Colors.deepPurple,
        secondaryHeaderColor: lightPowderBlue,
        backgroundColor: backgroundColor,
        canvasColor: lightNumbersButtonColor,
        cardColor: Colors.black,
        iconTheme: const IconThemeData(color: CupertinoColors.black),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        textTheme: Theme.of(context).textTheme.copyWith(
            headline6: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.green)),
        primaryColor: yellowButtonColor,
        //This is used for Button color as Button Color is depreciated
        secondaryHeaderColor: darkPowderBlue,
        backgroundColor: darkBackgroundColor,
        brightness: Brightness.dark,
        cardColor: Colors.white,
        canvasColor: darkNumbersButtonColor,
      );

  static Color backgroundColor = const Color(0xffd7dae3);
  static Color darkBackgroundColor = const Color(0xff323C46);
  static Color yellowButtonColor = const Color(0xffE28F19);
  static Color darkPowderBlue = const Color(0xff525E6C);
  static Color lightPowderBlue = const Color(0xff8594A9);
  static Color lightBluish = const Color(0xff5A6577);

  static Color lightNumbersButtonColor = const Color(0xffcdd2da);
  static Color darkNumbersButtonColor = const Color(0xff2f3945);
}
