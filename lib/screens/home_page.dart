// import 'package:ecommerce_app/utils/product.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/utils/widget.dart';

import '../utils/product.dart';
import '../utils/widget.dart';
import 'details_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selecategory;
  RangeValues rangeValues = const RangeValues(1, 2000);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height * 0.40;
    double w = MediaQuery.of(context).size.height * 0.25;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: DropdownButton(
                    value: selecategory,
                    hint: const Text("select category..."),
                    items: Category.map(
                      (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ),
                    ).toList(),
                    onChanged: (val) {
                      setState(() {
                        selecategory = val;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: selecategory != null,
                  child: ActionChip(
                    avatar: const Icon(Icons.clear),
                    label: const Text("Clear"),
                    onPressed: () {
                      setState(() {
                        selecategory = null;
                      });
                    },
                  ),
                ),
              ],
            ),
            Visibility(
              visible: selecategory != null,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("From \n\$ ${rangeValues.start.toInt()}"),
                    Expanded(
                      child: RangeSlider(
                        values: rangeValues,
                        divisions: 2000,
                        labels: RangeLabels(
                            rangeValues.start.toInt().toString(),
                            rangeValues.end.toInt().toString()),
                        min: 1,
                        max: 2000,
                        onChanged: (val) {
                          setState(() {
                            rangeValues = val;
                          });
                        },
                      ),
                    ),
                    Text("From \n\$ ${rangeValues.end.toInt()}"),
                  ],
                ),
              ),
            ),
            (selecategory != null)
                ? getproduct(
                    category: selecategory!,
                    name: selecategory!,
                    minimumvalue: rangeValues.start,
                    maximumvalue: rangeValues.end)
                : Column(
                    children: [
                      getproduct(category: "smartphones", name: "Smartphones"),
                      getproduct(category: "laptops", name: "Laptops"),
                      getproduct(category: "fragrances", name: "Fragrances"),
                      getproduct(category: "skincare", name: "Skincare"),
                      getproduct(category: "groceries", name: "Groceries"),
                      getproduct(
                          category: "home-decoration", name: "Home-Decoration"),
                      getproduct(category: "furniture", name: "Furniture"),
                      getproduct(category: "tops", name: "Tops"),
                      getproduct(
                          category: "womens-dresses", name: "Womens-Dresses"),
                      getproduct(
                          category: "womens-shoes", name: "Womens-Shoes"),
                      getproduct(category: "mens-shirts", name: "Mens-Shirts"),
                      getproduct(category: "mens-shoes", name: "Mens-Shoes"),
                      getproduct(
                          category: "mens-watches", name: "Mens-Watches"),
                      getproduct(
                          category: "womens-watches", name: "Womens-Watches"),
                      getproduct(category: "womens-bags", name: "Womens-Bags"),
                      getproduct(
                          category: "womens-jewellery",
                          name: "Womens-Jewellery"),
                      getproduct(category: "sunglasses", name: "Sunglasses"),
                      getproduct(category: "automotive", name: "Automotive"),
                      getproduct(category: "motorcycle", name: "Motorcycle"),
                      getproduct(category: "lighting", name: "Lighting"),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
