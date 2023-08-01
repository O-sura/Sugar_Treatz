import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class TabbarChild extends StatefulWidget {
  final IconData icon;
  final String tabname;
  final int index;
  const TabbarChild(
      {Key? key,
      required this.icon,
      required this.tabname,
      required this.index})
      : super(key: key);

  @override
  State<TabbarChild> createState() => _TabbarChildState();
}

class _TabbarChildState extends State<TabbarChild> {
  TabController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        width: Dimensions.width120,
        height: Dimensions.height80,
        child: Row(
          children: [
            Container(
              width: Dimensions.width40,
              height: Dimensions.height40,
              decoration: BoxDecoration(
                color: (controller.index == widget.index)
                    ? Colors.white
                    : Colors.pink.shade50,
                borderRadius: BorderRadius.circular(Dimensions.height40),
              ),
              child: Center(
                child: Icon(
                  widget.icon,
                  size: Dimensions.height27,
                  color: Colors.pink.shade400,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Text(
              widget.tabname,
              style: TextStyle(
                color: (controller.index == widget.index)
                    ? Colors.white
                    : Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.height16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
