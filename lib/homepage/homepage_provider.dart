import 'package:flutter/material.dart';
import 'package:flutter_covid_19_app_2/model/symptoms.dart';

class Symptoms extends ChangeNotifier{

  List<Product> demoProducts = [
    Product(
      image: "assets/icons/running.svg",
      title: "Confirmed",
      iconColor: Color(0xffff8c00),
      effectNumber: 1077,
    ),
    Product(
      image: "assets/icons/running.svg",
      title: "Total Deaths",
      iconColor: Color(0xffff2dff),
      effectNumber: 75,
    ),
    Product(
      image: "assets/icons/running.svg",
      title: "Total Recovered",
      iconColor: Color(0xff50e3c2),
      effectNumber: 689,
    ),
    Product(
      image: "assets/icons/running.svg",
      title: "News Cases",
      iconColor: Color(0xff5856d6),
      effectNumber: 75,
    ),
  ];
}