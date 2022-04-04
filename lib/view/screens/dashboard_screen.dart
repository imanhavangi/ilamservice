import 'package:flutter/material.dart';
import 'package:ilamservice/main.dart';
import 'package:ilamservice/view/screens/about_us/about_us_screen.dart';
import 'package:ilamservice/view/screens/future_screen.dart';
import 'package:ilamservice/view/screens/phone/phone_screen.dart';
import 'package:ilamservice/view/screens/profile/profile_screen.dart';
import 'package:ilamservice/view/screens/search_screen/search_screen.dart';
import 'package:ilamservice/view/screens/services/services_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardScreen extends StatefulWidget {
  final String phoneNum;
  const DashBoardScreen({Key? key, required this.phoneNum}) : super(key: key);
  @override
  _DashBoardScreenState createState() {
    return _DashBoardScreenState();
  }
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    List<Widget> dashBoardScreenList = [
      const ServicesScreen(),
      const FutureScreen(),
      const FutureScreen(),
      const FutureScreen(),
    ];
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        semanticLabel: 'something',
        backgroundColor: Colors.grey.shade700,
        child: ListView(
          children: [
            const SizedBox(
              height: 70,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xfff04a24),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'ایلام سرویس',
                    style: TextStyle(
                        fontFamily: 'iransans',
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'درباره ما',
                  style: TextStyle(color: Colors.white, fontFamily: 'iransans'),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutUsScreen()));
              },
            ),
            const Divider(
              color: Colors.white,
              height: 12,
            ),
            ListTile(
              title: const Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'پروفایل',
                  style: TextStyle(color: Colors.white, fontFamily: 'iransans'),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                              phoneNumber: widget.phoneNum,
                            )));
              },
            ),
            const Divider(
              color: Colors.white,
              height: 12,
            ),
            ListTile(
              title: const Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'خروج از حساب کاربری',
                  style: TextStyle(color: Colors.white, fontFamily: 'iransans'),
                ),
              ),
              onTap: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.setString('mobile', '');
                preferences.setString('token', '');

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const PhoneScreen(
                            si: "",
                          )),
                  ModalRoute.withName('fi'),
                );
              },
            ),
            const Divider(
              color: Colors.white,
              height: 12,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const SearchScreen()));
        //       },
        //       icon: const Icon(Icons.search)),
        // ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: const Text(
          "ایلام سرویس",
          style: TextStyle(fontFamily: "iransans", color: Color(0xfff04a24)),
        ),
      ),
      body: dashBoardScreenList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black,
        // fixedColor: Colors.black,

        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: const Color(0xfff04a24),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.build),
              label: 'تعمیرات',
              backgroundColor: Color(0xff4e4f51)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'فروشگاه',
              backgroundColor: Color(0xff4e4f51)),
          BottomNavigationBarItem(
              icon: Icon(Icons.construction),
              label: 'خدماتی',
              backgroundColor: Color(0xff4e4f51)),
          BottomNavigationBarItem(
              icon: Icon(Icons.apartment),
              label: 'ساختمانی',
              backgroundColor: Color(0xff4e4f51)),
        ],
      ),
    );
  }
}
