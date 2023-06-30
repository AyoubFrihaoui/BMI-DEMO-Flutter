import 'package:bmi_demo/home.dart';
import 'package:bmi_demo/imageSlider.dart';
import 'package:bmi_demo/result.dart';
import 'package:bmi_demo/sliverappbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryTextTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          primarySwatch: Colors.teal,
        ),
        home: imageSlider());
    // Result(result: 22.1, isMale: true, age: 22));
  }
}
