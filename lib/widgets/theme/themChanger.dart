import 'package:flutter/material.dart';

class ThemeBuilder extends StatefulWidget {
final Widget Function(BuildContext context,ThemeMode themeMode) builder;

ThemeBuilder({required this.builder});
  @override
  _ThemeBuilderState createState() => _ThemeBuilderState();

  static _ThemeBuilderState? of(BuildContext context){
    return  context.findAncestorStateOfType<_ThemeBuilderState>();
  }

}

class _ThemeBuilderState extends State<ThemeBuilder> {

  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = ThemeMode.dark;
  }
  void changeTheme(){
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }
  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _themeMode);
  }
}
