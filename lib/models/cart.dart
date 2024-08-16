import 'package:flutter/material.dart';
import 'package:sushi/models/food.dart';

class Cart extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
        image: Image.asset("lib/images/sushi.png"),
        rating: "2.4",
        price: 22.5,
        name: "Salmon Sushi"),
    Food(
        image: Image.asset("lib/images/sushi-2.png"),
        rating: "4.4",
        price: 21.5,
        name: "Tex Sushi"),
    Food(
        image: Image.asset("lib/images/sushi-3.png"),
        rating: "5.0",
        price: 12.5,
        name: "Sora Sushi"),
    Food(
        image: Image.asset("lib/images/sushi-4.png"),
        rating: "3.2",
        price: 18.2,
        name: "Wumini Sushi"),
  ];

  final List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food food, int quantity) {
    for (var i = 0; i < quantity; i++) {
      _cart.add(food);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
