import 'package:bmi_demo/home.dart';
import 'package:bmi_demo/imageSlider.dart';
import 'package:bmi_demo/providers/theme.dart';
import 'package:bmi_demo/result.dart';
import 'package:bmi_demo/sliverappbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(), child: MyHomepage());
    // TODO: implement build
    throw UnimplementedError();
  }
}

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: Provider.of<ThemeProvider>(context).themeMode,
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blueAccent,
              background: Colors.black,
              onBackground: Colors.black,
              primaryContainer: Colors.black),
          scaffoldBackgroundColor: Colors.black,
          useMaterial3: true,
          primaryColor: Colors.black,
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
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
