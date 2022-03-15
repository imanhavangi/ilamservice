import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/main.dart';
import 'package:ilamservice/view/screens/phone/phone_screen.dart';
import 'package:ilamservice/view/screens/types/types_screen.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpScreen2 extends StatefulWidget {
  final String phoneNumber;
  const OtpScreen2({Key? key, required this.phoneNumber}) : super(key: key);
  @override
  _OtpScreen2State createState() => _OtpScreen2State();
}

class _OtpScreen2State extends State<OtpScreen2> {
  String _code = "";
  String signature = "{{ app signature }}";
  String button = 'تایید کد';
  bool timerFinished = false;
  int _seconds = 120;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController inputCode = TextEditingController();
    return MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
            backgroundColor: const Color(0xff424242),
            body: SingleChildScrollView(
              child: Column(children: [
                Stack(
                  children: [
                    SizedBox(
                        height: 400,
                        child: topClip(MediaQuery.of(context).size)),
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
                Center(
                  child: SizedBox(
                    height: 150,
                    child: Image.asset("assets/icon.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // PhoneFieldHint(),
                      Padding(
                        // width: 100,
                        padding: EdgeInsets.only(left: 120, right: 120),
                        child: PinFieldAutoFill(
                          // controller: inputCode,
                          codeLength: 4,
                          decoration: UnderlineDecoration(
                            gapSpace: 7,
                            // lineHeight: 10,
                            // lineStrokeCap: StrokeCap.round,
                            textStyle: const TextStyle(
                                fontSize: 20, color: Colors.white),
                            colorBuilder: FixedColorBuilder(
                                Colors.white.withOpacity(0.3)),
                          ),
                          currentCode: _code,
                          onCodeSubmitted: (code) {},
                          onCodeChanged: (code) async {
                            _code = code!;
                            // print("object");
                            if (_code.length == 4) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              // print("sallllal"+_code);
                              try {
                                // print(_code);
                                FocusScope.of(context).unfocus();

                                String s =
                                    await DatabaseServices.login(code: _code);
                                if (s == 'fail') {
                                  VxToast.show(context,
                                      msg:
                                          'کد وارد شده صحیح نمی‌باشد لطفا دوباره تلاش کنید');
                                } else {
                                  Navigator.of(context).popAndPushNamed('se');
                                  // Navigator.of(context)
                                  //     .pushReplacementNamed('se');
                                  // Navigator.pushReplacementNamed(
                                  //       context, '/types');
                                  // Navigator.pushNamedAndRemoveUntil(
                                  //     context, '/types', (route) => false);
                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => TypesScreen(
                                  //             phoneNum: widget.phoneNumber,
                                  //           )),
                                  // );
                                }
                              } catch (e) {
                                VxToast.show(context,
                                    msg: 'به اینترنت متصل نیستید');
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // TextFieldPinAutoFill(
                      //   currentCode: _code,
                      // ),
                      Center(
                        child: Countdown(
                          seconds: _seconds,
                          build: (BuildContext context, double time) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                'مدت زمان باقی مانده: ' +
                                    time.toInt().toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'iransans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decorationStyle: TextDecorationStyle.solid,
                                ),
                              ),
                            );
                          },
                          interval: const Duration(milliseconds: 1000),
                          onFinished: () {
                            setState(() {
                              button = 'ارسال مجدد';
                              timerFinished = true;
                              _seconds = 120;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (timerFinished == true) {
                              String mobile = await DatabaseServices.getPhone();
                              DatabaseServices.sms2(phoneNumber: mobile);
                              setState(() {
                                timerFinished = false;
                                button = 'تایید کد';
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OtpScreen2(phoneNumber: mobile)));
                              });
                            } else {
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
                                    Navigator.of(context).popAndPushNamed('se');
                                    // Navigator.of(context)
                                    //     .pushReplacementNamed('se');
                                    // Navigator.pushNamedAndRemoveUntil(
                                    //     context, '/types', (route) => false);
                                  }
                                } catch (e) {
                                  VxToast.show(context,
                                      msg: 'به اینترنت متصل نیستید');
                                }
                              } else {
                                FocusScope.of(context).unfocus();
                                VxToast.show(context,
                                    msg: 'شماره باید ۴ رقم باشد');
                              }
                            }
                          },
                          child: Text(
                            button,
                            style: const TextStyle(
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
                        height: 10,
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
                              // version 1.3
                              Navigator.of(context).pop();
                            }),
                      ),
                    ],
                  ),
                ),
              ]),
            )));
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

class CodeAutoFillTestPage extends StatefulWidget {
  @override
  _CodeAutoFillTestPageState createState() => _CodeAutoFillTestPageState();
}

class _CodeAutoFillTestPageState extends State<CodeAutoFillTestPage>
    with CodeAutoFill {
  String? appSignature;
  String? otpCode;

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }

  @override
  void initState() {
    super.initState();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        appSignature = signature;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    cancel();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 18);

    return Scaffold(
      appBar: AppBar(
        title: Text("Listening for code"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
            child: Text(
              "This is the current app signature: $appSignature",
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Builder(
              builder: (_) {
                if (otpCode == null) {
                  return Text("Listening for code...", style: textStyle);
                }
                return Text("Code Received: $otpCode", style: textStyle);
              },
            ),
          ),
          const Spacer(),
        ],
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
