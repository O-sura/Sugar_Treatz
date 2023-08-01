import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/helper/auth_controller.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final List<IconData> iconDataSet = [
    Icons.person_outline,
    Icons.pin_drop_outlined,
    Icons.list_alt_outlined,
    Icons.notifications_outlined,
    Icons.settings_outlined,
    Icons.logout_outlined
  ];

  final List TitleData = [
    "Edit Profile",
    "Shopping Address",
    "Order History",
    "Notifications",
    "Settings",
    "Log Out",
  ];

  final NavigateRouteList = [
    "user-profile",
    "address",
    "order-history",
    "notifications",
    "settings",
    "logout"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.pink.shade300,
              Colors.pink.shade500,
              Colors.pink.shade900,
            ],
          ),
        ),
        child: Expanded(
          child: Container(
            margin: EdgeInsets.only(
                left: Dimensions.width40, right: Dimensions.width20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.height80,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: Dimensions.height35,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      width: Dimensions.width100,
                    ),
                    Text(
                      "Suger Treatz",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.height35,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Bangers",
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimensions.height40,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: Dimensions.height75,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: Dimensions.height70,
                        backgroundImage:
                            AssetImage("assets/img/profile_pic.jpg"),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width40,
                    ),
                    Column(
                      children: [
                        Text(
                          "Tessa Fowler",
                          style: TextStyle(
                            fontSize: Dimensions.height26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "tessa.fow@gmail.com",
                          style: TextStyle(
                            fontSize: Dimensions.height16,
                            color: Colors.white60,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Expanded(
                  child: Container(
                    height: Dimensions.height600,
                    width: double.maxFinite,
                    child: ListView.builder(
                      itemCount: 6,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: (Dimensions.deviceHeight < 700)
                              ? null
                              : EdgeInsets.only(bottom: Dimensions.height30),
                          child: ListTile(
                            horizontalTitleGap: Dimensions.width20,
                            onTap: () {
                              (NavigateRouteList[index] == "logout")
                                  ? AuthController.instance.signOut()
                                  : Get.toNamed("/${NavigateRouteList[index]}");
                            },
                            leading: Container(
                              width: Dimensions.width50,
                              height: Dimensions.height50,
                              padding: EdgeInsets.all(Dimensions.width10),
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height15),
                              ),
                              child: Center(
                                child: Icon(
                                  iconDataSet[index],
                                  color: Colors.white54,
                                  size: Dimensions.height24,
                                ),
                              ),
                            ),
                            title: Text(
                              TitleData[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.height16,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
