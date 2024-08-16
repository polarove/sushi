import 'package:sushi/models/cart.dart';

class FoodVO {
  String imagePath;
  String rating;
  String name;
  double price;

  FoodVO(
      {required this.imagePath,
      required this.rating,
      required this.name,
      required this.price});
}

class FoodBO extends BaseCartItem {
  String imagePath;
  String name;

  FoodBO(
      {required super.unitPrice,
      required this.imagePath,
      required this.name,
      super.maxQuantity,
      super.minQuantity});
}
