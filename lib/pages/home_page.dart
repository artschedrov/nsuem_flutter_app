import 'package:flutter/material.dart';
import 'package:food_app/components/curr_location.dart';
import 'package:food_app/components/delivery_description.dart';
import 'package:food_app/components/food_tab_bar.dart';
import 'package:food_app/components/food_tile.dart';
import 'package:food_app/components/menu_sidebar.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/models/restaurant_model.dart';
import 'package:provider/provider.dart';
import '../components/sliver_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<FoodModel> _filterMenuByCategory(FoodCategory category, List<FoodModel> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<FoodModel> fullMenu) {
    return FoodCategory.values.map((category) {
      List<FoodModel> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            //получить еду
            final foodModel = categoryMenu[index];
            return FoodTile(
                foodModel: foodModel,
                onTap: () {}
            );
          },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Главная")),
      drawer: MenuSidebar(),
      body: NestedScrollView(
        headerSliverBuilder: (context,innerBoxIsScrolled) => [
          NewSliverBar(
            title: FoodTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                CurrLocation(),
                const DeliveryDescription()
              ],
            ),
          )
        ],
        body: Consumer<RestaurantModel>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        )
      )
    );
  }
}