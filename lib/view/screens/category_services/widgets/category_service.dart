import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ilamservice/data/database_services.dart';
import 'package:ilamservice/data/service_product.dart';
import 'package:ilamservice/view/screens/category_services/category_services_screen.dart';
import 'package:ilamservice/view/screens/products/products_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
          child: Center(
            child: AutoSizeText(
              widget.categoryService.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                fontFamily: 'iransans',
                fontSize: 22,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ),
      ),
      onTap: () async {
        context.loaderOverlay.show();
        List<ServiceOrProduct> list =
            await DatabaseServices.getChildServicesOfParent(
                widget.categoryService);
        context.loaderOverlay.hide();
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
