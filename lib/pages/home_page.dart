import 'package:flutter/material.dart';
import 'package:food_app/components/menu_sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Главная")),
      drawer: MenuSidebar(),
    );
  }
}