class FoodModel {
  final String name;
  final String description;
  final String imgPath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddons;

  FoodModel({
    required this.name,
    required this.description,
    required this.imgPath,
    required this.price,
    required this.category,
    required this.availableAddons

  });
}

enum FoodCategory {
  burgers(1, description:"Бургеры"),
  salads(1, description:"Салаты"),
  deserts(1, description:"Десерты"),
  drinks(1, description:"Напитки");

  const FoodCategory(
      int number, {
        this.enabled = true,
        required this.description,
      }) : n = number;
  final int n;
  final bool enabled;
  final String description;
}


class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price
  });
}