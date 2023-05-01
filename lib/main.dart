// import 'package:ecommerce_app/screens/home_page.dart';
// import 'package:ecommerce_app/utils/product.dart';
// import 'package:ecommerce_app/screens/cart_page.dart';
// import 'package:ecommerce_app/screens/details_page.dart';
// import 'package:ecommerce_app/screens/home_page.dart';
import 'package:ecommerce_app/screens/cart_page.dart';
import 'package:ecommerce_app/screens/details_page.dart';
import 'package:ecommerce_app/screens/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/cart_page.dart';
// import 'package:flutter_application_1/screens/details_page.dart';
// import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_application_1/utils/product.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: "ECommerce App ",
      routes: {
        '/': (ctx) => const Home(),
        'detail': (ctx) => const Detailspage(),
        'cart': (ctx) => const cartpage()
      },
    ),
  );
}
