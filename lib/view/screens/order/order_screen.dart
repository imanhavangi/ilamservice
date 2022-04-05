import 'package:flutter/material.dart';
import 'package:ilamservice/data/service_product.dart';

class OrderScreen extends StatelessWidget {
  final ServiceOrProduct serviceOrProduct;
  final String code;
  const OrderScreen(
      {Key? key, required this.serviceOrProduct, required this.code})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String superCategory = '';
    switch (serviceOrProduct.fatherId) {
      case 3:
        superCategory = 'تعمیرات';
        break;
      case 4:
        superCategory = 'فروشگاه';
        break;
      case 5:
        superCategory = 'ساختمان';
        break;
      case 9:
        superCategory = 'خدماتی';
        break;
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: const Text(
            "کد سفارش",
            style: TextStyle(fontFamily: "iransans", color: Color(0xfff04a24)),
          ),
        ),
        // backgroundColor: Colors.black87,
        // appBar: AppBar(),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color(0xff4e4f51),
                Color(0xff808186),
                Color(0xff4e4f51),
              ])),
          child: (code == '')
              ? const Center(
                  child: Text(
                    'سفارشی بر روی حافظه یافت نشد.',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontFamily: 'iransans',
                        fontSize: 20,
                        color: Colors.white),
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'دسته آخرین سفارش: $superCategory',
                        style: const TextStyle(
                            fontFamily: 'iransans',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        'آخرین سفارش: ' + serviceOrProduct.name,
                        style: const TextStyle(
                            fontFamily: 'iransans',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        'کد آخرین سفارش: ' + code,
                        style: const TextStyle(
                            fontFamily: 'iransans',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
        ),
        // bottomNavigationBar: _bottomNavigationBar,
      ),
    );
  }
}
