import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:food_app/models/food_model.dart';
import 'package:intl/intl.dart';

class RestaurantModel extends ChangeNotifier{
  final List<FoodModel> _menu = [
    FoodModel(
        name: "Чизбургер",
        description: "Сочная говядина, сыр чедар, помидоры, огурчики",
        imgPath: "lib/img/burgers/burgers.jpg",
        price: 350,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    ),
    FoodModel(
        name: "Чизбургер",
        description: "Сочная говядина, сыр чедар, помидоры, огурчики",
        imgPath: "lib/img/burgers/burgers.jpg",
        price: 350,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    ),
    FoodModel(
        name: "Чизбургер",
        description: "Сочная говядина, сыр чедар, помидоры, огурчики",
        imgPath: "lib/img/burgers/burgers.jpg",
        price: 350,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    ),
    FoodModel(
        name: "Чизбургер",
        description: "Сочная говядина, сыр чедар, помидоры, огурчики",
        imgPath: "lib/img/burgers/burgers.jpg",
        price: 350,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    ),
    FoodModel(
        name: "Пирог",
        description: "Сочная говядина, сыр чедар, помидоры, огурчики",
        imgPath: "lib/img/deserts/deserts.jpg",
        price: 350,
        category: FoodCategory.deserts,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    ),
    FoodModel(
        name: "Лимонад",
        description: "Сочная говядина, сыр чедар, помидоры, огурчики",
        imgPath: "lib/img/drinks/drinks.jpg",
        price: 350,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    ),
    FoodModel(
        name: "Салат",
        description: "Сочная говядина, сыр чедар, помидоры, огурчики",
        imgPath: "lib/img/salads/salads.png",
        price: 350,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    ),
    FoodModel(
        name: "Салат",
        description: "Сочная говядина, сыр чедар, помидоры, огурчики",
        imgPath: "lib/img/salads/salads.png",
        price: 350,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    ),
    FoodModel(
        name: "Салат",
        description: "Сочная говядина, сыр чедар, помидоры, огурчики",
        imgPath: "lib/img/salads/salads.png",
        price: 350,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    )
  ];

  List<FoodModel> get menu => _menu;
  List<CartModel> get cart => _cart;
  final List<CartModel> _cart = [];

  void addToCart(FoodModel food, List<Addon> selectedAddons) {
    CartModel? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;

    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartModel(food: food, selectedAddons: selectedAddons)
      );
    }
  }

  void removeFromCart(CartModel cart) {
    int cartIndex = _cart.indexOf(cart);

    if (cartIndex !=-1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
  }

  double getTotalPrice() {
    double total = 0.0;
    for (CartModel cart in _cart) {
      double itemTotal = cart.food.price;
      for (Addon addon in cart.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cart.quantity;
    }
    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartModel cart in _cart) {
      totalItemCount += cart.quantity;
    }

    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String displayCartPayment() {
    final payment = StringBuffer();
    payment.writeln("Здесь ваш чек");
    payment.writeln();

    String formatedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    payment.writeln(formatedDate);
    payment.writeln();
    payment.writeln("----------");

    for (final cartItem in _cart) {
      payment.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        payment.writeln("  Дополнения: ${_formatAddons(cartItem.selectedAddons)}");
      }
      payment.writeln();
    }
    payment.writeln("-------------");
    payment.writeln();
    payment.writeln("Всего позиций: ${getTotalItemCount()}");
    payment.writeln("Итого: ${_formatPrice(getTotalPrice())}");

    return payment.toString();
  }

  String _formatPrice(double price) {
    return "${price.toStringAsFixed(2)}";
  }

  String _formatAddons(List<Addon> addons) {
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
  }

}