import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/view/screens/dashboard_screen.dart';
import 'package:ilamservice/view/screens/form_screen.dart/form_screen.dart';
import 'package:ilamservice/view/screens/otp/otp_screen.dart';
import 'package:ilamservice/view/screens/phone/phone_screen.dart';
import 'package:ilamservice/view/screens/services/services_screen.dart';
import 'package:ilamservice/view/screens/types/types_screen.dart';
import 'package:sms_autofill/sms_autofill.dart';

bool loggedIn = false;
// bool loggedIn = true;
String phoneNumber = '';
String s = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  s = await SmsAutoFill().getAppSignature;
  print('App Signature:     ' + s);
  loggedIn = await DatabaseServices.isLoggedIn();
  phoneNumber = await DatabaseServices.getPhone();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(s);
    return MaterialApp(
      initialRoute: (loggedIn) ? '/types' : '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => PhoneScreen(
              si: s,
            ),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/types': (context) => TypesScreen(
              phoneNum: phoneNumber,
            ),
      },

      title: 'Ilam Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Ilam Service Home'),
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
    return const MaterialApp(
      // theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.transparent,)),
      title: 'IlamService',
      // home: (loggedIn)
      //     ? TypesScreen(
      //         phoneNum: phoneNumber,
      //       )
      //     : const PhoneScreen(),
    );
  }
}
