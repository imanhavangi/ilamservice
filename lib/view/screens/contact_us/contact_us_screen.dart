import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContacUsScreen extends StatelessWidget {
  const ContacUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          "تماس با ایلام سرویس",
          style: TextStyle(fontFamily: "iransans", color: Color(0xfff04a24)),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        // alignment: Alignment.center,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'با فشردن هر یک از دکمه‌های زیر می‌توانید با ایلام‌سرویس ارتباط بگیرید:',
                  style: TextStyle(
                      fontFamily: 'iransans',
                      fontSize: 20,
                      color: Color(0xf4f4f4f4)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange, shape: const StadiumBorder()),
                  onPressed: () async {
                    await launch('https://wa.me/+989188421092');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.whatsapp,
                      ),
                      Text(
                        'واتساپ',
                        style: TextStyle(fontFamily: 'iransans'),
                      ),
                    ],
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange, shape: const StadiumBorder()),
                  onPressed: () async {
                    await launch('https://www.instagram.com/ilam_service1400');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.instagram,
                      ),
                      Text(
                        'اینستاگرام',
                        style: TextStyle(fontFamily: 'iransans'),
                      ),
                    ],
                  )),
              ElevatedButton(
                  onPressed: () async {
                    await launch('https://t.me/faninajafi');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange, shape: const StadiumBorder()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.telegram,
                      ),
                      Text(
                        'تلگرام',
                        style: TextStyle(fontFamily: 'iransans'),
                      ),
                    ],
                  )),
              ElevatedButton(
                  onPressed: () async {
                    await launch('tel: +989188421092');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange, shape: const StadiumBorder()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.phone,
                      ),
                      Text(
                        'همراه شرکت:   ۰۹۱۸۸۴۲۱۰۹۲',
                        style: TextStyle(fontFamily: 'iransans'),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
