import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quanly_duan/screens/home-employee.dart';
import 'package:quanly_duan/screens/home.dart';
import 'package:quanly_duan/screens/screen-manager.dart';
import 'package:quanly_duan/screens/sign-in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreenemployee(),
      // home:AccountPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
