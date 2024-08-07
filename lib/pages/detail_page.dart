import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/constants/size.dart';
import 'package:sushi/constants/theme.dart';

import 'package:sushi/screen/menu_screen.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.giant * 4, vertical: Sizes.giant * 2),
                  child: food.image,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Sizes.giant * 1.3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                          ),
                          const SizedBox(
                            width: Sizes.small,
                          ),
                          Text(
                            food.rating,
                          )
                        ],
                      ),
                      Text(food.name,
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: Sizes.extraLarge * 2)),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: Sizes.large),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.giant),
                        ),
                      ),
                      Text(
                        "Delicately sliced, fresh Atlantic salmon drapes elegantly over a pillow of perfectly seasoned sushi rice. Its vibrant hue and buttery texture promise an exquisite melt-in-your-mouth experience. Paired with a whisper of wasabi and a side of traditional pickled ginger, our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the ocean's bounty with each savory bite.",
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(color: primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
