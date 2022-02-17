import 'package:flutter/material.dart';
import 'package:ilamservice/view/screens/services/widget/service_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<List> data = [[]];
  Column show = Column();
  final TextEditingController _search = TextEditingController();
  @override
  void initState() {
    data = searchText('');
    show = shown(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    show = shown(searchText(value));
                  });
                },
                cursorColor: Colors.black,
                controller: _search,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'iransans', fontSize: 12),
                autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _search.text = '';
                    },
                  ),
                  hintText: '',
                ),
              ),
            ),
          )),
      body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color(0xff4e4f51),
                Color(0xff808186),
                Color(0xff4e4f51),
              ])),
          child: SingleChildScrollView(child: SafeArea(child: show))),
    );
  }

  List<List> searchText(String searchedText) {
    List<List> result = [[]];
    List<List> data = [
      ["یخچال", "assets/refrigerator.png"],
      ["آبگرمکن", "assets/waterheater.png"],
      ["پکیج", "assets/radiator.png"],
      ["کولر", "assets/cooler.png"],
      ["اجاق گاز", "assets/oven.png"],
      ["هود", "assets/hood.png"],
      ["لباسشویی", "assets/laundry.png"],
      ["ظرفشویی", "assets/dishwasher.png"],
      ["جارو برقی", "assets/cleaner.png"],
      ["دینام کولر", "assets/DynamoCooler.png"],
      ["آسانسور", "assets/Elevator.png"],
      ["بالابر", "assets/lift.png"],
      ["لوله کشی", "assets/piping.png"],
      ["پمپ آب", "assets/waterpump.png"],
      ["موتورخانه", "assets/powerhouse.png"],
      ["چرخ گوشت", "assets/meatgrinder.png"],
      ["آبمیوه گیر", "assets/juicer.png"],
      ["سبزی خردکن", "assets/vegtable.png"],
      ["گوشت کوب", "assets/masher.png"],
      ["زودپر و بخارپز", "assets/steamer.png"],
      ["آبجوش کن", "assets/waterboiler.png"],
      ["رشته و رنده کن", "assets/grater.png"],
      ["همزن معمولی", "assets/agitator.png"],
      ["مخلوط کن سرعتی", "assets/mixer.png"],
      ["تُستِر", "assets/toaster.png"],
      ["ساندویچ ساز", "assets/sandwich.png"],
      ["قهوه جوش", "assets/coffee.png"],
      ["سماور برقی", "assets/samovars.png"],
      ["سرخ کن", "assets/fryer.png"],
      ["چای ساز", "assets/tea.png"],
      ["پیکور برقی", "assets/pikor.png"],
      ["سیم پیچی", "assets/wiring.png"],
      ["بخاری و شومینه", "assets/fireplace.png"],
      ["تردمیل", "assets/treadmill.png"],
      ["سشوار", "assets/hairdryer.png"],
      ["رادیاتور", "assets/radi.png"],
      ["فن کویل", "assets/coilfan.png"],
      ["چیلر", "assets/chiller.png"],
      ["نصب سینک", "assets/sink.png"],
      ["کانال سازی", "assets/channelbuilding.png"],
      ["تصفیه آب", "assets/waterrefinery.png"],
      ["کنسول بازی", "assets/console.png"],
      ["ریش تراش", "assets/shaver.png"],
      ["شیرآلات", "assets/valve.png"],
      ["فلاش تانک", "assets/flush.png"],
      ["روشویی", "assets/washface.png"],
      ["بخارشور", "assets/steam.png"],
      ["فر", "assets/fer.png"],
      ["تلوزیون", "assets/tv.png"],
      ["ساندبار و اسپیکر", "assets/speaker.png"],
      ["رادیو ضبط", "assets/radio.png"],
      ["چرخ خیاطی", "assets/sewingmachine.png"],
      ["مبلمان", "assets/furniture.png"],
      ["غذاساز", "assets/foodprocessor.png"],
    ];
    if (searchedText == '') {
      return data;
    }
    for (var a in data) {
      if (a[0].contains(searchedText)) {
        print('it does');
        result.add(a);
      }
    }
    return result;
  }

  Row BuildRow(List<List> data) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        textDirection: TextDirection.rtl,
        children: [
          for (var t in data) ServiceButton(text: t[0], image: t[1]),
        ]);
  }

  Column shown(List<List> data) {
    data.removeAt(0);
    List<Row> rowList = [];

    int i = 1;
    for (; i <= data.length / 3; i++) {
      var subData = data.sublist((i - 1) * 3, i * 3);

      rowList.add(BuildRow(subData));
    }
    var subData = data.sublist(data.length - (data.length % 3), data.length);
    rowList.add(BuildRow(subData));
    return Column(
      children: rowList.isEmpty ? [Container()] : rowList,
    );
  }
}
