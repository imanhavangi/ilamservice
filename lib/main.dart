import 'package:flutter/material.dart';
import 'package:ilamservice/view/screens/dashboard_screen.dart';
import 'package:ilamservice/view/screens/form_screen.dart/form_screen.dart';
import 'package:ilamservice/view/screens/phone/phone_screen.dart';
import 'package:ilamservice/view/screens/services/services_screen.dart';

// import 'sol/screens/login_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ilam Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ilam Service Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.transparent,)),
      title: 'Ilam Service',
      home: ServicesScreen(),
    );
  }
}
