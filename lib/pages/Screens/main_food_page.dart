// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/dimentions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../../home/food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key});

  @override
  State<MainFoodPage> createState() => MainFoodPageState();
}

class MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Bigtext(
                            text: "Malaysia",
                            color: const Color(0xFF26A69A),
                            size: 30),
                        Row(
                          children: [
                            SmallText(
                                text: "Negeri Sembilan",
                                color: const Color(0xFF004D40),
                                size: 25),
                            const Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.height45,
                        height: Dimensions.height45,
                        child: Icon(Icons.search,
                            color: Colors.black, size: Dimensions.iconSize24),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: const Color(0xFF00897B),
                        ),
                      ),
                    )
                  ],
                )),
          ),
          //showing the body
          const Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
