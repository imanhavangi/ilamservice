import 'package:flutter/material.dart';
import 'package:ilamservice/data/service_product.dart';
import 'package:ilamservice/view/base/service_circlebutton.dart';
import 'package:ilamservice/view/screens/form_screen.dart/form_screen_service.dart';

class ServiceButton extends StatelessWidget {
  final String text;
  final String image;
  const ServiceButton({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ServiceFormScreen(
                        service: ServiceOrProduct(
                            type: 0, id: 0, fatherId: 0, name: 'name'),
                      )));
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.width / 2.2,
          width: MediaQuery.of(context).size.width / 4,
          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Column(
            children: <Widget>[
              ServiceCircleButton(image: image),
              const SizedBox(
                height: 10,
              ),
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 16, color: Colors.white, fontFamily: "iransans"),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
