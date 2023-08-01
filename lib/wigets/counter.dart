import 'package:flutter/material.dart';
import 'package:suger_treatz/utils/dimensions.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width100,
      height: Dimensions.height40,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (counter > 1) counter--;
              });
            },
            child: Container(
              width: Dimensions.width24,
              height: Dimensions.height24,
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(Dimensions.height20),
              ),
              child: Center(
                child: Text(
                  "-",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.height20,
                      color: Colors.pink),
                ),
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.height10,
          ),
          Container(
            width: Dimensions.width20,
            height: Dimensions.height20,
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.height05),
            ),
            child: Center(
              child: Text(
                (counter < 10) ? "0" + counter.toString() : counter.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade400,
                  fontSize: Dimensions.height16,
                ),
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.width10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                counter++;
              });
            },
            child: Container(
              width: Dimensions.width24,
              height: Dimensions.height24,
              decoration: BoxDecoration(
                color: Colors.pink.shade400,
                borderRadius: BorderRadius.circular(Dimensions.height20),
              ),
              child: Center(
                child: Text(
                  "+",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.height16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
