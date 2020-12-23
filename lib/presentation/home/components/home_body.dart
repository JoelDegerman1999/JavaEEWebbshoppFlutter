import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(10),
      child: Column(
        children: [
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(
                  margin: const EdgeInsets.only(right: 40),
                  color: Colors.blue.shade100,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Laptop",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Expanded(
            flex: 8,
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("MacBook"),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Asus ZenBook 14"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
