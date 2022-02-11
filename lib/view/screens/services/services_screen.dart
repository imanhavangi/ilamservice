import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/view/screens/form_screen.dart/form_screen.dart';
import 'package:ilamservice/view/screens/services/widget/service_button.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    BottomNavigationBar _bottomNavigationBar = BottomNavigationBar(
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      enableFeedback: true,
      currentIndex: _selectedIndex,
      selectedLabelStyle:
          const TextStyle(fontFamily: 'iransans', fontWeight: FontWeight.bold),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.construction),
            label: 'تعمیرات',
            backgroundColor: Color(0xff4e4f51)),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'فروشگاه',
            backgroundColor: Color(0xff4e4f51)),
        BottomNavigationBarItem(
            icon: Icon(Icons.apartment),
            label: 'خدمات ساختمانی',
            backgroundColor: Color(0xff4e4f51)),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'پروفایل',
            backgroundColor: Color(0xff4e4f51)),
      ],
    );
    Scaffold _s0 = Scaffold(
        // backgroundColor: Colors.black87,
        // appBar: AppBar(),
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
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  BuildRow([
                    ["یخچال", "assets/refrigerator.png"],
                    ["آبگرمکن", "assets/waterheater.png"],
                    ["پکیج", "assets/radiator.png"],
                  ]),
                  BuildRow([
                    ["کولر", "assets/cooler.png"],
                    ["اجاق گاز", "assets/oven.png"],
                    ["هود", "assets/hood.png"],
                  ]),
                  BuildRow([
                    ["لباسشویی", "assets/laundry.png"],
                    ["ظرفشویی", "assets/dishwasher.png"],
                    ["جارو برقی", "assets/cleaner.png"],
                  ]),
                  BuildRow([
                    ["دینام کولر", "assets/DynamoCooler.png"],
                    ["آسانسور", "assets/Elevator.png"],
                    ["بالابر", "assets/lift.png"],
                  ]),
                  BuildRow([
                    ["لوله کشی", "assets/piping.png"],
                    ["پمپ آب", "assets/waterpump.png"],
                    ["موتورخانه", "assets/powerhouse.png"],
                  ]),
                  BuildRow([
                    ["چرخ گوشت", "assets/piping.png"],
                    ["آبمیوه گیر", "assets/repairs.png"],
                    ["سبزی خردکن", "assets/repairs.png"],
                  ]),
                  BuildRow([
                    ["گوشت کوب", "assets/piping.png"],
                    ["زودپر و بخارپز", "assets/repairs.png"],
                    ["آبجوش کن", "assets/repairs.png"],
                  ]),
                  BuildRow([
                    ["رشته و رنده کن", "assets/piping.png"],
                    ["همزن معمولی", "assets/repairs.png"],
                    ["مخلوط کن سرعتی", "assets/repairs.png"],
                  ]),
                  BuildRow([
                    ["تُستِر", "assets/piping.png"],
                    ["ساندویچ ساز", "assets/repairs.png"],
                    ["قهوه جوش", "assets/repairs.png"],
                  ]),
                  BuildRow([
                    ["سماور برقی", "assets/piping.png"],
                    ["سرخ کن", "assets/repairs.png"],
                    ["چای ساز", "assets/repairs.png"],
                  ]),
                  BuildRow([
                    ["پیکور برقی", "assets/piping.png"],
                    ["سیم پیچی", "assets/repairs.png"],
                  ]),
                  // BuildRow([
                  //   ["", "assets/piping.png"],
                  //   ["", "assets/repairs.png"],
                  //   ["", "assets/repairs.png"],
                  // ]),
                ],
              ),
            ),
          ),
        ),

        // Color(0xff4e4f51),
        //         Color(0xff808186),
        //         Color(0xff4e4f51),
        bottomNavigationBar: _bottomNavigationBar);
    Scaffold _s1 = Scaffold(
      // backgroundColor: Colors.black87,
      // appBar: AppBar(),
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
        child: const Center(
          child: Text(
            'این صفحه به زودی طراحی خواهد شد',
            style: TextStyle(
                fontFamily: 'iransans', fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
    switch (_selectedIndex) {
      case 0:
        return _s0;
      case 1:
        return _s1;
      default:
        return _s1;
    }
  }

  Row BuildRow(List<List> data) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        textDirection: TextDirection.rtl,
        children: [
          for (var t in data) ServiceButton(text: t[0], image: t[1]),
        ]);
  }
}
