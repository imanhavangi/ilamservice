import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/view/screens/rules/rules_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class FormScreen extends StatefulWidget {
  final String service;

  const FormScreen({required this.service, Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController address = TextEditingController();
  // bool acceptRules = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4e4f51),
        centerTitle: true,
        title: Text(
          widget.service,
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
                  hintText: 'زمان ارسال تعمیرکار',
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
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Checkbox(
            //           value: acceptRules,
            //           onChanged: (value) {
            //             setState(() {
            //               acceptRules = value!;
            //             });
            //           }),
            //       Directionality(
            //         textDirection: TextDirection.rtl,
            //         child: RichText(
            //           text: TextSpan(
            //             style: const TextStyle(
            //               color: Colors.white,
            //               fontFamily: 'iransans',
            //             ),
            //             children: <TextSpan>[
            //               TextSpan(
            //                   text: ' قوانین ',
            //                   style: TextStyle(
            //                     color: Colors.blue.shade200,
            //                     fontFamily: 'iransans',
            //                   ),
            //                   recognizer: TapGestureRecognizer()
            //                     ..onTap = () {
            //                       Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                               builder: (context) =>
            //                                   const RulesScreen()));
            //                     }),
            //               const TextSpan(
            //                   text: 'را مطالعه نموده‌ام و آن‌ها را می‌پذیرم'),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 30,
            ),
            Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: const Color(0xfff04a24)),
              onPressed:
                  ((name.text == '' || title.text == '' || address.text == ''))
                      ? () {
                          VxToast.show(context,
                              msg:
                                  'مقادیر نام و نام خانوادگی، زمان ارسال تعمیر‌کار، و آدرس اجباری می‌باشند');
                        }
                      : () {
                          FocusScope.of(context).unfocus();
                          DatabaseServices.requestService(
                              service: widget.service,
                              title: title.text,
                              description: description.text,
                              name: name.text,
                              address: address.text,
                              brand: brand.text);
                          VxToast.show(context, msg: 'خدمت با موفقیت ثبت شد');
                          // version 1.3
                          Navigator.pop(context);
                        },
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
