// import 'package:ecommerce_app/screens/cart_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/utils/product.dart';

import '../utils/modelclass.dart';
import '../utils/product.dart';
// import 'package:flutter_application_1/utils/modelclass.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({Key? key}) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    product data = ModalRoute.of(context)!.settings.arguments as product;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Details Page",
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!Addedproduct.contains(data)) {
            Addedproduct.add(data);
          }
          Navigator.of(context).pushNamed('cart');
        },
        child: Icon(Icons.shopping_cart),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: data.images
                      .map(
                        (e) => Container(
                          margin: const EdgeInsets.all(5),
                          height: 421,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(e),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          Positioned(
            top: 400,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.42,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          data.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        const Spacer(),
                        Text(
                          "\$ ${data.price}".toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.red),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          data.category,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey),
                        ),
                        const Spacer(),
                        Text(
                          "⭐ ${data.rating}".toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Brand",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        const Spacer(),
                        Text(
                          data.brand,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Stock",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        const Spacer(),
                        Text(
                          data.stock.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        )
                      ],
                    ),
                    Text(
                      "Description",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        data.description,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
