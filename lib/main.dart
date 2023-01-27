import 'package:dashboard_gh/test_api.dart';
import 'package:dashboard_gh/power_Bi.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Constants.dart';
import 'dashboard.dart';
import 'package:firebase_database/firebase_database.dart';

import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {




  @override
  void initState() {
    Future.delayed(new Duration(seconds: 3),);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Admin Panel',
        theme: ThemeData(
            scaffoldBackgroundColor: Constants.purpleDark,
            primarySwatch: Colors.blue,
            canvasColor: Constants.purpleLight),
        home: MenuDashboardPage(),);
  }
}


//listOfData.isEmpty ? TestApi() : MenuDashboardPage(listOfData)
