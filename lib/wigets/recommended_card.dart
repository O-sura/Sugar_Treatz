import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/helper/cart_controller.dart';
import 'package:suger_treatz/helper/products_controller.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class RecommendedCard extends StatelessWidget {
  final int index;
  RecommendedCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  ProductController productController = Get.find();
  CartController cartController = Get.find();

  Widget build(BuildContext context) {
    return GetX<ProductController>(builder: (controller) {
      return Stack(children: [
        Container(
          width: Dimensions.width340,
          height: Dimensions.height120,
          margin: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            right: Dimensions.width10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.height20),
            color: Colors.pink.shade100,
          ),
        ),
        Positioned(
          top: Dimensions.height10,
          child: Container(
            width: Dimensions.width110,
            height: Dimensions.height110,
            decoration: BoxDecoration(
                color: Colors.amber.shade300,
                borderRadius: BorderRadius.circular(Dimensions.height10),
                image: DecorationImage(
                  image: AssetImage(
                      "${controller.recommendedList[index].imagePath}"),
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          right: Dimensions.width10,
          top: Dimensions.height50,
          child: Column(
            children: [
              Text(
                "${controller.recommendedList[index].name}",
                style: TextStyle(
                  fontSize: Dimensions.height18,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Flaver: ${controller.recommendedList[index].flavor}",
                style: TextStyle(
                  fontSize: Dimensions.height14,
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
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
                      "\$${controller.recommendedList[index].price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height20,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width30,
                    ),
                    GestureDetector(
                      onTap: () {
                        cartController.addToCart(
                          cartController.createCartItemFromProduct(
                            controller.recommendedList[index],
                          ),
                        );
                      },
                      child: Container(
                        width: Dimensions.width80,
                        height: Dimensions.height30,
                        margin: EdgeInsets.only(
                          top: Dimensions.height05,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.height40),
                          color: Colors.pink,
                        ),
                        child: Center(
                            child: Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.height14,
                          ),
                        )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ]);
    });
  }
}
