import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/constants/theme.dart';
import 'package:sushi/models/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Consumer<Cart>(
            builder: (context, value, child) => ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(value.cart[index].name),
                      subtitle: Text('\$${value.cart[index].price}'),
                      trailing: ConstrainedBox(
                        constraints: BoxConstraints.tight(Size.infinite),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle),
                              onPressed: () {
                                value.removeFromCart(value.cart[index]);
                              },
                            ),
                            Text(value.cart.length.toString()),
                            IconButton(
                                onPressed: () =>
                                    value.addToCart(value.cart[index], 1),
                                icon: const Icon(Icons.add_circle))
                          ],
                        ),
                      ));
                })));
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
