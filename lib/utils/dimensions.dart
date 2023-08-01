import 'package:get/get.dart';

// double deviceHeight = Get.context!.height; //965.3333333333334
// double deviceWidth = Get.context!.width; //480.0

double widthFactorFinder(int width) {
  return (480 / width);
}

double heightFactorFinder(int height) {
  return (965.34 / height);
}

class Dimensions {
  static double deviceHeight = Get.context!.height; //965.3333333333334
  static double deviceWidth = Get.context!.width; //480.0

  // Factor = deviceHeight/widgetHeight or deviceWidth/widgetWidth
  //When defining heights, devide screenHeight or Width with the relevant factor
  //obtained using the Factor formula

  //heights
  static double height05 = deviceHeight / heightFactorFinder(5);
  static double height10 = deviceHeight / heightFactorFinder(10);
  static double height14 = deviceHeight / heightFactorFinder(14);
  static double height15 = deviceHeight / heightFactorFinder(15);
  static double height16 = deviceHeight / heightFactorFinder(16);
  static double height18 = deviceHeight / heightFactorFinder(18);
  static double height20 = deviceHeight / heightFactorFinder(20);
  static double height22 = deviceHeight / heightFactorFinder(22);
  static double height24 = deviceHeight / heightFactorFinder(24);
  static double height26 = deviceHeight / heightFactorFinder(26);
  static double height25 = deviceHeight / heightFactorFinder(25);
  static double height27 = deviceHeight / heightFactorFinder(27);
  static double height30 = deviceHeight / heightFactorFinder(30);
  static double height32 = deviceHeight / heightFactorFinder(32);
  static double height35 = deviceHeight / heightFactorFinder(35);
  static double height40 = deviceHeight / heightFactorFinder(40);
  static double height50 = deviceHeight / heightFactorFinder(50);
  static double height55 = deviceHeight / heightFactorFinder(55);
  static double height60 = deviceHeight / heightFactorFinder(60);
  static double height70 = deviceHeight / heightFactorFinder(70);
  static double height75 = deviceHeight / heightFactorFinder(75);
  static double height80 = deviceHeight / heightFactorFinder(80);
  static double height100 = deviceHeight / heightFactorFinder(100);
  static double height110 = deviceHeight / heightFactorFinder(110);
  static double height120 = deviceHeight / heightFactorFinder(120);
  static double height150 = deviceHeight / heightFactorFinder(150);
  static double height180 = deviceHeight / heightFactorFinder(180);
  static double height200 = deviceHeight / heightFactorFinder(200);
  static double height250 = deviceHeight / heightFactorFinder(250);
  static double height260 = deviceHeight / heightFactorFinder(260);
  static double height280 = deviceHeight / heightFactorFinder(280);
  static double height300 = deviceHeight / heightFactorFinder(300);
  static double height320 = deviceHeight / heightFactorFinder(320);
  static double height352 = deviceHeight / heightFactorFinder(352);
  static double height380 = deviceHeight / heightFactorFinder(380);
  static double height400 = deviceHeight / heightFactorFinder(400);
  static double height500 = deviceHeight / heightFactorFinder(500);
  static double height530 = deviceHeight / heightFactorFinder(530);
  static double height580 = deviceHeight / heightFactorFinder(580);
  static double height600 = deviceHeight / heightFactorFinder(600);
  static double height730 = deviceHeight / heightFactorFinder(730);

  //widths
  static double width05 = deviceWidth / widthFactorFinder(5);
  static double width10 = deviceWidth / widthFactorFinder(10);
  static double width15 = deviceWidth / widthFactorFinder(15);
  static double width20 = deviceWidth / widthFactorFinder(20);
  static double width24 = deviceWidth / widthFactorFinder(24);
  static double width30 = deviceWidth / widthFactorFinder(30);
  static double width40 = deviceWidth / widthFactorFinder(40);
  static double width50 = deviceWidth / widthFactorFinder(50);
  static double width70 = deviceWidth / widthFactorFinder(70);
  static double width75 = deviceWidth / widthFactorFinder(75);
  static double width80 = deviceWidth / widthFactorFinder(80);
  static double width100 = deviceWidth / widthFactorFinder(100);
  static double width110 = deviceWidth / widthFactorFinder(110);
  static double width120 = deviceWidth / widthFactorFinder(120);
  static double width150 = deviceWidth / widthFactorFinder(150);
  static double width180 = deviceWidth / widthFactorFinder(180);
  static double width200 = deviceWidth / widthFactorFinder(200);
  static double width220 = deviceWidth / widthFactorFinder(220);
  static double width250 = deviceWidth / widthFactorFinder(250);
  static double width290 = deviceWidth / widthFactorFinder(290);
  static double width300 = deviceWidth / widthFactorFinder(300);
  static double width340 = deviceWidth / widthFactorFinder(340);
  static double width380 = deviceWidth / widthFactorFinder(380);
  static double width400 = deviceWidth / widthFactorFinder(400);
  static double width420 = deviceWidth / widthFactorFinder(420);
}
