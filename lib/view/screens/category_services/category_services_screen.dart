import 'package:flutter/material.dart';
import 'package:ilamservice/data/service_product.dart';
import 'package:ilamservice/view/screens/category_services/widgets/category_service.dart';

class CategoryServicesScreen extends StatefulWidget {
  final String superCategoryName;
  final List<ServiceOrProduct> categories;

  /// [superCategoryName] will be shown in the appbar along with the icon of the superCategory.
  const CategoryServicesScreen(
      {Key? key, required this.superCategoryName, required this.categories})
      : super(key: key);

  @override
  State<CategoryServicesScreen> createState() => _CategoryServicesScreenState();
}

class _CategoryServicesScreenState extends State<CategoryServicesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.categories.isNotEmpty) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black87,
              centerTitle: true,
              title: Text(
                widget.superCategoryName,
                style: const TextStyle(
                    fontFamily: "iransans", color: Color(0xfff04a24)),
              )),
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
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent:
                          MediaQuery.of(context).size.width / 2),
                  itemCount: widget.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryService(
                        categoryService: widget.categories[index]);
                  })),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            centerTitle: true,
            title: Text(
              widget.superCategoryName,
              style: const TextStyle(
                  fontFamily: "iransans", color: Color(0xfff04a24)),
            ),
          ),
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
            child: const Center(
              child: Text(
                'محصولی برای نمایش وجود ندارد',
                style: TextStyle(
                  fontFamily: 'IranSans',
                  fontSize: 20,
                  color: Color(0xf4f4f4f4),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
