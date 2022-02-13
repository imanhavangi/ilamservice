import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/view/screens/future_screen.dart';
import 'package:ilamservice/view/screens/profile/profile_screen.dart';
import 'package:ilamservice/view/screens/services/services_screen.dart';

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
    List<Widget> dashBoardScreenList = [
      const ServicesScreen(),
      const FutureScreen(),
      const FutureScreen(),
      const FutureScreen(),
      ProfileScreen(
        phoneNumber: widget.phoneNum,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: const Center(
            child: Text(
          "ایلام سرویس",
          style: TextStyle(fontFamily: "iransans", color: Color(0xfff04a24)),
        )),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'پروفایل',
              backgroundColor: Color(0xff4e4f51)),
        ],
      ),
    );
  }
}
