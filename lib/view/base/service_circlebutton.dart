import 'package:flutter/material.dart';

class ServiceCircleButton extends StatelessWidget {
  String image;
  ServiceCircleButton({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Image.asset(image),
    );
  }
}
