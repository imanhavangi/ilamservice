import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ilamservice/data/service_product.dart';
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
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: const Color(0xfff04a24), width: 3),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 4,
              offset: Offset(4, 8),
            ),
          ]),
      height: 140,
      width: 140,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'http://ilamservices.ir/upload/product/' +
                (widget.product.fileName ?? ''),
            width: 100,
            height: 100,
          ),
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
    );
  }
}
