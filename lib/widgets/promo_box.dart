import 'package:flutter/material.dart';

import '../models/promo_model.dart';

class PromoBox extends StatelessWidget {
  final Promo promo;

  const PromoBox({super.key, required this.promo});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 110,
        margin: EdgeInsets.only(right: 5),
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            image: DecorationImage(
                image: NetworkImage(promo.imageUrl), fit: BoxFit.cover)),
      ),
      ClipPath(
        clipper: PromoCustomCilper(),
        child: Container(
          height: 90,
          margin: EdgeInsets.only(right: 5),
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blueGrey,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                promo.title,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                promo.description,
                style: TextStyle(color: Colors.black),
              )
            ]),
          ),
        ),
      ),
    ]);
  }
}

class PromoCustomCilper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(340, size.height);
    path.lineTo(440, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
