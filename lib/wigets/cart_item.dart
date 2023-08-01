import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/helper/cart_controller.dart';
import 'package:suger_treatz/utils/dimensions.dart';
import 'package:suger_treatz/wigets/counter.dart';

class CartItem extends StatefulWidget {
  final int index;
  final Function() notifyParent;
  CartItem({
    Key? key,
    required this.index,
    required this.notifyParent,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  CartController cartController = Get.find();

  Widget build(BuildContext context) {
    return GetX<CartController>(builder: (controller) {
      return Container(
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
                      image: AssetImage(
                          "${controller.cartList[widget.index].imagePath}"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              right: Dimensions.width10,
              top: Dimensions.height20,
              child: Container(
                height: Dimensions.height150,
                width: Dimensions.width250,
                child: Column(
                  children: [
                    Text(
                      "${controller.cartList[widget.index].name}",
                      style: TextStyle(
                        fontSize: Dimensions.height18,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Flaver: ${controller.cartList[widget.index].flavor}",
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
                            "\$${controller.cartList[widget.index].price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.height20,
                              color: Colors.pink,
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width30,
                          ),
                          Container(
                            width: Dimensions.width100,
                            height: Dimensions.height40,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (controller
                                            .cartList[widget.index].count >
                                        1) {
                                      controller.cartList[widget.index].count--;
                                    }
                                    setState(() {});
                                    widget.notifyParent();
                                  },
                                  child: Container(
                                    width: Dimensions.width24,
                                    height: Dimensions.height24,
                                    decoration: BoxDecoration(
                                      color: Colors.pink.shade100,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.height20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimensions.height20,
                                            color: Colors.pink),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.height10,
                                ),
                                Container(
                                  width: Dimensions.width20,
                                  height: Dimensions.height20,
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.height05),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${controller.cartList[widget.index].count.toString()}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink.shade400,
                                        fontSize: Dimensions.height16,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    controller.cartList[widget.index].count++;
                                    widget.notifyParent();
                                  },
                                  child: Container(
                                    width: Dimensions.width24,
                                    height: Dimensions.height24,
                                    decoration: BoxDecoration(
                                      color: Colors.pink.shade400,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.height20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Dimensions.height16,
                                          color: Colors.white,
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
                    ),
                    SizedBox(
                      height: Dimensions.height05,
                    ),
                    SizedBox(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size(50, 30),
                        ),
                        onPressed: () {
                          controller.cartList.removeAt(widget.index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(0),
                          width: Dimensions.width180,
                          height: Dimensions.height30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.pink,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                              Dimensions.height10,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete_outline_outlined,
                                  color: Colors.pink,
                                  size: Dimensions.height24,
                                ),
                                SizedBox(
                                  width: Dimensions.width05,
                                ),
                                Text(
                                  "Remove from Cart",
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: Dimensions.height14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
