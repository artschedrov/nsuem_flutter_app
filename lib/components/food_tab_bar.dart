import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';

class FoodTabBar extends StatelessWidget {
  final TabController tabController;

  const FoodTabBar({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildCategoryTab() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTab(),
      ),
    );
  }
}