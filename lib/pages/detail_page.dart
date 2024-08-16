import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/constants/size.dart';
import 'package:sushi/constants/theme.dart';

import 'package:sushi/screen/menu_screen.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key, required this.food});
  final Food food;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  _FoodDetailPageState();

  double _currentPrice = 0.00;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _currentPrice = widget.food.price;
  }

  void decreaseQuantity() {
    setState(() {
      if (_quantity > 0) {
        _quantity -= 1;
        _currentPrice = widget.food.price * _quantity;
      }
    });
  }

  void increaseQuantity() {
    setState(() {
      _quantity++;
      _currentPrice = widget.food.price * _quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
          elevation: 0,
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.giant * 4,
                          vertical: Sizes.giant * 2),
                      child: widget.food.image,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.giant * 1.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    widget.food.rating,
                                  ),
                                ],
                              ),
                              Text("\$${widget.food.price} / each"),
                            ],
                          ),
                          Text(widget.food.name,
                              style: GoogleFonts.dmSerifDisplay(
                                  fontSize: Sizes.extraLarge * 2)),
                          const Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: Sizes.large),
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
                left: 0,
                right: 0,
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: Sizes.large),
                    decoration: const BoxDecoration(color: primaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // price
                            SizedBox(
                              width: 120,
                              child: Text(
                                "\$$_currentPrice",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: Sizes.giant * 1.5),
                              ),
                            ),
                            // minus button
                            Row(
                              children: [
                                FilledButton(
                                    onPressed: () => decreaseQuantity(),
                                    style: FilledButton.styleFrom(
                                        backgroundColor: buttonColor),
                                    child: const Icon(Icons.remove)),

                                // count
                                Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  child: Text(
                                    _quantity.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: Sizes.giant),
                                  ),
                                ),
                                // plus button
                                FilledButton(
                                    onPressed: () => increaseQuantity(),
                                    style: FilledButton.styleFrom(
                                        backgroundColor: buttonColor),
                                    child: const Icon(Icons.add)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: Sizes.large,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.extraLarge),
                          height: Sizes.giant * 3,
                          width: double.infinity,
                          child: FilledButton(
                              onPressed: () => {},
                              child: const Text("Add to cart")),
                        )
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
