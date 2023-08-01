import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/helper/cart_controller.dart';
import 'package:suger_treatz/helper/products_controller.dart';
import 'package:suger_treatz/helper/user_controller.dart';
import 'package:suger_treatz/models/cart_item.dart';
import 'package:suger_treatz/models/product.dart';
import 'package:suger_treatz/utils/dimensions.dart';
import 'package:suger_treatz/wigets/counter.dart';
import 'package:suger_treatz/wigets/expandable_text.dart';
import 'package:suger_treatz/wigets/icon_and_text.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final counterKey = GlobalKey<CounterState>();
  //final productController = Get.put(ProductController());
  CartController cartController = Get.find();
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: Dimensions.height530,
            //color: Colors.amber,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Container(
                    width: Dimensions.width400,
                    height: Dimensions.height500,
                    decoration: BoxDecoration(
                      color: Colors.pink.shade200,
                      image: DecorationImage(
                          image: AssetImage("${Get.arguments["imagePath"]}"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(Dimensions.height30),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            size: Dimensions.height30,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          Product favProduct = Product(
                              name: Get.arguments["name"],
                              description: Get.arguments["description"],
                              flavor: Get.arguments["flavor"],
                              price: Get.arguments["price"],
                              imagePath: Get.arguments["imagePath"],
                              rating: Get.arguments["rating"],
                              reviewCount: Get.arguments["review_count"]);
                          userController.addToFavourites(favProduct);
                        },
                        child: Container(
                          width: Dimensions.width50,
                          height: Dimensions.height50,
                          padding: const EdgeInsets.all(0),
                          child: Center(
                            child: Icon(
                              Icons.favorite,
                              color: (userController
                                      .isInFavoruites(Get.arguments["name"]))
                                  ? Colors.red
                                  : null,
                              size: Dimensions.height24,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.height40),
                            color: Colors.white60,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: Dimensions.width10,
            ),
            child: Text(
              "${Get.arguments["name"]}",
              style: TextStyle(
                fontSize: Dimensions.height32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height05,
          ),
          Container(
            width: double.maxFinite,
            height: Dimensions.height40,
            margin: EdgeInsets.only(
              left: Dimensions.width75,
              right: Dimensions.width10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconAndText(
                  text: "${Get.arguments["rating"]}",
                  icon: Icons.star,
                  iconColor: Colors.amber,
                  iconSize: Dimensions.height24,
                  textSize: Dimensions.height20,
                ),
                IconAndText(
                  text: "${Get.arguments["review_count"]} Reviews",
                  icon: Icons.comment,
                  iconColor: Colors.black54,
                  textColor: Colors.black,
                  iconSize: Dimensions.height20,
                  textSize: Dimensions.height18,
                ),
                Counter(key: counterKey),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: Dimensions.height352,
            //color: Colors.amber.shade200,
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ExpandableText(
                      text: "${Get.arguments["description"]}",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: Dimensions.width420,
                    height: Dimensions.height100,
                    margin: EdgeInsets.only(
                      left: Dimensions.width40,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.height30)),
                    ),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width30,
                          right: Dimensions.width20,
                        ),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Dimensions.width50,
                            ),
                            Icon(
                              Icons.shopping_cart_rounded,
                              color: Colors.pink,
                              size: Dimensions.height50,
                            ),
                            SizedBox(
                              width: Dimensions.width30,
                            ),
                            TextButton(
                              onPressed: () {
                                CartItem newItem = CartItem(
                                    count: counterKey.currentState?.counter,
                                    name: Get.arguments["name"],
                                    imagePath: Get.arguments["imagePath"],
                                    flavor: Get.arguments["flavor"],
                                    price: Get.arguments["price"]);
                                cartController.addToCart(newItem);
                                //print(counterKey.currentState?.counter);
                              },
                              child: Container(
                                width: Dimensions.width200,
                                height: Dimensions.height50,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.height20),
                                ),
                                child: Center(
                                    child: Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.height20,
                                    color: Colors.white,
                                  ),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
