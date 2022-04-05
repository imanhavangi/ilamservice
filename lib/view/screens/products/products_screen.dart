import 'package:flutter/material.dart';
import 'package:ilamservice/data/service_product.dart';
import 'package:ilamservice/view/screens/products/widgets/product.dart';
import 'package:ilamservice/view/screens/search_screen/search_screen.dart';

class ProductsScreen extends StatefulWidget {
  /// use [superCategoryName] in appbar.
  final String superCategoryName;
  final List<ServiceOrProduct> productList;
  const ProductsScreen(
      {Key? key, required this.superCategoryName, required this.productList})
      : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchScreen(
                                productList: widget.productList,
                              )));
                },
                icon: const Icon(Icons.search)),
          ],
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
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width / 2),
                itemCount: widget.productList.length,
                itemBuilder: (context, index) {
                  return Product(
                    product: widget.productList[index],
                  );
                })),
      ),
    );
  }
}
