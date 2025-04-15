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
  burgers,
  salads,
  deserts,
  drinks
}

class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price
  });
}