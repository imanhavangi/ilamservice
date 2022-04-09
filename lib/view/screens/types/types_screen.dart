import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/data/service_product.dart';
import 'package:ilamservice/view/screens/about_us/about_us_screen.dart';
import 'package:ilamservice/view/screens/category_services/category_services_screen.dart';
import 'package:ilamservice/view/screens/contact_us/contact_us_screen.dart';
import 'package:ilamservice/view/screens/order/order_screen.dart';
import 'package:ilamservice/view/screens/products/products_screen.dart';
import 'package:ilamservice/view/screens/profile/profile_screen.dart';
import 'package:ilamservice/view/screens/rules/rules_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:velocity_x/velocity_x.dart';

class TypesScreen extends StatelessWidget {
  final String phoneNum;
  const TypesScreen({Key? key, required this.phoneNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // drawer: Drawer(
        //   semanticLabel: 'something',
        //   backgroundColor: Colors.grey.shade700,
        //   child: ListView(
        //     children: [
        //       const SizedBox(
        //         height: 70,
        //         child: DrawerHeader(
        //           decoration: BoxDecoration(
        //             color: Color(0xfff04a24),
        //           ),
        //           child: Directionality(
        //             textDirection: TextDirection.rtl,
        //             child: Text(
        //               'ایلام سرویس',
        //               style: TextStyle(
        //                   fontFamily: 'iransans',
        //                   fontStyle: FontStyle.italic,
        //                   color: Colors.white),
        //             ),
        //           ),
        //         ),
        //       ),
        //       ListTile(
        //         title: const Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Text(
        //             'کد آخرین سفارش',
        //             style: TextStyle(
        //                 color: Color(0xf4f4f4f4), fontFamily: 'iransans'),
        //           ),
        //         ),
        //         onTap: () async {
        //           ServiceOrProduct serviceOrProduct =
        //               await DatabaseServices.getLastOrder();
        //           String code = await DatabaseServices.getCode();
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => OrderScreen(
        //                         code: code,
        //                         serviceOrProduct: serviceOrProduct,
        //                       )));
        //         },
        //       ),
        //       const Divider(
        //         color: Colors.white,
        //         height: 12,
        //       ),
        //       ListTile(
        //         title: const Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Text(
        //             'درباره ما',
        //             style: TextStyle(
        //                 color: Color(0xf4f4f4f4), fontFamily: 'iransans'),
        //           ),
        //         ),
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => const AboutUsScreen()));
        //         },
        //       ),
        //       const Divider(
        //         color: Colors.white,
        //         height: 12,
        //       ),
        //       ListTile(
        //         title: const Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Text(
        //             'پروفایل',
        //             style: TextStyle(
        //                 color: Color(0xf4f4f4f4), fontFamily: 'iransans'),
        //           ),
        //         ),
        //         onTap: () async {
        //           context.loaderOverlay.show();
        //           String phoneNum = await DatabaseServices.getPhone();
        //           String name = await DatabaseServices.getName();
        //           String lastName = await DatabaseServices.getLastName();
        //           context.loaderOverlay.hide();
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => ProfileScreen(
        //                         name: name,
        //                         lastName: lastName,
        //                         phoneNumber: phoneNum,
        //                       )));
        //         },
        //       ),
        //       const Divider(
        //         color: Colors.white,
        //         height: 12,
        //       ),
        //       ListTile(
        //         title: const Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: Text(
        //             'خروج از حساب کاربری',
        //             style: TextStyle(
        //                 color: Color(0xf4f4f4f4), fontFamily: 'iransans'),
        //           ),
        //         ),
        //         onTap: () async {
        //           context.loaderOverlay.show();
        //           SharedPreferences preferences =
        //               await SharedPreferences.getInstance();
        //           preferences.setString('mobile', '');
        //           preferences.setString('token', '');
        //           context.loaderOverlay.hide();
        //           Navigator.pushAndRemoveUntil(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (BuildContext context) => const PhoneScreen(
        //                       si: "",
        //                     )),
        //             ModalRoute.withName('fi'),
        //           );
        //         },
        //       ),
        //       const Divider(
        //         color: Colors.white,
        //         height: 12,
        //       ),
        //     ],
        //   ),
        // ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {
          //     _scaffoldKey.currentState!.openDrawer();
          //   },
          // ),
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: const Text(
            "ایلام سرویس",
            style: TextStyle(fontFamily: "iransans", color: Color(0xfff04a24)),
          ),
        ),
        // backgroundColor: Colors.black87,
        // appBar: AppBar(),
        body: Container(
          // height: MediaQuery.of(context).size.height,
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

          child: Column(
            // primary: false,
            // padding: const EdgeInsets.all(20),
            // crossAxisSpacing: 10,
            // mainAxisSpacing: 10,
            // crossAxisCount: 2,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.5, color: const Color(0xfff04a24)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38.withOpacity(0.35),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.orange,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    alignment: Alignment.center,
                    // padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.build,
                          size: 40,
                        ),
                        Text(
                          "تعمیرات",
                          style:
                              TextStyle(fontFamily: 'iransans', fontSize: 20),
                        ),
                      ],
                    ),
                    // color: Colors.teal[100],
                  ).click(() async {
                    context.loaderOverlay.show();
                    List<ServiceOrProduct> list =
                        await DatabaseServices.getChildServicesOfParent(
                            ServiceOrProduct(
                                type: 0, id: 3, fatherId: 3, name: ''));
                    context.loaderOverlay.hide();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductsScreen(
                                superCategoryName: 'تعمیرات',
                                productList: list)));
                  }).make(),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.5, color: const Color(0xfff04a24)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38.withOpacity(0.35),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.orange,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.shop,
                          size: 40,
                        ),
                        Text(
                          "فروشگاه",
                          style:
                              TextStyle(fontFamily: 'iransans', fontSize: 20),
                        ),
                      ],
                    ),
                  ).click(() async {
                    context.loaderOverlay.show();
                    List<ServiceOrProduct> list =
                        await DatabaseServices.getChildServicesOfParent(
                            ServiceOrProduct(
                                type: 0, id: 4, fatherId: 4, name: ''));
                    context.loaderOverlay.hide();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryServicesScreen(
                                superCategoryName: 'فروشگاه',
                                categories: list)));
                  }).make(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.5, color: const Color(0xfff04a24)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38.withOpacity(0.35),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.orange,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.apartment,
                          size: 40,
                        ),
                        Text(
                          "ساختمان",
                          style:
                              TextStyle(fontFamily: 'iransans', fontSize: 20),
                        ),
                      ],
                    ),
                  ).click(() async {
                    context.loaderOverlay.show();
                    List<ServiceOrProduct> list =
                        await DatabaseServices.getChildServicesOfParent(
                            ServiceOrProduct(
                                type: 0, id: 5, fatherId: 5, name: ''));
                    context.loaderOverlay.hide();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryServicesScreen(
                                superCategoryName: 'ساختمان',
                                categories: list)));
                  }).make(),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.5, color: const Color(0xfff04a24)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38.withOpacity(0.35),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.orange,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.construction,
                          size: 40,
                        ),
                        Text(
                          "خدماتی",
                          style:
                              TextStyle(fontFamily: 'iransans', fontSize: 20),
                        ),
                      ],
                    ),
                  ).click(() async {
                    context.loaderOverlay.show();
                    List<ServiceOrProduct> list =
                        await DatabaseServices.getChildServicesOfParent(
                            ServiceOrProduct(
                                type: 0, id: 9, fatherId: 9, name: ''));
                    context.loaderOverlay.hide();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryServicesScreen(
                                superCategoryName: 'خدماتی',
                                categories: list)));
                  }).make(),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            onTap: (index) async {
              switch (index) {
                case 0:
                  context.loaderOverlay.show();
                  String phoneNum = await DatabaseServices.getPhone();
                  String name = await DatabaseServices.getName();
                  String lastName = await DatabaseServices.getLastName();
                  context.loaderOverlay.hide();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                                name: name,
                                lastName: lastName,
                                phoneNumber: phoneNum,
                              )));
                  break;
                case 1:
                  ServiceOrProduct serviceOrProduct =
                      await DatabaseServices.getLastOrder();
                  String code = await DatabaseServices.getCode();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderScreen(
                                code: code,
                                serviceOrProduct: serviceOrProduct,
                              )));
                  break;
                case 2:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContacUsScreen()));
                  break;
                case 3:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutUsScreen()));
                  break;
                case 4:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RulesScreen()));
                  break;
              }
            },
            currentIndex: 2,
            selectedItemColor: const Color(0xfff04a24),
            unselectedItemColor: const Color(0xfff04a24),
            iconSize: 40,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(
                fontFamily: 'iransans', fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'iransans',
            ),
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(FontAwesomeIcons.solidAddressCard),
                  label: 'پروفایل'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(FontAwesomeIcons.fileSignature),
                  label: 'کد سفارش'),

              BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(FontAwesomeIcons.phone),
                  label: 'تماس با ما'),
              // BottomNavigationBarItem(
              //     backgroundColor: Colors.black87,
              //     icon: ImageIcon(
              //       AssetImage('assets/icon.png'),
              //       color: Color(0xfff04a24),
              //     ),
              //     label: 'ایلام سرویس'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(FontAwesomeIcons.info),
                  label: 'درباره ما'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black87,
                  icon: Icon(FontAwesomeIcons.book),
                  label: 'قوانین'),
            ],
          ),
        ),
      ),
    );
  }
}
