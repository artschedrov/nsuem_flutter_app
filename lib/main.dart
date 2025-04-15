import 'package:flutter/material.dart';
import 'package:food_app/components/login_register_switcher.dart';
import 'package:food_app/models/restaurant_model.dart';
import 'package:provider/provider.dart';
import 'package:food_app/themes/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => RestaurantModel())
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginRegisterSwitcher(),
      theme: Provider.of<ThemeProvider>(context).themeData
    );
  }
}
