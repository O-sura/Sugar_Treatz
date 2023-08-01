import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/helper/cart_controller.dart';
import 'package:suger_treatz/helper/products_controller.dart';
import 'package:suger_treatz/helper/user_controller.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class DessertCard extends StatefulWidget {
  final int cardIndex;
  const DessertCard({
    Key? key,
    required this.cardIndex,
  }) : super(key: key);

  @override
  State<DessertCard> createState() => _DessertCardState();
}

class _DessertCardState extends State<DessertCard> {
  ProductController productController = Get.find();
  CartController cartController = Get.find();
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetX<ProductController>(
      builder: (controller) {
        return (controller.dessertList.isEmpty)
            ? Container(
                width: Dimensions.width300,
                height: Dimensions.height300,
                margin: EdgeInsets.all(Dimensions.width10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.height20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(2, 0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(0, -3),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(5, -3),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(0, -4),
                      ),
                    ]),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.pink.shade300,
                  ),
                ),
              )
            : Container(
                width: Dimensions.width300,
                height: Dimensions.height300,
                margin: EdgeInsets.all(Dimensions.width10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.height20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(2, 0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(0, -3),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(5, -3),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(0, -4),
                      ),
                    ]),
                child: Column(
                  children: [
                    Container(
                      width: Dimensions.width300,
                      height: Dimensions.height260,
                      //color: Colors.green.shade100,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              width: Dimensions.width300,
                              height: Dimensions.height250,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${controller.dessertList[widget.cardIndex].imagePath}"),
                                      fit: BoxFit.cover),
                                  color: Colors.pink.shade100,
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimensions.height20),
                                    topRight:
                                        Radius.circular(Dimensions.height20),
                                  )),
                            ),
                          ),
                          Positioned(
                              top: Dimensions.height10,
                              right: Dimensions.width10,
                              child: GestureDetector(
                                onTap: () {
                                  userController.addToFavourites(
                                      controller.dessertList[widget.cardIndex]);
                                },
                                onLongPress: () {
                                  Get.toNamed("/favourites");
                                },
                                child: Container(
                                  width: Dimensions.width50,
                                  height: Dimensions.height50,
                                  child: Center(
                                    child: Icon(
                                      (userController.isInFavoruites(controller
                                              .dessertList[widget.cardIndex]
                                              .name))
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: (userController.isInFavoruites(
                                              controller
                                                  .dessertList[widget.cardIndex]
                                                  .name))
                                          ? Colors.red
                                          : null,
                                      size: Dimensions.height24,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.height40),
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Text(
                      "${controller.dessertList[widget.cardIndex].name}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height24,
                      ),
                    ),
                    Text(
                      "Flaver: ${controller.dessertList[widget.cardIndex].flavor}",
                      style: TextStyle(
                        fontSize: Dimensions.height18,
                        color: Colors.black26,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: Dimensions.width30,
                        right: Dimensions.width20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${controller.dessertList[widget.cardIndex].price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.height20,
                              color: Colors.pink,
                            ),
                          ),
                          Container(
                            width: Dimensions.width40,
                            height: Dimensions.height40,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height20),
                              color: Colors.pink.shade100,
                            ),
                            child: Center(
                              child: IconButton(
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                  size: Dimensions.height22,
                                ),
                                onPressed: () {
                                  cartController.addToCart(
                                    cartController.createCartItemFromProduct(
                                      controller.dessertList[widget.cardIndex],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
