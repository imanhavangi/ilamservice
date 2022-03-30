import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/data/service_product.dart';
import 'package:ilamservice/view/screens/category_services/category_services_screen.dart';
import 'package:ilamservice/view/screens/products/products_screen.dart';

class CategoryService extends StatefulWidget {
  final ServiceOrProduct categoryService;
  const CategoryService({Key? key, required this.categoryService})
      : super(key: key);

  @override
  State<CategoryService> createState() => _CategoryServiceState();
}

class _CategoryServiceState extends State<CategoryService> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
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
        height: 100,
        width: 100,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.categoryService.name,
              style: const TextStyle(
                color: Colors.black87,
                fontFamily: 'IranSans',
              ),
            ),
          ],
        ),
      ),
      onTap: () async {
        List<ServiceOrProduct> list =
            await DatabaseServices.getChildServicesOfParent(
                widget.categoryService.id);
        if (list.isEmpty) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryServicesScreen(
                      superCategoryName: widget.categoryService.name,
                      categories: list)));
        } else {
          if (list[0].type == 0) {
            // list of categories
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CategoryServicesScreen(
                        superCategoryName: widget.categoryService.name,
                        categories: list)));
          } else {
            // list of products.
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductsScreen(
                        superCategoryName: widget.categoryService.name,
                        productList: list)));
          }
        }
      },
    );
  }
}
