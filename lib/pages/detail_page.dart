import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/constants/size.dart';
import 'package:sushi/constants/theme.dart';
import 'package:sushi/models/cart.dart';
import 'package:sushi/models/food.dart';
import 'package:provider/provider.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key, required this.food});
  final FoodVO food;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  _FoodDetailPageState();

  @override
  void initState() {
    super.initState();
  }

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
              padding: const EdgeInsets.only(bottom: Sizes.giant * 2),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).devicePixelRatio * 167,
                    padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.giant * 4, vertical: Sizes.giant * 2),
                    child: Image.asset(widget.food.imagePath),
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
                        Text(
                          "Delicately sliced, fresh Atlantic salmon drapes elegantly over a pillow of perfectly seasoned sushi rice. Its vibrant hue and buttery texture promise an exquisite melt-in-your-mouth experience. Paired with a whisper of wasabi and a side of traditional pickled ginger, our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the ocean's bounty with each savory bite.",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Text(
                          "Delicately sliced, fresh Atlantic salmon drapes elegantly over a pillow of perfectly seasoned sushi rice. Its vibrant hue and buttery texture promise an exquisite melt-in-your-mouth experience. Paired with a whisper of wasabi and a side of traditional pickled ginger, our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the ocean's bounty with each savory bite.",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Text(
                          "Delicately sliced, fresh Atlantic salmon drapes elegantly over a pillow of perfectly seasoned sushi rice. Its vibrant hue and buttery texture promise an exquisite melt-in-your-mouth experience. Paired with a whisper of wasabi and a side of traditional pickled ginger, our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the ocean's bounty with each savory bite.",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Text(
                          "Delicately sliced, fresh Atlantic salmon drapes elegantly over a pillow of perfectly seasoned sushi rice. Its vibrant hue and buttery texture promise an exquisite melt-in-your-mouth experience. Paired with a whisper of wasabi and a side of traditional pickled ginger, our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the ocean's bounty with each savory bite.",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Text(
                          "Delicately sliced, fresh Atlantic salmon drapes elegantly over a pillow of perfectly seasoned sushi rice. Its vibrant hue and buttery texture promise an exquisite melt-in-your-mouth experience. Paired with a whisper of wasabi and a side of traditional pickled ginger, our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the ocean's bounty with each savory bite.",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Text(
                          "Delicately sliced, fresh Atlantic salmon drapes elegantly over a pillow of perfectly seasoned sushi rice. Its vibrant hue and buttery texture promise an exquisite melt-in-your-mouth experience. Paired with a whisper of wasabi and a side of traditional pickled ginger, our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the ocean's bounty with each savory bite.",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Text(
                          "Delicately sliced, fresh Atlantic salmon drapes elegantly over a pillow of perfectly seasoned sushi rice. Its vibrant hue and buttery texture promise an exquisite melt-in-your-mouth experience. Paired with a whisper of wasabi and a side of traditional pickled ginger, our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the ocean's bounty with each savory bite.",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Text(
                          "Delicately sliced, fresh Atlantic salmon drapes elegantly over a pillow of perfectly seasoned sushi rice. Its vibrant hue and buttery texture promise an exquisite melt-in-your-mouth experience. Paired with a whisper of wasabi and a side of traditional pickled ginger, our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the ocean's bounty with each savory bite.",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).devicePixelRatio * 67,
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).devicePixelRatio * 67,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      vertical: Sizes.large, horizontal: Sizes.giant),
                  decoration: const BoxDecoration(color: primaryColor),
                  child: FoodQuantities(food: widget.food),
                ))
          ],
        ));
  }
}

class FoodQuantities extends StatefulWidget {
  const FoodQuantities({super.key, required this.food});
  final FoodVO food;

  @override
  State<StatefulWidget> createState() => _FoodQuantitiesState();
}

class _FoodQuantitiesState extends State<FoodQuantities> {
  double _currentPrice = 0.00;
  int _quantity = 1;
  FoodBO get food => FoodBO(
      unitPrice: widget.food.price,
      imagePath: widget.food.imagePath,
      name: widget.food.name,
      minQuantity: 1,
      maxQuantity: 3);

  @override
  void initState() {
    super.initState();
    _currentPrice = widget.food.price;
  }

  void decreaseQuantity() {
    if (_quantity <= food.minQuantity) {
      showToast("At lease ${food.minQuantity} should be ordered",
          context: context,
          position: const StyledToastPosition(align: Alignment.center),
          animation: StyledToastAnimation.fadeScale,
          animDuration: const Duration(milliseconds: 67));
      return;
    }
    setState(() {
      if (_quantity > 0) {
        _quantity -= 1;
        _currentPrice = (Decimal.parse(widget.food.price.toString()) *
                Decimal.parse(_quantity.toString()))
            .toDouble();
      }
    });
  }

  void increaseQuantity() {
    if (_quantity >= food.maxQuantity) {
      showToast("You can only order ${food.maxQuantity} items at a time",
          context: context,
          position: const StyledToastPosition(align: Alignment.center),
          animation: StyledToastAnimation.fadeScale,
          animDuration: const Duration(milliseconds: 67));
      return;
    }
    setState(() {
      _quantity++;
      _currentPrice = (Decimal.parse(widget.food.price.toString()) *
              Decimal.parse(_quantity.toString()))
          .toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // price
            SizedBox(
              width: 120,
              child: Text(
                "\$$_currentPrice",
                style: const TextStyle(
                    color: Colors.white, fontSize: Sizes.giant * 1.5),
              ),
            ),
            // minus button
            Row(
              children: [
                FilledButton(
                    onPressed: () => decreaseQuantity(),
                    style: FilledButton.styleFrom(backgroundColor: buttonColor),
                    child: const Icon(Icons.remove)),

                // count
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  child: Text(
                    _quantity.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontSize: Sizes.giant),
                  ),
                ),
                // plus button
                FilledButton(
                    onPressed: () => increaseQuantity(),
                    style: FilledButton.styleFrom(backgroundColor: buttonColor),
                    child: const Icon(Icons.add)),
              ],
            )
          ],
        ),
        const SizedBox(
          height: Sizes.giant,
        ),
        SizedBox(
          height: Sizes.giant * 3,
          width: double.infinity,
          child: FilledButton(
              onPressed: () => addToCart(), child: const Text("Add to cart")),
        )
      ],
    );
  }

  void addToCart() {
    final cart = context.read<Cart>();

    // add to cart
    cart.addToCart(CartItem(item: food, quantity: _quantity));

    // notify the user about the reuslt
    showToast("$_quantity ${food.name} have been added to cart, enjoy.",
        context: context,
        position: const StyledToastPosition(align: Alignment.center),
        animation: StyledToastAnimation.fadeScale,
        animDuration: const Duration(milliseconds: 67));

    Navigator.pop(context);
  }
}
