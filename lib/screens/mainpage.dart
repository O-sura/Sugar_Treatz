import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/helper/cart_controller.dart';
import 'package:suger_treatz/helper/products_controller.dart';
import 'package:suger_treatz/helper/user_controller.dart';
import 'package:suger_treatz/utils/dimensions.dart';
import 'package:suger_treatz/wigets/coockiecard.dart';
import 'package:suger_treatz/wigets/dessertcard.dart';
import 'package:suger_treatz/wigets/drinks.dart';
import 'package:suger_treatz/wigets/itemcard.dart';
import 'package:suger_treatz/wigets/recommended_card.dart';
import 'package:suger_treatz/wigets/tabbar_child.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  ProductController productController = Get.put(ProductController());
  CartController cartController = Get.put(CartController());
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    TabController _tabController =
        Get.put(TabController(vsync: this, length: 4));
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        Get.toNamed("/profile");
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(),
          child: Column(
            //Column that holds the whole page
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                //For the top spacing
                height: Dimensions.height70,
              ),
              Container(
                //For the top section of the page
                width: double.maxFinite,
                height: Dimensions.height150,
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        //Title text holder
                        height: Dimensions.height300,
                        width: Dimensions.width220,
                        //color: Colors.amber,
                        child: Column(
                          //Title text
                          children: [
                            Text(
                              "Will you have",
                              style: TextStyle(
                                fontSize: Dimensions.height35,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink.shade400,
                              ),
                            ),
                            Text(
                              "some more",
                              style: TextStyle(
                                fontSize: Dimensions.height35,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            Text(
                              "Cake?",
                              style: TextStyle(
                                fontSize: Dimensions.height35,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/search");
                        },
                        child: Container(
                          height: Dimensions.height50,
                          width: Dimensions.width50,
                          margin: EdgeInsets.only(
                            top: Dimensions.height40,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.height40),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 4,
                                spreadRadius: 4,
                                offset: Offset.fromDirection(0, 0),
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                            size: Dimensions.height30,
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Container(
                width: double.maxFinite,
                height: Dimensions.height70,
                margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                child: TabBar(
                  onTap: ((value) {
                    setState(() {});
                  }),
                  isScrollable: true,
                  indicator: BoxDecoration(
                    color: Colors.pink.shade400,
                    borderRadius: BorderRadius.circular(Dimensions.height40),
                  ),
                  controller: _tabController,
                  tabs: [
                    TabbarChild(
                      icon: Icons.cake_outlined,
                      tabname: "Cakes",
                      index: 0,
                    ),
                    TabbarChild(
                      icon: Icons.fastfood,
                      tabname: "Cookies",
                      index: 1,
                    ),
                    TabbarChild(
                      icon: Icons.local_drink_sharp,
                      tabname: "Drinks",
                      index: 2,
                    ),
                    TabbarChild(
                      icon: Icons.icecream_outlined,
                      tabname: "Desserts",
                      index: 3,
                    ),
                  ],
                  labelColor: Colors.black,
                  labelStyle: TextStyle(color: Colors.white),
                  //unselectedLabelColor: Colors.grey,
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              GetX<ProductController>(builder: (controller) {
                return Container(
                  width: double.maxFinite,
                  height: Dimensions.height380,
                  //color: Colors.amber,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: ItemCard(cardIndex: index),
                              onTap: () {
                                Get.toNamed(
                                  "/product-detail",
                                  arguments: {
                                    "name": controller.cakeList[index].name,
                                    "imagePath":
                                        controller.cakeList[index].imagePath,
                                    "rating": controller.cakeList[index].rating,
                                    "review_count":
                                        controller.cakeList[index].reviewCount,
                                    "description":
                                        controller.cakeList[index].description,
                                    "price": controller.cakeList[index].price,
                                    "flavor": controller.cakeList[index].flavor,
                                  },
                                );
                              },
                            );
                          },
                          itemCount: controller.cakeList.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: CookieCard(
                                cardIndex: index,
                              ),
                              onTap: () {
                                Get.toNamed(
                                  "/product-detail",
                                  arguments: {
                                    "name": controller.cookieList[index].name,
                                    "imagePath":
                                        controller.cookieList[index].imagePath,
                                    "rating":
                                        controller.cookieList[index].rating,
                                    "review_count": controller
                                        .cookieList[index].reviewCount,
                                    "description": controller
                                        .cookieList[index].description,
                                    "price": controller.cookieList[index].price,
                                    "flavor":
                                        controller.cookieList[index].flavor,
                                  },
                                );
                              },
                            );
                          },
                          itemCount: controller.cookieList.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: DrinkCard(
                                cardIndex: index,
                              ),
                              onTap: () {
                                Get.toNamed(
                                  "/product-detail",
                                  arguments: {
                                    "name": controller.drinkList[index].name,
                                    "imagePath":
                                        controller.drinkList[index].imagePath,
                                    "rating":
                                        controller.drinkList[index].rating,
                                    "review_count":
                                        controller.drinkList[index].reviewCount,
                                    "description":
                                        controller.drinkList[index].description,
                                    "price": controller.drinkList[index].price,
                                    "flavor":
                                        controller.drinkList[index].flavor,
                                  },
                                );
                              },
                            );
                          },
                          itemCount: controller.drinkList.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: DessertCard(
                                cardIndex: index,
                              ),
                              onTap: () {
                                Get.toNamed(
                                  "/product-detail",
                                  arguments: {
                                    "name": controller.dessertList[index].name,
                                    "imagePath":
                                        controller.dessertList[index].imagePath,
                                    "rating":
                                        controller.dessertList[index].rating,
                                    "review_count": controller
                                        .dessertList[index].reviewCount,
                                    "description": controller
                                        .dessertList[index].description,
                                    "price":
                                        controller.dessertList[index].price,
                                    "flavor":
                                        controller.dessertList[index].flavor,
                                  },
                                );
                              },
                            );
                          },
                          itemCount: controller.dessertList.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(
                height: Dimensions.height20,
              ),
              Container(
                margin: EdgeInsets.only(left: Dimensions.width30),
                child: Text(
                  "Recommended",
                  style: TextStyle(
                    fontSize: Dimensions.height27,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade600,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              GetX<ProductController>(builder: (controller) {
                return Container(
                  height: Dimensions.height180,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: RecommendedCard(
                          index: index,
                        ),
                        onTap: () {
                          Get.toNamed(
                            "/product-detail",
                            arguments: {
                              "name": controller.recommendedList[index].name,
                              "imagePath":
                                  controller.recommendedList[index].imagePath,
                              "rating":
                                  controller.recommendedList[index].rating,
                              "review_count":
                                  controller.recommendedList[index].reviewCount,
                              "description":
                                  controller.recommendedList[index].description,
                              "price": controller.recommendedList[index].price,
                            },
                          );
                        },
                      );
                    },
                    itemCount: controller.recommendedList.length,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
