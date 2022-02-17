import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ilamservice/data/database_services.dart';

import 'package:ilamservice/view/screens/phone/phone_screen.dart';
import 'package:ilamservice/view/screens/types/types_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController code = TextEditingController();
  String _code = "";
  bool _onEditing = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    // padding: EdgeInsets.only(left: 30, right: 30),
                    // width: 120,
                    // child: PinCodeTextField(
                    //   controller: code,
                    //   useHapticFeedback: true,
                    //   hapticFeedbackTypes: HapticFeedbackTypes.vibrate,
                    //   textStyle: const TextStyle(color: Colors.white),
                    //   pinTheme: PinTheme(
                    //     shape: PinCodeFieldShape.box,
                    //     borderRadius: BorderRadius.circular(5),
                    //     fieldHeight: 50,
                    //     fieldWidth: 40,
                    //     activeFillColor: Colors.white,
                    //   ),
                    //   length: 4,
                    //   backgroundColor: Colors.transparent.withRed(100),
                    //   cursorColor: Colors.white,
                    //   obscureText: false,
                    //   animationType: AnimationType.fade,
                    //   animationDuration: const Duration(milliseconds: 300),
                    //   onChanged: (value) {
                    //     setState(() {
                    //       code.text = value;
                    //     });
                    //   },
                    //   appContext: context,
                    // )
                    child: VerificationCode(
                      itemSize: 40,
                      textStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                      keyboardType: TextInputType.number,
                      underlineColor: Colors
                          .amber, // If this is null it will use primaryColor: Colors.red from Theme
                      length: 4,
                      cursorColor: Colors
                          .blue, // If this is null it will default to the ambient
                      // clearAll is NOT required, you can delete it
                      // takes any widget, so you can implement your design
                      // clearAll: Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text(
                      //     'clear all',
                      //     style: TextStyle(
                      //         fontSize: 14.0,
                      //         decoration: TextDecoration.underline,
                      //         color: Colors.blue[700]),
                      //   ),
                      // ),
                      onCompleted: (String value) {
                        setState(() {
                          print(value);
                          _code = value;
                        });
                      },
                      onEditing: (bool value) {
                        setState(() {
                          _onEditing = value;
                        });
                        if (!_onEditing) FocusScope.of(context).unfocus();
                      },
                    ),

                    // child: TextFormField(
                    //   controller: code,
                    //   style: const TextStyle(
                    //       fontFamily: 'iransans', color: Colors.white),
                    //   textAlign: TextAlign.center,
                    //   textDirection: TextDirection.rtl,
                    //   // controller: emailController,
                    //   decoration: const InputDecoration(
                    //     // contentPadding: EdgeInsets.zero,
                    //     hintTextDirection: TextDirection.rtl,
                    //     // prefixIcon: Icon(Icons.phone),
                    //     hintText: 'کد تایید',
                    //     hintStyle: TextStyle(
                    //         fontFamily: 'iransans', color: Color(0xffc7c8ca)),
                    //   ),
                    //   keyboardType: TextInputType.number,
                    // ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_code.length == 4) {
                          try {
                            print(_code);
                            FocusScope.of(context).unfocus();

                            String s =
                                await DatabaseServices.login(code: _code);
                            if (s == 'fail') {
                              VxToast.show(context,
                                  msg:
                                      'کد وارد شده صحیح نمی‌باشد لطفا دوباره تلاش کنید');
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TypesScreen(
                                          phoneNum: widget.phoneNumber,
                                        )),
                              );
                            }
                          } catch (e) {
                            VxToast.show(context,
                                msg: 'به اینترنت متصل نیستید');
                          }
                        } else {
                          FocusScope.of(context).unfocus();
                          VxToast.show(context, msg: 'شماره باید ۴ رقم باشد');
                        }
                      },
                      child: const Text(
                        'تایید کد',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                            color: Colors.white,
                            fontFamily: 'iransans'),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                        primary: const Color(0xfff04a24),
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                        ),
                        child: const Text('شماره را اشتباه وارد کرده‌اید؟',
                            style: TextStyle(fontFamily: 'iransans')),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PhoneScreen()));
                        }),
                  ),

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
          ),
        ));
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
