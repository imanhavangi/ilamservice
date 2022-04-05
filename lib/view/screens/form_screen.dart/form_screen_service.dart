import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/data/service_product.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ServiceFormScreen extends StatefulWidget {
  final String name;
  final String lastName;
  final ServiceOrProduct service;

  const ServiceFormScreen(
      {required this.service,
      required this.name,
      required this.lastName,
      Key? key})
      : super(key: key);

  @override
  _ServiceFormScreenState createState() => _ServiceFormScreenState();
}

class _ServiceFormScreenState extends State<ServiceFormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController address = TextEditingController();
  // bool acceptRules = false;
  @override
  void initState() {
    nameController.text = widget.name;
    lastNameController.text = widget.lastName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle main = const TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'iransans',
        fontSize: 22,
        color: Colors.black);
    TextStyle mainMedium = const TextStyle(
        // fontWeight: FontWeight.bold,
        fontFamily: 'iransans',
        fontSize: 18,
        color: Colors.black);
    TextStyle mainSmall = const TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'iransans',
        fontSize: 12,
        color: Colors.black);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4e4f51),
        centerTitle: true,
        title: Text(
          widget.service.name,
          style:
              const TextStyle(fontFamily: 'iransans', color: Color(0xfff04a24)),
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
          child: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Colors.amber,
              backgroundColor: Colors.black,
              colorScheme: const ColorScheme(
                  primary: Colors.black26,
                  background: Colors.black54,
                  surface: Colors.black54,
                  brightness: Brightness.light,
                  error: Colors.red,
                  onBackground: Colors.purple,
                  onError: Colors.orange,
                  onPrimary: Colors.black,
                  onSecondary: Colors.black,
                  onSurface: Colors.black,
                  secondary: Colors.pink,
                  primaryVariant: Colors.amber,
                  secondaryVariant: Colors.black38),
              textTheme: TextTheme(
                headline4: main,
                headline5: main,
                button: mainMedium,
                bodyText1: mainMedium,
                bodyText2: mainMedium,
                caption: mainSmall,
                headline1: mainMedium,
                headline2: mainMedium,
                headline3: mainMedium,
                headline6: mainMedium,
                overline: mainSmall,
                subtitle1: mainMedium,
                subtitle2: mainMedium,
              ),
            ),
            child: Builder(
                builder: (context) => Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextFormField(
                            controller: nameController,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                                color: Color(0xf4f4f4f4),
                                fontFamily: 'iransans'),
                            decoration: const InputDecoration(
                              hintTextDirection: TextDirection.rtl,
                              prefixIcon: Icon(
                                Icons.account_circle_rounded,
                                // color: Color(0xffc7c8ca),
                                color: Colors.white,
                              ),
                              hintText: 'نام',
                              hintStyle: TextStyle(
                                  fontFamily: 'iransans',
                                  color: Color(0xf4f4f4f4)),
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
                            controller: lastNameController,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                                color: Color(0xf4f4f4f4),
                                fontFamily: 'iransans'),
                            decoration: const InputDecoration(
                              hintTextDirection: TextDirection.rtl,
                              prefixIcon: Icon(
                                Icons.account_circle_sharp,
                                // color: Color(0xffc7c8ca),
                                color: Colors.white,
                              ),
                              hintText: 'نام خانوادگی',
                              hintStyle: TextStyle(
                                  fontFamily: 'iransans',
                                  color: Color(0xf4f4f4f4)),
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
                            readOnly: true,
                            onTap: () async {
                              Jalali? picked = await showPersianDatePicker(
                                context: context,
                                initialDate: Jalali.now(),
                                firstDate: Jalali.now(),
                                lastDate: Jalali(1450, 9),
                              );
                              if (picked != null) {
                                setState(() {
                                  title.text = picked.year.toString() +
                                      '/' +
                                      picked.month.toString() +
                                      '/' +
                                      picked.day.toString();
                                });
                              }
                            },
                            controller: title,
                            style: const TextStyle(
                                color: Color(0xf4f4f4f4),
                                fontFamily: 'iransans'),
                            textDirection: TextDirection.rtl,
                            decoration: const InputDecoration(
                              hintTextDirection: TextDirection.rtl,
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1)),
                              prefixIcon: Icon(
                                Icons.title,
                                // color: Color(0xffc7c8ca),
                                color: Colors.white,
                              ),
                              hintText: 'زمان ارسال تعمیرکار',
                              hintStyle: TextStyle(
                                  fontFamily: 'iransans',
                                  color: Color(0xf4f4f4f4)),
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
                                color: Color(0xf4f4f4f4),
                                fontFamily: 'iransans'),
                            textDirection: TextDirection.rtl,
                            decoration: const InputDecoration(
                              hintTextDirection: TextDirection.rtl,
                              prefixIcon: Icon(
                                Icons.details,
                                // color: Color(0xffc7c8ca),
                                color: Colors.white,
                              ),
                              hintText: 'توضیحات',
                              hintStyle: TextStyle(
                                  fontFamily: 'iransans',
                                  color: Color(0xf4f4f4f4)),
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
                                color: Color(0xf4f4f4f4),
                                fontFamily: 'iransans'),
                            textDirection: TextDirection.rtl,
                            decoration: const InputDecoration(
                              hintTextDirection: TextDirection.rtl,
                              prefixIcon: Icon(
                                Icons.branding_watermark,
                                // color: Color(0xffc7c8ca),
                                color: Colors.white,
                              ),
                              hintText: 'نام برند و مدل',
                              hintStyle: TextStyle(
                                  fontFamily: 'iransans',
                                  color: Color(0xf4f4f4f4)),
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
                                color: Color(0xf4f4f4f4),
                                fontFamily: 'iransans'),
                            textDirection: TextDirection.rtl,
                            decoration: const InputDecoration(
                              hintTextDirection: TextDirection.rtl,
                              prefixIcon: Icon(
                                Icons.location_on,
                                // color: Color(0xffc7c8ca),
                                color: Colors.white,
                              ),
                              hintText: 'آدرس',
                              hintStyle: TextStyle(
                                  fontFamily: 'iransans',
                                  color: Color(0xf4f4f4f4)),
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
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xfff04a24)),
                          onPressed: ((nameController.text == '' ||
                                  lastNameController.text == '' ||
                                  title.text == '' ||
                                  address.text == ''))
                              ? () {
                                  VxToast.show(context,
                                      msg:
                                          'مقادیر نام و نام خانوادگی، زمان ارسال تعمیر‌کار، و آدرس اجباری می‌باشند');
                                }
                              : () async {
                                  FocusScope.of(context).unfocus();
                                  context.loaderOverlay.show();
                                  if (widget.name != nameController.text ||
                                      widget.lastName !=
                                          lastNameController.text) {
                                    await DatabaseServices.changeName(
                                        name: nameController.text,
                                        lastName: lastNameController.text);
                                  }
                                  String code =
                                      await DatabaseServices.requestService(
                                    productId: widget.service.id,
                                    description: description.text,
                                    dateSend: title.text,
                                    address: address.text,
                                    brand: brand.text,
                                    fatherId: widget.service.fatherId,
                                    name: widget.service.name,
                                  );
                                  context.loaderOverlay.hide();
                                  VxToast.show(context,
                                      textSize: 16,
                                      msg:
                                          'درخواست خدمت با موفقیت ثبت شد کد رهگیری شما: $code می توانید آخرین کد رهگیری را در قسمت «کد آخرین سفارش» مشاهده کنید',
                                      position: VxToastPosition.bottom,
                                      pdHorizontal: 0,
                                      pdVertical: 0,
                                      showTime: 6000);
                                  // version 1.3
                                  Navigator.pop(context);
                                },
                          child: const Text(
                            'ثبت درخواست',
                            style:
                                TextStyle(fontFamily: 'iransans', fontSize: 20),
                          ),
                        )),
                      ],
                    )),
          ),
        ),
      ),
    );
  }
}
