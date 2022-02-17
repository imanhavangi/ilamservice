import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final String text;
  final FaIcon image;

  const CardWidget(
      {Key? key, required this.title, required this.text, required this.image})
      : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(10),
      height: 142,
      padding: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.3),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: const [BoxShadow(blurRadius: 2)],
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                // height: 30,
                // margin: EdgeInsets.zero,
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  widget.title,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 250, //*******
                padding: const EdgeInsets.only(top: 10, left: 5),
                child: Text(
                  widget.text,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          Container(
            width: 110,
            height: 110,
            child: widget.image,
            // padding: EdgeInsets.only(right: 500),
            decoration: const BoxDecoration(
              // border: BoxBorder(),
              // border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            // child: Image.asset(widget.image),
          ),
        ],
      ),
    );
  }
}
