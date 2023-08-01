import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: Dimensions.height100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.height30,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.pinkAccent.shade200,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.pink.shade200,
                    ),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    Text(
                      "(Mark all as read)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.height20,
                        color: Colors.pink.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 0,
                mainAxisExtent: Dimensions.height120,
              ),
              itemBuilder: (context, index) {
                return NotificationTile();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatefulWidget {
  const NotificationTile({Key? key}) : super(key: key);

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.width10,
        right: Dimensions.width10,
        top: Dimensions.height20,
      ),
      width: Dimensions.deviceWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.circle,
            size: Dimensions.height18,
            color: Colors.blueAccent.shade700,
          ),
        ),
        title: Text(
          "Your password has been successfully changed.",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: Dimensions.height20,
            color: Colors.black,
          ),
        ),
        subtitle: Padding(
            padding: EdgeInsets.only(top: Dimensions.height10),
            child: Text(
              "16 May 2022 at 18:33 PM",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: Dimensions.height14,
              ),
            )),
        trailing: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: Dimensions.height30,
          backgroundImage: AssetImage("assets/img/lock.jpg"),
        ),
      ),
    );
  }
}
