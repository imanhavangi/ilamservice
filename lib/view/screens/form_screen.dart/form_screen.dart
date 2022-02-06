import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.phone,
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
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.phone,
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
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.phone,
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
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.phone,
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
            TextField(
              maxLines: 1,
              // controller: price1,
              // onChanged: (value) async {
              //   print(now);
              //   value != ""
              //       ? price2.text = (double.parse(value) * now).toString()
              //       : price2.text = "";
              // },
              // color: Colors.black,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                border: InputBorder.none,
                // labelText: 'Enter Name',
                // hintText: 'Enter Your Name'
              ),
            ),
          ],
        )),
      ),
    );
  }
}
