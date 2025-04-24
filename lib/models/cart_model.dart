import 'package:food_app/models/food_model.dart';

class CartModel {
  FoodModel food;
  List<Addon> selectedAddons;
  int quantity;

  CartModel({
    required this.food,
    required this.selectedAddons,
    this.quantity=1
  });

  double get totalPrice {
    double addonPrice = selectedAddons.fold(0,(sum,addon) => sum + addon.price);
    return (food.price + addonPrice) * quantity;
  }
}