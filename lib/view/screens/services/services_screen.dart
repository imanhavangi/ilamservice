import 'package:flutter/material.dart';
import 'package:ilamservice/view/screens/services/widget/service_button.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      // appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color(0xff4e4f51),
              Color(0xff808186),
              Color(0xff4e4f51),
            ])),
        child: SingleChildScrollView(
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
    );
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
