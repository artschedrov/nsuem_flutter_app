import 'package:flutter/cupertino.dart';
import 'package:food_app/models/food_model.dart';

class RestaurantModel extends ChangeNotifier{
  final List<FoodModel> _menu = [
    FoodModel(
        name: "Чизбургер",
        description: "Сочная говядина, сыр чедар, помидоры, огурчики",
        imgPath: "lib/images/burgers/burger.png",
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
        imgPath: "lib/images/burgers/burger.png",
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
        imgPath: "lib/images/burgers/burger.png",
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
        imgPath: "lib/images/burgers/burger.png",
        price: 350,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Больше сыра", price: 40),
          Addon(name: "Бекон", price: 50)
        ]
    )
  ];

  List<FoodModel> get menu => _menu;

}