import 'package:flutter/material.dart';
import 'package:food_app/components/cart_tile.dart';
import 'package:food_app/components/my_button.dart';
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
            actions: [
              IconButton(onPressed: () {
                showDialog(context: context, builder: (context)=>AlertDialog(
                  title: const Text("Вы хотите очистить корзину?"),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text("Отмена")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.clearCart();
                        }, child: const Text("Да"))
                  ],
                ));
                }, icon: const Icon(Icons.delete),
              ) 
            ],
          ),
          body: Column(
            children: [
              Expanded(
                  child: Column(
                    children: [
                      userCart.isEmpty ? const Expanded(child: Center(child: const Text("Корзина пустая.."),)) : Expanded(
                        child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              final cartItem = userCart[index];
                              return CartTile(cartModel: cartItem);

                            }
                        ),
                      ),
                    ],
                  ),
              ),
              MyButton(text: "Перейти к оплате", onTap: () {}),
              const SizedBox(height: 25)
            ],
          )
        );
      }
    );
  }
}