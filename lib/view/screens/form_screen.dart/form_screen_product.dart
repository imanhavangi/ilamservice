import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/data/service_product.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ProductFormScreen extends StatefulWidget {
  final ServiceOrProduct product;
  final String name;
  final String lastName;
  const ProductFormScreen(
      {required this.product,
      required this.name,
      required this.lastName,
      Key? key})
      : super(key: key);

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController description = TextEditingController();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          widget.product.name,
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
            child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xfff04a24), width: 3.0),
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38.withOpacity(0.35),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  'http://ilamservices.ir/upload/product/' +
                      (widget.product.fileName ?? ''),
                  height: MediaQuery.of(context).size.width / 1.5,
                  width: MediaQuery.of(context).size.width / 1.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${(widget.product.price ?? 0).toString()}  ??????????',
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                  fontFamily: 'IranSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xf4f4f4f4)),
            ),
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30, right: 30),
            //   child: TextFormField(
            //     controller: name,
            //     textDirection: TextDirection.rtl,
            //     style: const TextStyle(
            //         color: Colors.white, fontFamily: 'iransans'),
            //     decoration: const InputDecoration(
            //       hintTextDirection: TextDirection.rtl,
            //       prefixIcon: Icon(
            //         Icons.account_circle_rounded,
            //         // color: Color(0xffc7c8ca),
            //         color: Colors.white,
            //       ),
            //       hintText: '?????? ?? ?????? ????????????????',
            //       hintStyle:
            //           TextStyle(fontFamily: 'iransans', color: Colors.white),
            //     ),
            //     // keyboardType: TextInputType.phone,
            //   ),
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30, right: 30),
            //   child: TextFormField(
            //     controller: title,
            //     style: const TextStyle(
            //         color: Colors.white, fontFamily: 'iransans'),
            //     textDirection: TextDirection.rtl,
            //     decoration: const InputDecoration(
            //       hintTextDirection: TextDirection.rtl,
            //       prefixIcon: Icon(
            //         Icons.title,
            //         // color: Color(0xffc7c8ca),
            //         color: Colors.white,
            //       ),
            //       hintText: '???????? ?????????? ????????????????',
            //       hintStyle:
            //           TextStyle(fontFamily: 'iransans', color: Colors.white),
            //     ),
            //     // keyboardType: TextInputType.phone,
            //   ),
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: nameController,
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
                  hintText: '??????',
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
                controller: lastNameController,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'iransans'),
                decoration: const InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.account_circle_sharp,
                    // color: Color(0xffc7c8ca),
                    color: Colors.white,
                  ),
                  hintText: '?????? ????????????????',
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
                  hintText: '??????????????',
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
            //   padding: const EdgeInsets.only(left: 30, right: 30),
            //   child: TextFormField(
            //     controller: brand,
            //     style: const TextStyle(
            //         color: Colors.white, fontFamily: 'iransans'),
            //     textDirection: TextDirection.rtl,
            //     decoration: const InputDecoration(
            //       hintTextDirection: TextDirection.rtl,
            //       prefixIcon: Icon(
            //         Icons.branding_watermark,
            //         // color: Color(0xffc7c8ca),
            //         color: Colors.white,
            //       ),
            //       hintText: '?????? ???????? ?? ??????',
            //       hintStyle:
            //           TextStyle(fontFamily: 'iransans', color: Colors.white),
            //     ),
            //     // keyboardType: TextInputType.phone,
            //   ),
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
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
                  hintText: '????????',
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
            //                   text: ' ???????????? ',
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
            //                   text: '???? ???????????? ????????????????? ?? ??????????? ???? ?????????????????'),
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
              onPressed: () async {
                FocusScope.of(context).unfocus();
                if (nameController.text == '' ||
                    lastNameController.text == '' ||
                    address.text == '') {
                  VxToast.show(context,
                      msg:
                          '???????? ???????? ???????? ?????? ?????????????????? ?? ???????? ???????????? ???????????????');
                } else {
                  context.loaderOverlay.show();
                  if (widget.name != nameController.text ||
                      widget.lastName != lastNameController.text) {
                    await DatabaseServices.changeName(
                        name: nameController.text,
                        lastName: lastNameController.text);
                  }
                  String code = await DatabaseServices.requestProduct(
                    productId: widget.product.id,
                    description: description.text,
                    address: address.text,
                    fatherId: widget.product.fatherId,
                    name: widget.product.name,
                  );
                  context.loaderOverlay.hide();
                  VxToast.show(context,
                      textSize: 16,
                      msg:
                          '?????????????? ?????????? ???? ???????????? ?????? ???? ???? ???????????? ??????: $code ???? ???????????? ?????????? ???? ???????????? ???? ???? ???????? ?????? ???????????? ???????????? ????????',
                      position: VxToastPosition.bottom,
                      pdHorizontal: 0,
                      pdVertical: 0,
                      showTime: 6000);
                  // version 1.3
                  Navigator.pop(context);
                }
              },
              child: const Text(
                '?????? ??????????????',
                style: TextStyle(fontFamily: 'iransans', fontSize: 20),
              ),
            )),
          ],
        )),
      ),
    );
  }
}
