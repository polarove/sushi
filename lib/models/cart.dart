import 'dart:developer';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:sushi/models/food.dart';

class BaseCartItem {
  double unitPrice;
  int maxQuantity;
  int minQuantity;

  BaseCartItem(
      {required this.unitPrice, this.maxQuantity = 3, this.minQuantity = 0});
}

class CartItem<T extends BaseCartItem> {
  final T item;
  int quantity;

  CartItem({required this.item, required this.quantity});

  double get totalPrice => (Decimal.parse(item.unitPrice.toString()) *
          Decimal.parse(quantity.toString()))
      .toDouble();
}

class Cart extends ChangeNotifier {
  // Getter, 获取菜单
  List<FoodVO> get foodMenu => _foodMenu;
  final List<FoodVO> _foodMenu = [
    FoodVO(
        imagePath: "lib/assets/images/sushi.png",
        rating: "2.4",
        price: 22.5,
        name: "Salmon Sushi"),
    FoodVO(
        imagePath: "lib/assets/images/sushi-2.png",
        rating: "4.4",
        price: 21.5,
        name: "Tex Sushi"),
    FoodVO(
        imagePath: "lib/assets/images/sushi-3.png",
        rating: "5.0",
        price: 12.5,
        name: "Sora Sushi"),
    FoodVO(
        imagePath: "lib/assets/images/sushi-4.png",
        rating: "3.2",
        price: 18.2,
        name: "Wumini Sushi"),
  ];

  Future<int> lessThan(
      {required int currentQuantity, required int maxQuantity}) {
    if (currentQuantity >= maxQuantity) {
      throw FormatException("Quantity cannot be greater than $maxQuantity");
    }
    return Future(() => currentQuantity);
  }

  Future<int> greaterThan(
      {required int currentQuantity, required int minQuantity}) {
    if (currentQuantity <= minQuantity) {
      throw FormatException("Quantity cannot be less than $minQuantity");
    }

    return Future(() => currentQuantity);
  }

  //- ---------------------------------------   购物车列表 ----------------------------------- -
  final List<CartItem<FoodBO>> _cart = [];

  // Getter 获取购物车列表
  List<CartItem<FoodBO>> get cart => _cart;

  bool get isEmpty => _cart.isEmpty;

  double get totalPrice => _cart.fold(
      0, (previousValue, element) => previousValue + element.totalPrice);

  double get totalQuantity => _cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);

  // add to cart
  void addToCart(CartItem<FoodBO> value) {
    void update() {
      _cart.add(value);
      notifyListeners();
    }

    lessThan(
            currentQuantity: value.quantity,
            maxQuantity: value.item.maxQuantity)
        .then((onValue) => greaterThan(
            currentQuantity: value.quantity,
            minQuantity: value.item.minQuantity))
        .then((onValue) => update());
  }

  // remove from cart
  void removeFromCart(CartItem item) {
    _cart.remove(item);
    notifyListeners();
  }

  void increaseItemQuantityInCart({required int index, int quantity = 1}) {
    var cartItem = _cart[index];

    void update(int q) {
      cartItem.quantity += q;
      notifyListeners();
    }

    lessThan(
            currentQuantity: cartItem.quantity,
            maxQuantity: cartItem.item.maxQuantity)
        .then((onValue) => update(quantity))
        .catchError((error) => log(error));
  }

  void decreaseItemQuantityInCart({required int index, int quantity = 1}) {
    var cartItem = _cart[index];

    void update(int q) {
      cartItem.quantity -= q;
      notifyListeners();
    }

    greaterThan(
            currentQuantity: cartItem.quantity,
            minQuantity: cartItem.item.minQuantity)
        .then((onValue) => update(quantity))
        .catchError((error) => log(error));
  }
}
