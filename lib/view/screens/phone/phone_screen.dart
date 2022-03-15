import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/view/screens/otp/otp_screen.dart';
import 'package:ilamservice/view/screens/otp/otp_screen2.dart';
import 'package:ilamservice/view/screens/otp/otp_screen3.dart';
import 'package:ilamservice/view/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:ilamservice/view/screens/rules/rules_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class PhoneScreen extends StatefulWidget {
  final String si;
  const PhoneScreen({Key? key, required this.si}) : super(key: key);

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  TextEditingController mobile = TextEditingController();
  bool acceptRules = false;
  @override
  Widget build(BuildContext context) {
    // print(widget.si);
    return Scaffold(
      backgroundColor: const Color(0xff424242),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  height: 400, child: topClip(MediaQuery.of(context).size)),
              Center(
                  child: Container(
                      padding: const EdgeInsets.only(top: 130),
                      child: const Text(
                        "ایلام سرویس",
                        style: TextStyle(
                            fontFamily: 'amirhafezi',
                            fontSize: 45,
                            color: Colors.white),
                      )))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: SizedBox(
                  height: 150,
                  child: Image.asset("assets/icon.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  controller: mobile,
                  style: const TextStyle(
                      fontFamily: 'iransans', color: Colors.white),
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(
                      Icons.phone,
                      // color: Color(0xffc7c8ca),
                      color: Colors.white,
                    ),
                    hintText: 'شماره همراه',
                    hintStyle:
                        TextStyle(fontFamily: 'iransans', color: Colors.white),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Checkbox(
                        // activeColor: Colors.white,
                        // shape: OutlinedBorder(side: BorderSide(color: Colors.white)),
                        side: const BorderSide(color: Colors.white, width: 2),
                        // overlayColor: Colors.white,
                        value: acceptRules,
                        onChanged: (value) {
                          setState(() {
                            acceptRules = value!;
                          });
                        }),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'iransans',
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' قوانین ',
                                style: TextStyle(
                                  color: Colors.blue.shade200,
                                  fontFamily: 'iransans',
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RulesScreen()));
                                  }),
                            const TextSpan(text: ' و '),
                            TextSpan(
                                text: ' سیاست نامه حریم خصوصی ',
                                style: TextStyle(
                                  color: Colors.blue.shade200,
                                  fontFamily: 'iransans',
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PrivacyPolicysScreen()));
                                  }),
                            const TextSpan(text: 'را می‌پذیرم'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: ElevatedButton(
                  onPressed: !acceptRules
                      ? () {
                          VxToast.show(context,
                              msg:
                                  'لطفا قوانین و حریم خصوصی را مطالعه کنید و آن‌ها را تایید کنید');
                        }
                      : () async {
                          if (mobile.text.length == 11) {
                            FocusScope.of(context).unfocus();
                            DatabaseServices.sms2(phoneNumber: mobile.text);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => OtpScreen2(
                                        phoneNumber: mobile.text,
                                      )),
                            );
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => OtpScreen2(
                            //             phoneNumber: mobile.text,
                            //           )),
                            // );
                          } else {
                            FocusScope.of(context).unfocus();
                            VxToast.show(context,
                                msg:
                                    "شماره باید ۱۱ رقمی باشد و با ۰۹ شروع شود");
                          }
                        },
                  child: const Text(
                    'ارسال کد تایید',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'iransans'),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    primary:
                        acceptRules ? const Color(0xfff04a24) : Colors.grey,
                    onPrimary: Colors.white,
                  ),
                ),
              ),
              // Text(
              //   widget.si,
              //   style: TextStyle(fontSize: 20, color: Colors.white),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //         // borderSide: BorderSide(color: appStore.iconColor!),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //         // borderSide: BorderSide(width: 1, color: appStore.iconColor!),
              //       ),
              //       alignLabelWithHint: false,
              //     ),
              //     keyboardType: TextInputType.phone,
              //   ),
              // )
            ],
          ),
        ],
      )),
    );
  }

  ClipPath topClip(Size size) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color(0xfff04a24),
            const Color(0xfff04a24).withOpacity(0.8),
          ], begin: Alignment.topLeft),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 4, size.height - 120, size.width / 2, size.height - 60);
    path.quadraticBezierTo(
        size.width / 4 * 3, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
