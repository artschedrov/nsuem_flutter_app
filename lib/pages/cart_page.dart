import 'package:flutter/material.dart';
import 'package:food_app/models/restaurant_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantModel>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        return Scaffold(
          appBar: AppBar(
            title: Text("Заказ"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    final cartItem = userCart[index];
                    return ListTile(
                       title: Text(cartItem.food.name)
                    );
                  }
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}