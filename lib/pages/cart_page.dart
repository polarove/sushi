import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/empty_view.dart';
import 'package:sushi/constants/size.dart';
import 'package:sushi/constants/theme.dart';
import 'package:sushi/models/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void makeToast(String message, {required BuildContext context}) {
    showToast(
      message,
      context: context,
      position: const StyledToastPosition(align: Alignment.center),
      animation: StyledToastAnimation.fadeScale,
      animDuration: const Duration(milliseconds: 67),
    );
  }

  void handleMinusQuantity(Cart value, int index) {
    try {
      value.decreaseItemQuantityInCart(index: index, quantity: 1);
    } catch (e) {
      makeToast(
        e.toString().split(":")[1],
        context: context,
      );
    }
  }

  void handleIncreaseQuantity(Cart value, int index) {
    try {
      value.increaseItemQuantityInCart(index: index, quantity: 1);
    } catch (e) {
      makeToast(
        e.toString().split(":")[1],
        context: context,
      );
    }
  }

  Widget buildCart(Cart value, Widget? child) {
    if (value.cart.isEmpty) {
      return const Center(
        child: EmptyView(),
      );
    } else {
      return ListView.builder(
          itemCount: value.cart.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.large),
              margin: const EdgeInsets.symmetric(
                  horizontal: Sizes.large, vertical: Sizes.giant),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.large),
                  border: Border.all(color: Colors.grey[300]!)),
              height: MediaQuery.of(context).devicePixelRatio * 47,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Sizes.large, horizontal: Sizes.medium),
                    child: Image.asset(value.cart[index].item.imagePath),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        value.cart[index].item.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text(
                              "\$${value.cart[index].totalPrice}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: primaryColor),
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                borderRadius:
                                    BorderRadius.circular(Sizes.large),
                                onTap: () => handleMinusQuantity(value, index),
                                child: const Icon(
                                  Icons.remove_circle,
                                  color: primaryColor,
                                  size: Sizes.giant * 1.4,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Sizes.large),
                                child: Text(
                                  value.cart[index].quantity.toString(),
                                  style: TextStyle(fontSize: Sizes.giant),
                                ),
                              ),
                              InkWell(
                                borderRadius:
                                    BorderRadius.circular(Sizes.large),
                                onTap: () =>
                                    handleIncreaseQuantity(value, index),
                                child: const Icon(
                                  Icons.add_circle,
                                  color: primaryColor,
                                  size: Sizes.giant * 1.4,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ))
                ],
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Consumer<Cart>(
            builder: (context, value, child) => buildCart(value, child)));
  }
}
