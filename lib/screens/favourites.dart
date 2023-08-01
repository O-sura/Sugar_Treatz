import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/helper/cart_controller.dart';
import 'package:suger_treatz/helper/user_controller.dart';
import 'package:suger_treatz/utils/dimensions.dart';
import 'package:suger_treatz/wigets/favourire_item.dart';

class Favourites extends StatefulWidget {
  Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: Dimensions.height80,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
            size: Dimensions.height30,
          ),
        ),
        title: Text(
          "Favourites",
          style: TextStyle(
            color: Colors.black,
            fontSize: Dimensions.height24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: Dimensions.width20,
            ),
            child: GestureDetector(
              onTap: () {
                Get.toNamed("/search");
              },
              child: Icon(
                Icons.search,
                size: Dimensions.height30,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed("/cart");
            },
            child: Stack(
              children: [
                Container(
                  height: Dimensions.height50,
                  width: Dimensions.width50,
                  margin: EdgeInsets.only(
                    top: Dimensions.height15,
                    bottom: Dimensions.height15,
                    right: Dimensions.width10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.height40),
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
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                    size: Dimensions.height30,
                  ),
                ),
                GetX<CartController>(builder: (controller) {
                  return Visibility(
                    visible: controller.cartList.isNotEmpty,
                    child: Positioned(
                        top: Dimensions.height15,
                        right: Dimensions.width15,
                        child: Container(
                          width: Dimensions.width10,
                          height: Dimensions.height10,
                          decoration: BoxDecoration(
                              color: Colors.orange.shade800,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height05),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.orange,
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0)
                              ]),
                        )),
                  );
                })
              ],
            ),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: Dimensions.height730,
              margin: EdgeInsets.only(
                top: Dimensions.height40,
              ),
              child: ListView.builder(
                itemCount: userController.favList.length,
                itemBuilder: (context, index) {
                  return FavItem(favproduct: userController.favList[index]);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Get.toNamed("/");
                },
                child: Container(
                  width: Dimensions.width380,
                  height: Dimensions.height70,
                  margin: EdgeInsets.only(
                    bottom: Dimensions.height10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(
                      Dimensions.height20,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Find More",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.height24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
