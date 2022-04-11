import 'package:flutter/material.dart';
import 'package:phonepe_clone/constant/constant.dart';
import 'package:phonepe_clone/ui/phonepe.dart';
import 'package:phonepe_clone/ui/splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(primaryColor: Colors.blue[800]),
      routes: <String, WidgetBuilder>{
        splashScreen: (BuildContext context) => const SplashScreen(),
        phonePeScreen: (BuildContext context) => const FlutterDevs(),
      },
    );
  }
}
