import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
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
            border: Border.all(width: 2.5, color: const Color(0xfff04a24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black38.withOpacity(0.35),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.orange,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.width / 3,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        // padding: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
          child: AutoSizeText(
            widget.categoryService.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: const TextStyle(
              fontFamily: 'iransans',
              fontSize: 22,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
      onTap: () async {
        List<ServiceOrProduct> list =
            await DatabaseServices.getChildServicesOfParent(
                widget.categoryService);
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
