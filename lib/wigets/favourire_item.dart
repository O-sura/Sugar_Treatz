import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/helper/cart_controller.dart';
import 'package:suger_treatz/models/product.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class FavItem extends StatefulWidget {
  final Product favproduct;
  FavItem({Key? key, required this.favproduct}) : super(key: key);

  @override
  State<FavItem> createState() => _FavItemState();
}

class _FavItemState extends State<FavItem> {
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/product-detail", arguments: {
          "name": widget.favproduct.name,
          "imagePath": widget.favproduct.imagePath,
          "rating": widget.favproduct.rating,
          "review_count": widget.favproduct.reviewCount,
          "description": widget.favproduct.description,
          "price": widget.favproduct.price,
          "flavor": widget.favproduct.flavor,
        });
      },
      child: Container(
        width: Dimensions.width300,
        height: Dimensions.height180,
        margin: EdgeInsets.only(
          bottom: Dimensions.height20,
          left: Dimensions.width40,
          right: Dimensions.width40,
        ),
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.circular(Dimensions.height20),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: Dimensions.width150,
                height: Dimensions.height150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Dimensions.height20,
                    ),
                    bottomRight: Radius.circular(
                      Dimensions.height20,
                    ),
                  ),
                  image: DecorationImage(
                      image: AssetImage(widget.favproduct.imagePath),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              right: Dimensions.width20,
              top: Dimensions.height30,
              child: Container(
                height: Dimensions.height150,
                width: Dimensions.width220,
                child: Column(
                  children: [
                    Text(
                      widget.favproduct.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Dimensions.height18,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height05,
                    ),
                    Text(
                      "Flaver: ${widget.favproduct.flavor}",
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
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${widget.favproduct.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.height20,
                              color: Colors.pink,
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          GestureDetector(
                            onTap: () {
                              cartController.addToCart(
                                  cartController.createCartItemFromProduct(
                                      widget.favproduct));
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
                                    fontSize: Dimensions.height14),
                              )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
