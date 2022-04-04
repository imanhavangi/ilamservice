import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/view/screens/phone/phone_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  final String phoneNumber;
  final String name;
  final String lastName;
  const ProfileScreen(
      {Key? key,
      required this.phoneNumber,
      required this.name,
      required this.lastName})
      : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String name = '', lastName = '';
  bool editing = false;
  @override
  void initState() {
    name = widget.name;
    lastName = widget.lastName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = name;
    lastNameController.text = lastName;
    Widget nameLastName = Column(
      children: [
        ((lastName + name) == '')
            ? const Text(
                'شما نامی وارد نکرده اید.',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontFamily: 'iransans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 22),
              )
            : Text(
                name + ' ' + lastName,
                style: const TextStyle(
                    fontFamily: 'iransans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 22),
              ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton(
          onPressed: () {
            setState(() {
              editing = true;
            });
          },
          child: const Text(
            'ویرایش نام و نام خانوادگی',
            style: TextStyle(color: Colors.orange, fontFamily: 'iransans'),
          ),
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
            primary: Colors.black54,
            enableFeedback: true,
          ),
        ),
      ],
    );

    Widget editName = Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                controller: lastNameController,
                textAlign: TextAlign.center,
                cursorColor: const Color(0xfff04a24),
                style: const TextStyle(
                    fontFamily: 'iransans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 14),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xfff04a24), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  hintStyle: TextStyle(
                      fontFamily: 'iransans',
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                      fontSize: 14),
                  hintText: 'نام خانوادگی',
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                controller: nameController,
                textAlign: TextAlign.center,
                cursorColor: const Color(0xfff04a24),
                style: const TextStyle(
                    fontFamily: 'iransans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 14),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xfff04a24), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  hintStyle: TextStyle(
                      fontFamily: 'iransans',
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                      fontSize: 14),
                  hintText: 'نام',
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      OutlinedButton(
        onPressed: () async {
          context.loaderOverlay.show();
          await DatabaseServices.changeName(
              name: nameController.text, lastName: lastNameController.text);
          context.loaderOverlay.hide();
          setState(() {
            name = nameController.text;
            lastName = lastNameController.text;
            editing = false;
          });
        },
        child: const Text(
          'ثبت تغییرات نام و نام خانوادگی',
          style: TextStyle(color: Colors.orange, fontFamily: 'iransans'),
        ),
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
            width: 1.0,
            color: Colors.white,
          ),
          primary: Colors.black54,
          enableFeedback: true,
        ),
      ),
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xfff04a24),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xf4f4f4f4),
                      borderRadius: BorderRadius.circular(50.0),
                      border:
                          Border.all(color: const Color(0xfff04a24), width: 3)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      "assets/profile.png",
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                      color: Colors.black,
                    ),
                  ),
                ),
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
              height: 20,
            ),
            editing ? editName : nameLastName,
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () async {
                // version 1.3
                context.loaderOverlay.show();
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();

                preferences.setString('mobile', '');
                preferences.setString('token', '');
                context.loaderOverlay.hide();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const PhoneScreen(si: "")),
                  ModalRoute.withName('fi'),
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
              height: 20,
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
