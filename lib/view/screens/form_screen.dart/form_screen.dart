import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  final String title;

  const FormScreen({required this.title, Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4e4f51),
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontFamily: 'iransans'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
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
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: name,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'iransans'),
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.account_circle_rounded,
                    // color: Color(0xffc7c8ca),
                    color: Colors.white,
                  ),
                  hintText: 'نام و نام خانوادگی',
                  hintStyle:
                      TextStyle(fontFamily: 'iransans', color: Colors.white),
                ),
                // keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: title,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'iransans'),
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.title,
                    // color: Color(0xffc7c8ca),
                    color: Colors.white,
                  ),
                  hintText: 'عنوان',
                  hintStyle:
                      TextStyle(fontFamily: 'iransans', color: Colors.white),
                ),
                // keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: description,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'iransans'),
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.details,
                    // color: Color(0xffc7c8ca),
                    color: Colors.white,
                  ),
                  hintText: 'توضیحات',
                  hintStyle:
                      TextStyle(fontFamily: 'iransans', color: Colors.white),
                ),
                // keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: brand,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'iransans'),
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.branding_watermark,
                    // color: Color(0xffc7c8ca),
                    color: Colors.white,
                  ),
                  hintText: 'نام برند و مدل',
                  hintStyle:
                      TextStyle(fontFamily: 'iransans', color: Colors.white),
                ),
                // keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: address,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'iransans'),
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.location_on,
                    // color: Color(0xffc7c8ca),
                    color: Colors.white,
                  ),
                  hintText: 'آدرس',
                  hintStyle:
                      TextStyle(fontFamily: 'iransans', color: Colors.white),
                ),
                // keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: const Color(0xfff04a24)),
              onPressed: () {},
              child: const Text(
                'ثبت درخواست',
                style: TextStyle(fontFamily: 'iransans', fontSize: 20),
              ),
            )),
          ],
        )),
      ),
    );
  }
}
