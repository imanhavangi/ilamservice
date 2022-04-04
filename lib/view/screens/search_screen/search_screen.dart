import 'package:flutter/material.dart';
import 'package:ilamservice/data/service_product.dart';
import 'package:ilamservice/view/screens/products/widgets/product.dart';

class SearchScreen extends StatefulWidget {
  final List<ServiceOrProduct> productList;
  const SearchScreen({Key? key, required this.productList}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _search = TextEditingController();
  List<ServiceOrProduct> _searchResults = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          // The search area here
          title: Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchResults = [];
                    for (ServiceOrProduct i in widget.productList) {
                      if (i.name.contains(value)) {
                        _searchResults.add(i);
                      }
                    }
                  });
                },
                cursorColor: const Color(0xfff04a24),
                controller: _search,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                autofocus: true,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xfff04a24), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _search.text = '';
                    },
                  ),
                  hintText: '',
                ),
              ),
            ),
          )),
      body: Container(
        height: double.infinity,
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
            itemCount: (_search.text.isEmpty)
                ? widget.productList.length
                : _searchResults.length,
            itemBuilder: (context, index) {
              if (_search.text == '') {
                return Product(
                  product: widget.productList[index],
                );
              } else {
                return Product(
                  product: _searchResults[index],
                );
              }
            }),
      ),
    );
  }
}
