import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/models/product.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class UserController extends GetxController {
  var favList = [].obs;

  bool isInFavoruites(String name) {
    if (favList.isEmpty) return false;
    for (int i = 0; i < favList.length; i++) {
      if (name == favList[i].name) return true;
    }
    return false;
  }

  void addToFavourites(Product product) {
    bool isSelected = false;
    int i;
    for (i = 0; i < favList.length; i++) {
      if (product.name == favList[i].name) {
        isSelected = true;
        break;
      }
    }
    if (isSelected) {
      favList.removeAt(i);
      Get.snackbar(
        "Removing from favourites",
        "Item removed",
        titleText: Text(
          "Oops! Looks like a Wrong Choice",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.height18,
          ),
        ),
        onTap: (snack) => {Get.toNamed("/favourites")},
        messageText: Text(
          "Removed from your favourites list.You can add it back anytime if you wish.",
          style: TextStyle(
            fontSize: Dimensions.height16,
          ),
        ),
        isDismissible: true,
        icon: Icon(
          Icons.thumb_down_alt_outlined,
          color: Colors.black,
          size: Dimensions.height24,
        ),
      );
    } else {
      favList.add(product);
      Get.snackbar(
        "Adding to Fav List",
        "Item added",
        titleText: Text(
          "You loved it!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.height18,
          ),
        ),
        onTap: (snack) => {Get.toNamed("/favourites")},
        messageText: Text(
          "Item added to your favourites. Press and Hold to vist your Favourites List",
          style: TextStyle(
            fontSize: Dimensions.height16,
          ),
        ),
        isDismissible: true,
        icon: Icon(
          Icons.favorite,
          color: Colors.red,
          size: Dimensions.height24,
        ),
      );
    }
  }
}
