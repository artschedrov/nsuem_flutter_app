import 'package:flutter/material.dart';
import 'package:food_app/components/curr_location.dart';
import 'package:food_app/components/delivery_description.dart';
import 'package:food_app/components/food_tab_bar.dart';
import 'package:food_app/components/menu_sidebar.dart';
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
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Text("tab items"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("tab items"),
            ),
          ],
        ),
      )
    );
  }
}