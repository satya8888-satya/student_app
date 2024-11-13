import 'package:flutter/material.dart';
import 'package:flutter_1/screens/homeScreen.dart';
import 'package:flutter_1/screens/login_screen.dart';
import 'package:flutter_1/screens/studentDetails_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/student-details': (context) => StudentDetailsScreen(),
      },
    );
  }
}
