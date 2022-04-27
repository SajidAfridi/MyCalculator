import 'package:calculator_advanced/pages/home_screen.dart';
import 'package:calculator_advanced/widgets/theme/themChanger.dart';
import 'package:calculator_advanced/widgets/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (BuildContext context, ThemeMode themeMode)
      {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.darkTheme(context),
          home: const HomeScreen(),
          // home: Wrapper(),
        );
      },

    );
  }
}

