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
              padding: const EdgeInsets.symmetric(horizontal: Sizes.extraLarge),
              margin: const EdgeInsets.symmetric(
                  horizontal: Sizes.extraLarge, vertical: Sizes.giant),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.large),
                  border: Border.all(color: Colors.grey[300]!)),
              height: MediaQuery.of(context).devicePixelRatio * 47,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Sizes.large, horizontal: Sizes.giant),
                    child: Image.asset(value.cart[index].item.imagePath),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: Sizes.extraLarge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                value.cart[index].item.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: Sizes.large),
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
                          IconButton(
                            color: primaryColor,
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () {
                              try {
                                value.decreaseItemQuantityInCart(
                                    index: index, quantity: 1);
                              } catch (e) {
                                // notify the user about the reuslt
                                showToast(e.toString().split(":")[1],
                                    context: context,
                                    position: const StyledToastPosition(
                                        align: Alignment.center),
                                    animation: StyledToastAnimation.fadeScale,
                                    animDuration:
                                        const Duration(milliseconds: 67));
                              }
                            },
                          ),
                          Text(value.cart[index].quantity.toString()),
                          IconButton(
                              color: primaryColor,
                              onPressed: () {
                                try {
                                  value.increaseItemQuantityInCart(
                                      index: index, quantity: 1);
                                } catch (e) {
                                  showToast(e.toString().split(":")[1],
                                      context: context,
                                      position: const StyledToastPosition(
                                          align: Alignment.center),
                                      animation: StyledToastAnimation.fadeScale,
                                      animDuration:
                                          const Duration(milliseconds: 67));
                                }
                              },
                              icon: const Icon(Icons.add_circle))
                        ],
                      )
                    ],
                  )
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

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<StatefulWidget> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return const Text('Cart Item');
  }
}
