import 'package:flutter/material.dart';
import 'package:purehours/routeGenrator.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenrator.genrateRoute,
      theme: FlexThemeData.light(scheme: FlexScheme.deepPurple),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.deepPurple),
      themeMode: ThemeMode.light,
    );
  }
}
