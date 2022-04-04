import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ilamservice/data/service_product.dart';
import 'package:ilamservice/view/screens/form_screen.dart/form_screen_product.dart';
import 'package:ilamservice/view/screens/form_screen.dart/form_screen_service.dart';
import 'package:velocity_x/velocity_x.dart';

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
            CachedNetworkImage(
              imageUrl: 'http://ilamservices.ir/upload/product/' +
                  (widget.product.fileName ?? ''),
              imageBuilder: (context, imageProvider) => Container(
                height: MediaQuery.of(context).size.width / 5,
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    // colorFilter: const ColorFilter.mode(
                    //     Colors.red, BlendMode.colorBurn)),
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            // Image.network(
            //   'http://ilamservices.ir/upload/product/' +
            //       (widget.product.fileName ?? ''),
            //   height: MediaQuery.of(context).size.width / 5,
            //   width: MediaQuery.of(context).size.width / 5,
            // ),
            Text(
              widget.product.name,
              style: const TextStyle(
                color: Colors.black54,
                fontFamily: 'IranSans',
              ),
            ),
            Text(
              '${(widget.product.price ?? 0).toString()}  تومان',
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                  fontFamily: 'IranSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      onTap: () {
        switch (widget.product.fatherId) {
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductFormScreen(product: widget.product)),
            );
            break;
          default:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ServiceFormScreen(service: widget.product)));
        }
      },
    );
  }
}
