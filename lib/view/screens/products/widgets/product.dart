import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/data/service_product.dart';
import 'package:ilamservice/view/screens/form_screen.dart/form_screen_product.dart';
import 'package:ilamservice/view/screens/form_screen.dart/form_screen_service.dart';

class Product extends StatefulWidget {
  final ServiceOrProduct product;
  const Product({Key? key, required this.product}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.width / 3.5,
        width: MediaQuery.of(context).size.width / 3.5,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, spreadRadius: 1, color: Colors.red.shade300)
            ],
            color: Colors.white,
            border: Border.all(color: Colors.red, width: 2)),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'http://ilamservices.ir/upload/product/' +
                  (widget.product.fileName ?? ''),
              height: MediaQuery.of(context).size.width / 5,
              width: MediaQuery.of(context).size.width / 5,
              fit: BoxFit.cover,
            ),

            // Image.network(
            //   'http://ilamservices.ir/upload/product/' +
            //       (widget.product.fileName ?? ''),
            //   height: MediaQuery.of(context).size.width / 5,
            //   width: MediaQuery.of(context).size.width / 5,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
              child: AutoSizeText(
                widget.product.name,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.black54,
                  fontFamily: 'IranSans',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
              child: Text(
                '${(widget.product.price ?? 0).toString()}  تومان',
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                    fontFamily: 'IranSans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      onTap: () async {
        switch (widget.product.fatherId) {
          case 4:
            String name = await DatabaseServices.getName();
            String lastName = await DatabaseServices.getLastName();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductFormScreen(
                        product: widget.product,
                        name: name,
                        lastName: lastName,
                      )),
            );
            break;
          default:
            String name = await DatabaseServices.getName();
            String lastName = await DatabaseServices.getLastName();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceFormScreen(
                          service: widget.product,
                          name: name,
                          lastName: lastName,
                        )));
        }
      },
    );
  }
}
