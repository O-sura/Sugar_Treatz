import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/helper/cart_controller.dart';
import 'package:suger_treatz/utils/dimensions.dart';
import 'package:suger_treatz/wigets/cart_item.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final cartController = Get.put(CartController());

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: Dimensions.height70,
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
          "Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: Dimensions.height24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
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
                Icons.more_vert,
                color: Colors.black,
                size: Dimensions.height30,
              ),
            ),
          ),
        ],
      ),
      body: GetX<CartController>(builder: (controller) {
        return Container(
          child: Column(
            children: [
              Container(
                height: Dimensions.height580,
                margin: EdgeInsets.only(
                  top: Dimensions.height40,
                ),
                child: ListView.builder(
                  itemCount: controller.cartList.length,
                  itemBuilder: (context, index) {
                    return CartItem(
                      index: index,
                      notifyParent: refresh,
                    );
                  },
                ),
              ),
              Expanded(
                // height: Dimensions.height250,
                // width: double.maxFinite,
                //color: Colors.amber,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: Dimensions.width340,
                      height: Dimensions.height200,
                      margin: EdgeInsets.only(
                        bottom: Dimensions.height30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.height20),
                          topRight: Radius.circular(Dimensions.height20),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subtotal",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.height20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$${controller.getSubTotal().toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: Colors.pink.shade400,
                                    fontSize: Dimensions.height20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.height20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$${controller.getDeliveryPrice().toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: Colors.pink.shade400,
                                    fontSize: Dimensions.height20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Fee",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.height24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$${cartController.getTotal().toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: Colors.pink.shade700,
                                    fontSize: Dimensions.height24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size(50, 30),
                      ),
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
                            "Checkout",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.height24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
