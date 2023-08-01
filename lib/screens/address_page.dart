import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: Dimensions.height80,
              width: Dimensions.deviceWidth,
              margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: Dimensions.width70,
                      height: Dimensions.height50,
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius:
                              BorderRadius.circular(Dimensions.height50)),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width24,
                  ),
                  Text(
                    "Tell Us Where You Are?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.height27,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Container(
            width: Dimensions.deviceWidth,
            height: Dimensions.height380,
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              image: const DecorationImage(
                image: AssetImage("assets/img/map.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height70,
                left: Dimensions.width30,
                right: Dimensions.width30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: (Dimensions.deviceHeight < 600)
                        ? Dimensions.height40
                        : null,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "House Number",
                        hintStyle: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: Dimensions.height18,
                        ),
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.pink,
                          size: Dimensions.height24,
                        ),
                        focusColor: Colors.pink,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.pink),
                        ),
                      ),
                      showCursor: false,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                    height: (Dimensions.deviceHeight < 600)
                        ? Dimensions.height40
                        : null,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Street",
                        hintStyle: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: Dimensions.height18,
                        ),
                        icon: Icon(
                          Icons.add_road,
                          color: Colors.pink,
                          size: Dimensions.height24,
                        ),
                        focusColor: Colors.pink,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.pink),
                        ),
                      ),
                      showCursor: false,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                    height: (Dimensions.deviceHeight < 600)
                        ? Dimensions.height40
                        : null,
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: Dimensions.height18,
                        ),
                        icon: Icon(
                          Icons.location_city_outlined,
                          color: Colors.pink,
                          size: Dimensions.height24,
                        ),
                        hintText: "City",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                    height: (Dimensions.deviceHeight < 600)
                        ? Dimensions.height40
                        : null,
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: Dimensions.height18,
                        ),
                        icon: Icon(
                          Icons.phone,
                          color: Colors.pink,
                          size: Dimensions.height24,
                        ),
                        hintText: "Contact Number",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height40,
                  ),
                  TextButton(
                    child: Container(
                      width: Dimensions.deviceWidth,
                      height: Dimensions.height60,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius:
                            BorderRadius.circular(Dimensions.height40),
                      ),
                      child: Center(
                        child: Text(
                          "Save My Address",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.height20,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
