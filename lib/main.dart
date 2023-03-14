import 'package:flutter/material.dart';
import 'package:model_test/pages/login/login_page.dart';
import 'package:model_test/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'pages/home/home.dart';
import 'pages/profile/profile_page.dart';
import 'models/user_model.dart';
import 'view_models/login_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ProfileViewModel()),
        ChangeNotifierProvider(
            create: (context) => LoginViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
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
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
