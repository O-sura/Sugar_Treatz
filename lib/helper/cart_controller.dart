import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/models/cart_item.dart';
import 'package:suger_treatz/models/product.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class CartController extends GetxController {
  var cartList = [].obs;

  isCartEmpty(Function notifyParent) {
    //(cartList.isEmpty) ? true : false;
    return cartList.isEmpty ? true : false;
  }

  CartItem createCartItemFromProduct(Product product) {
    return CartItem(
      name: product.name,
      flavor: product.flavor,
      price: product.price,
      count: 1,
      imagePath: product.imagePath,
    );
  }

  addToCart(CartItem cartItem) {
    bool isSelected = false;
    for (int i = 0; i < cartList.length; i++) {
      if (cartItem.name == cartList[i].name) {
        isSelected = true;
        break;
      }
    }
    if (isSelected) {
      Get.snackbar(
        "Adding to Cart",
        "Item can't be added",
        titleText: Text(
          "Item exists",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.height18,
          ),
        ),
        onTap: (snack) => {Get.toNamed("/cart")},
        messageText: Text(
          "Looks like this item already exists in your cart. Visit your cart if you need to change the quantity",
          style: TextStyle(
            fontSize: Dimensions.height16,
          ),
        ),
        isDismissible: true,
        icon: Icon(
          Icons.info_outline,
          color: Colors.red,
          size: Dimensions.height24,
        ),
      );
    } else {
      cartList.add(cartItem);
      Get.snackbar(
        "Adding to Cart",
        "Item added",
        titleText: Text(
          "Item added to the cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.height18,
          ),
        ),
        messageText: Text(
          "Press and Hold to vist your Cart",
          style: TextStyle(
            fontSize: Dimensions.height16,
          ),
        ),
        onTap: (snack) => {Get.toNamed("/cart")},
        isDismissible: true,
        icon: Icon(
          Icons.shopping_bag,
          color: Colors.blueAccent.shade700,
          size: Dimensions.height24,
        ),
      );
    }
  }

  double getSubTotal() {
    double subtotal = 0;
    for (int i = 0; i < cartList.length; i++) {
      subtotal += cartList[i].price * cartList[i].count;
    }
    return subtotal;
  }

  double getDeliveryPrice() {
    double delivery = getSubTotal() * 0.05;
    return delivery;
  }

  double getTotal() {
    return (getSubTotal() + getDeliveryPrice());
  }
}
