import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/helper/auth_controller.dart';
import 'package:suger_treatz/screens/signin_page.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPass = false;
  bool toggleShowPass() {
    showPass = !showPass;
    return showPass;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: Dimensions.height500,
                width: Dimensions.deviceWidth,
                decoration: BoxDecoration(
                  color: Colors.pink.shade800,
                  image: DecorationImage(
                      image: AssetImage("assets/img/donut.jpg"),
                      fit: BoxFit.cover,
                      opacity: 0.3),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: Dimensions.height35,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height100,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        child: Text(
                          "Create\nAccount",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Bangers",
                            fontSize: Dimensions.height75,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: Dimensions.height30,
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
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: Dimensions.height18,
                          ),
                          icon: Icon(
                            Icons.person_outline_rounded,
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
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: Dimensions.height18,
                          ),
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.pink,
                            size: Dimensions.height24,
                          ),
                          focusColor: Colors.pink,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.pink),
                          ),
                          suffixIcon: Icon(
                            Icons.check,
                            size: Dimensions.height24,
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
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: Dimensions.height18,
                            ),
                            icon: Icon(
                              Icons.lock_outlined,
                              color: Colors.pink,
                              size: Dimensions.height24,
                            ),
                            hintText: "Password",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.pink),
                            ),
                            suffixIcon: IconButton(
                              icon: (!showPass)
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.pinkAccent,
                                      size: Dimensions.height24,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.pinkAccent,
                                      size: Dimensions.height24,
                                    ),
                              onPressed: () {
                                toggleShowPass();
                                setState(() {});
                              },
                            )),
                        obscureText: !showPass,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
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
                            "Register Me",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.height16,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        AuthController.instance.registerUserwithEmailnPassword(
                            emailController.text.trim(),
                            passwordController.text.trim());
                      },
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                        thickness: 1,
                      )),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                        ),
                        child: Text("OR",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.height16,
                            )),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 1,
                      )),
                    ]),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    TextButton(
                      child: Container(
                        width: Dimensions.deviceWidth,
                        height: Dimensions.height60,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.height40),
                          border: Border.all(
                            width: 2.0,
                            color: Colors.pink.shade400,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Already Have an Account",
                            style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.height16,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.offAll(SignInPage());
                      },
                    ),
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

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height - 50);
    var firstEnd = Offset(size.width / 2.5, size.height - 50.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var mid = Offset(size.width - (size.width / 2.9), size.height - 50);
    var secondStart = Offset(size.width - (size.width / 6), size.height - 20);
    path.quadraticBezierTo(mid.dx, mid.dy, secondStart.dx, secondStart.dy);
    var secondMid = Offset(size.width * 0.97, size.height);
    var SecondEnd = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(
        secondMid.dx, secondMid.dy, SecondEnd.dx, SecondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
