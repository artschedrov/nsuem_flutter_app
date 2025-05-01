import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:food_app/models/food_model.dart';
import 'package:intl/intl.dart';

class RestaurantModel extends ChangeNotifier{
  final List<FoodModel> _menu = [
    FoodModel(
        name: "Габургер",
        description: "Приготовленный на огне бифштекс из 100% говядины с хрустящим маринованным огурчиком, рубленым луком, горчицей и кетчупом в подрумяненной булочке с кунжутом.",
        imgPath: "lib/img/burgers/b1.png",
        price: 96,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    ),
    FoodModel(
        name: "Гранд Чиз Двойной",
        description: "Теперь ещё больше соуса! Под кетчупом и горчицей целых два бифштекса по-домашнему из фирменной говядины с добавлением отборной курочки, сыр Чеддер, рубленый лучок и маринованные огурчики на румяной булочке с кунжутом. Это точно сочно!",
        imgPath: "lib/img/burgers/b3.png",
        price: 329,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    ),
    FoodModel(
        name: "Чикен Тар Тар",
        description: "Мы приготовили что-то особенное! Новый соус Тартар подчеркивает вкус сочной курочки с сыром Пармезан! А ещё внутри свежие томаты, салат Айсберг, рубленый лучок — на картофельной булочке с кунжутом.",
        imgPath: "lib/img/burgers/b4.png",
        price: 229,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    ),
    FoodModel(
        name: "Чизбургер",
        description: "Фирменный приготовленный на огне бифштекс из 100% говядины с ломтиком слегка расплавленного сыра, хрустящим маринованным огурчиком, луком, горчицей и кетчупом, которые подаются в подрумяненной булочке с кунжутом.",
        imgPath: "lib/img/burgers/b2.png",
        price: 99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    ),
    FoodModel(
        name: "Пирожок с вишней",
        description: "Горячий хрустящий пирожок с начинкой из ароматной спелой вишни.",
        imgPath: "lib/img/deserts/dis1.png",
        price: 124,
        category: FoodCategory.deserts,
        availableAddons: [
        ]
    ),
    FoodModel(
        name: "Айс Твист",
        description: "Шоколадный топпинг и нежное взбитое мороженое с хрустящими кусочками песочного печенья. Айс, как вкусно!",
        imgPath: "lib/img/deserts/dis2.png",
        price: 189,
        category: FoodCategory.deserts,
        availableAddons: [
          Addon(name: "Шоколадная крошка", price: 40),
        ]
    ),
    FoodModel(
        name: "Вода Аква Минерале",
        description: "Aqua Minerale® — питьевая вода с удивительно свежим, приятным и мягким вкусом.",
        imgPath: "lib/img/drinks/dr1.png",
        price: 134,
        category: FoodCategory.drinks,
        availableAddons: [
        ]
    ),
    FoodModel(
        name: "Фрустайл Лимон Лайм",
        description: "Frustyle - это необычный газированный напиток или лимонад. Фрустайл со вкусом Лимон Лайм - это цитрусовый прозрачный лимонад с освежающей волной из миллиона пузырьков.",
        imgPath: "lib/img/drinks/dr2.png",
        price: 149,
        category: FoodCategory.drinks,
        availableAddons: [
        ]
    ),
    FoodModel(
        name: "Салат Цезарь",
        description: "Традиционный рецепт салата «Цезарь» с листьями зеленого салата, чесночными сухариками, сыром Пармезан и хрустящей курочкой под нежным соусом Цезарь.",
        imgPath: "lib/img/salads/s1.png",
        price: 380,
        category: FoodCategory.salads,
        availableAddons: [
        ]
    ),
    FoodModel(
        name: "Салат Цезарь с креветками",
        description: "Легкий салат Цезарь с листьями салата айсберг, нежными королевскими креветками в легкой хрустящей панировке, сыром пармезан и чесночными сухариками под нежным соусом Цезарь. Внимание! Блюдо содержит аллергены – морепродукты.",
        imgPath: "lib/img/salads/s2.png",
        price: 405,
        category: FoodCategory.salads,
        availableAddons: [
        ]
    ),
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