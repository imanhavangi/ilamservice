import 'package:flutter/material.dart';

class FutureScreen extends StatelessWidget {
  const FutureScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: const Center(
          child: Text(
            'این صفحه به زودی طراحی خواهد شد',
            style: TextStyle(
                fontFamily: 'iransans', fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      // bottomNavigationBar: _bottomNavigationBar,
    );
  }
}