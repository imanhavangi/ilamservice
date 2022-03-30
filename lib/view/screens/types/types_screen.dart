import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/data/service_product.dart';
import 'package:ilamservice/view/screens/category_services/category_services_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class TypesScreen extends StatelessWidget {
  final String phoneNum;
  const TypesScreen({Key? key, required this.phoneNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: const Center(
            child: Text(
          "ایلام سرویس",
          style: TextStyle(fontFamily: "iransans", color: Color(0xfff04a24)),
        )),
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
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
                        style: TextStyle(fontFamily: 'iransans', fontSize: 20),
                      ),
                    ],
                  ),
                  // color: Colors.teal[100],
                ).click(() async {
                  List<ServiceOrProduct> list =
                      await DatabaseServices.getChildServicesOfParent(4);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryServicesScreen(
                              superCategoryName: 'تعمیرات', categories: list)));
                }).make(),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
                        style: TextStyle(fontFamily: 'iransans', fontSize: 20),
                      ),
                    ],
                  ),
                ).click(() async {
                  List<ServiceOrProduct> list =
                      await DatabaseServices.getChildServicesOfParent(3);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryServicesScreen(
                              superCategoryName: 'فروشگاه', categories: list)));
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
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
                        style: TextStyle(fontFamily: 'iransans', fontSize: 20),
                      ),
                    ],
                  ),
                ).click(() async {
                  List<ServiceOrProduct> list =
                      await DatabaseServices.getChildServicesOfParent(5);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryServicesScreen(
                              superCategoryName: 'ساختمان', categories: list)));
                }).make(),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
                        style: TextStyle(fontFamily: 'iransans', fontSize: 20),
                      ),
                    ],
                  ),
                ).click(() async {
                  List<ServiceOrProduct> list =
                      await DatabaseServices.getChildServicesOfParent(9);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryServicesScreen(
                              superCategoryName: 'خدماتی', categories: list)));
                }).make(),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
