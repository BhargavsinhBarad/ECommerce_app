// import 'package:ecommerce_app/utils/product.dart';
import 'package:ecommerce_app/utils/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/utils/modelclass.dart';
// import 'package:flutter_application_1/utils/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../screens/details_page.dart';
import 'modelclass.dart';

Widget getproduct(
    {required String category,
    required String name,
    double minimumvalue = 0,
    double maximumvalue = 2000}) {
  return Builder(
    builder: (context) {
      double h = MediaQuery.of(context).size.height * 0.45;
      double w = MediaQuery.of(context).size.width * 0.5;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 25,
            ),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products
                  .map(
                    (e) => (e['category'] == category)
                        ? (e['price'] >= minimumvalue.toInt() &&
                                e['price'] <= maximumvalue.toInt())
                            ? GestureDetector(
                                onTap: () {
                                  product p1 = product(
                                    id: e['id'],
                                    title: e['title'],
                                    description: e['description'],
                                    price: e['price'],
                                    discountPercentage: e['discountPercentage'],
                                    rating: e['rating'],
                                    stock: e['stock'],
                                    brand: e['brand'],
                                    category: e['category'],
                                    thumbnail: e['thumbnail'],
                                    images: e['images'],
                                  );
                                  Navigator.of(context)
                                      .pushNamed('detail', arguments: p1);
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) =>  Detailspage(data: p1,)));
                                },
                                child: Container(
                                  height: h,
                                  width: w,
                                  margin: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 0),
                                        blurRadius: 20,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                    // border: Border.all(),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      e['thumbnail']),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight: Radius.circular(30),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 50,
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${e['discountPercentage']} % "
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              decoration: const BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          width: w,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(30),
                                              bottomRight: Radius.circular(30),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  e['title'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  "\$ ${e['price']}".toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: RatingBarIndicator(
                                                  rating:
                                                      e['rating'].toDouble(),
                                                  itemBuilder:
                                                      (context, index) =>
                                                          const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  itemCount: 5,
                                                  itemSize: 20,
                                                  direction: Axis.horizontal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container()
                        : Container(),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    },
  );
}
