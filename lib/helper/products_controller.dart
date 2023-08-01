import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/models/product.dart';

class ProductController extends GetxController {
  var cakeList = [].obs;
  var cookieList = [].obs;
  var drinkList = [].obs;
  var dessertList = [].obs;
  var allProducts = [].obs;
  var recommendedList = [].obs;

  Future<void> readfromCakesJson() async {
    final String response =
        await rootBundle.loadString("assets/json/cake_details.json");
    final data = await json.decode(response);
    for (int i = 0; i < data.length; i++) {
      cakeList.add(
        Product(
          name: data[i]["name"],
          description: data[i]["description"],
          flavor: data[i]["flavor"],
          price: data[i]["price"],
          imagePath: data[i]["img_src"],
          rating: data[i]["rating"],
          reviewCount: data[i]["review_count"],
        ),
      );
    }
  }

  Future<void> readfromCookiesJson() async {
    final String response =
        await rootBundle.loadString("assets/json/cookie_details.json");
    final data = await json.decode(response);
    for (int i = 0; i < data.length; i++) {
      cookieList.add(
        Product(
          name: data[i]["name"],
          description: data[i]["description"],
          flavor: data[i]["flavor"],
          price: data[i]["price"],
          imagePath: data[i]["img_src"],
          rating: data[i]["rating"],
          reviewCount: data[i]["review_count"],
        ),
      );
    }
  }

  Future<void> readfromDrinksJson() async {
    final String response =
        await rootBundle.loadString("assets/json/drinks_details.json");
    final data = await json.decode(response);
    for (int i = 0; i < data.length; i++) {
      drinkList.add(
        Product(
          name: data[i]["name"],
          description: data[i]["description"],
          flavor: data[i]["flavor"],
          price: data[i]["price"],
          imagePath: data[i]["img_src"],
          rating: data[i]["rating"],
          reviewCount: data[i]["review_count"],
        ),
      );
    }
  }

  Future<void> readfromDessertsJson() async {
    final String response =
        await rootBundle.loadString("assets/json/dessert_details.json");
    final data = await json.decode(response);
    for (int i = 0; i < data.length; i++) {
      dessertList.add(
        Product(
          name: data[i]["name"],
          description: data[i]["description"],
          flavor: data[i]["flavor"],
          price: data[i]["price"],
          imagePath: data[i]["img_src"],
          rating: data[i]["rating"],
          reviewCount: data[i]["review_count"],
        ),
      );
    }
  }

  Future<void> readfromRecommendedJson() async {
    final String response =
        await rootBundle.loadString("assets/json/recommended.json");
    final data = await json.decode(response);
    for (int i = 0; i < data.length; i++) {
      recommendedList.add(
        Product(
          name: data[i]["name"],
          description: data[i]["description"],
          flavor: data[i]["flavor"],
          price: data[i]["price"],
          imagePath: data[i]["img_src"],
          rating: data[i]["rating"],
          reviewCount: data[i]["review_count"],
        ),
      );
    }
  }

  loadAllProducts() {
    allProducts.addAll(cakeList);
    allProducts.addAll(cookieList);
    allProducts.addAll(drinkList);
    allProducts.addAll(dessertList);
  }

  @override
  onInit() async {
    await Future.delayed(Duration(seconds: 2));
    readfromCakesJson();
    readfromCookiesJson();
    readfromDrinksJson();
    readfromDessertsJson();
    readfromRecommendedJson();
    super.onInit();
  }
}
