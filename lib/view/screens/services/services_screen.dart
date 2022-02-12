import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/view/base/service_circlebutton.dart';
import 'package:ilamservice/view/screens/form_screen.dart/form_screen.dart';
import 'package:ilamservice/view/screens/profile/profile_screen.dart';
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
                    ["چرخ گوشت", "assets/meatgrinder.png"],
                    ["آبمیوه گیر", "assets/juicer.png"],
                    ["سبزی خردکن", "assets/vegtable.png"],
                  ]),
                  BuildRow([
                    ["گوشت کوب", "assets/masher.png"],
                    ["زودپر و بخارپز", "assets/steamer.png"],
                    ["آبجوش کن", "assets/waterboiler.png"],
                  ]),
                  BuildRow([
                    ["رشته و رنده کن", "assets/grater.png"],
                    ["همزن معمولی", "assets/agitator.png"],
                    ["مخلوط کن سرعتی", "assets/mixer.png"],
                  ]),
                  BuildRow([
                    ["تُستِر", "assets/toaster.png"],
                    ["ساندویچ ساز", "assets/sandwich.png"],
                    ["قهوه جوش", "assets/coffee.png"],
                  ]),
                  BuildRow([
                    ["سماور برقی", "assets/samovars.png"],
                    ["سرخ کن", "assets/fryer.png"],
                    ["چای ساز", "assets/tea.png"],
                  ]),
                  BuildRow([
                    ["پیکور برقی", "assets/pikor.png"],
                    ["سیم پیچی", "assets/wiring.png"],
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
    Scaffold _s4 = Scaffold(
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
            const Text('موبایل: ۰۹۲۱۵۱۴۷۹۰۲',
                style: TextStyle(
                    fontFamily: 'iransans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 22)),
            const SizedBox(
              height: 60,
            ),
            OutlinedButton(
              onPressed: () {},
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
      bottomNavigationBar: _bottomNavigationBar,
    );
    switch (_selectedIndex) {
      case 0:
        return _s0;
      case 1:
        return _s1;
      case 2:
        return _s1;
      case 3:
        return _s1;
      case 4:
        return _s4;
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
