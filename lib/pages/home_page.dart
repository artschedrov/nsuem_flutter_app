import 'package:flutter/material.dart';
import 'package:food_app/components/curr_location.dart';
import 'package:food_app/components/delivery_description.dart';
import 'package:food_app/components/menu_sidebar.dart';
import '../components/sliver_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Главная")),
      drawer: MenuSidebar(),
      body: NestedScrollView(
        headerSliverBuilder: (context,innerBoxIsScrolled) => [
          NewSliverBar(
            title: Text("title"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const CurrLocation(),
                const DeliveryDescription()
              ],
            ),
          )
        ],
      body: Container(color: Colors.blue),
      ),
    );
  }
}