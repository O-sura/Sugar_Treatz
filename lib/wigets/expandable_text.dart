import 'package:flutter/material.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstPart;
  late String secondPart;

  bool isHidden = true;

  final double textHeight = Dimensions.deviceHeight / 4.3879;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstPart = widget.text.substring(0, textHeight.toInt());
      secondPart =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstPart = widget.text;
      secondPart = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.width70,
        right: Dimensions.width20,
      ),
      child: (secondPart.isEmpty)
          ? Text(firstPart)
          : Column(
              children: [
                SizedBox(
                  height: Dimensions.height20,
                ),
                Text(
                  (isHidden) ? firstPart + "..." : firstPart + secondPart,
                  style: TextStyle(
                    fontSize: Dimensions.height16,
                    color: Colors.black54,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        (isHidden) ? "Show more" : "Show less",
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: Dimensions.height14,
                        ),
                      ),
                      Icon(
                        (isHidden)
                            ? Icons.keyboard_arrow_down_rounded
                            : Icons.keyboard_arrow_up_rounded,
                        color: Colors.pink,
                        size: Dimensions.height16,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
