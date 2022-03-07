import 'package:flutter/material.dart';
import 'package:ilamservice/view/base/service_circlebutton.dart';
import 'package:ilamservice/view/screens/phone/phone_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  final String phoneNumber;
  const ProfileScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: const Text(
          "پروفایل",
          style: TextStyle(fontFamily: "iransans", color: Color(0xfff04a24)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color(0xff4e4f51),
              Color(0xff808186),
              Color(0xff4e4f51),
            ])),
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xfff04a24),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: ServiceCircleButton(image: "assets/profile.png"),
              )),
            ]),
            const SizedBox(
              height: 40,
            ),
            Text('موبایل: ${widget.phoneNumber} ',
                style: const TextStyle(
                    fontFamily: 'iransans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 22)),
            const SizedBox(
              height: 60,
            ),
            OutlinedButton(
              onPressed: () async {
                // version 1.3
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.setString('mobile', '');
                preferences.setString('token', '');

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const PhoneScreen(si: "")),
                  ModalRoute.withName('/'),
                );
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  width: 1.0,
                  color: Colors.white,
                ),
                primary: Colors.black54,
                enableFeedback: true,
              ),
              child: Column(
                children: const [
                  SizedBox(
                    height: 3,
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.orange,
                  ),
                  Text(
                    'خروج از حساب کاربری',
                    style:
                        TextStyle(color: Colors.orange, fontFamily: 'iransans'),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                height: 150,
                child: Image.asset("assets/icon.png"),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: _bottomNavigationBar,
    );
  }
}
