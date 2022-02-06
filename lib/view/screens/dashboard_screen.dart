import 'package:flutter/material.dart';
import 'package:ilamservice/view/screens/profile/profile_screen.dart';
import 'package:ilamservice/view/screens/services/services_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;
  List<Widget> dashBoardScreenList = [
    ServicesScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(
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
        selectedItemColor: Color(0xfff04a24),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          //1
          BottomNavigationBarItem(
            backgroundColor: Colors.black87,
            // icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/home.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            // activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/home_fill.png', height: 25, width: 25, color: appStore.iconColor),
            icon: Icon(Icons.home),
            label: 'خدمات',
          ),
          //2
          BottomNavigationBarItem(
            backgroundColor: Colors.black87,
            // icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/reel.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            // activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/reel_fill.png', height: 25, width: 25, color: appStore.iconColor),
            icon: Icon(Icons.person),
            label: 'پروفایل',
          ),
          //3
          // BottomNavigationBarItem(
          //     // icon: Container(
          //     //   decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: appStore.iconSecondaryColor!, width: 1)),
          //     //   child: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/profile1.png', height: 30, width: 30).cornerRadiusWithClipRRect(20),
          //     // ),
          //     // activeIcon: Container(
          //     //   decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: appStore.iconColor!, width: 1)),
          //     //   child: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/profile1.png', height: 30, width: 30).cornerRadiusWithClipRRect(20),
          //     // ),
          //     icon: Icon(Icons.home),
          //     label: 'Profile'),
        ],
      ),
    );
  }
}
