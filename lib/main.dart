import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';

import 'package:ilamservice/view/screens/phone/phone_screen.dart';

import 'package:ilamservice/view/screens/types/types_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'data/service_product.dart';

bool loggedIn = false;
// bool loggedIn = true;
String phoneNumber = '';
String s = '';
List<ServiceOrProduct> d = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // d = await DatabaseServices.getChildServicesOfParent(3);
  s = await SmsAutoFill().getAppSignature;
  // print('App Signature:     ' + s);
  loggedIn = await DatabaseServices.isLoggedIn();
  phoneNumber = await DatabaseServices.getPhone();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: const Color(0xf4f4f4f4),
      overlayOpacity: 0.45,
      overlayWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SpinKitWave(
            color: Colors.black87,
            size: 80.0,
            type: SpinKitWaveType.center,
          ),
          Text(
            'اندکی صبر ...',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontFamily: 'iransans',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      child: MaterialApp(
        initialRoute: (loggedIn) ? 'se' : 'fi',
        // initialRoute: '/types',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          'fi': (context) => PhoneScreen(
                si: s,
              ),
          // When navigating to the "/second" route, build the SecondScreen widget.
          'se': (context) => TypesScreen(
                phoneNum: phoneNumber,
              ),
          // 'se': (context) => CategoryServicesScreen(
          //       superCategoryName: 'فروشگاهی',
          //       categories: d,
          //     ),
        },

        title: 'Ilam Service',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Ilam Service Home'),
      ),
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
