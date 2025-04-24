import 'package:flutter/material.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:food_app/models/restaurant_model.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartModel cartModel;
  const CartTile({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantModel>(
        builder: (context, restaurant, child) => Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          cartModel.food.imgPath,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartModel.food.name),
                          Text(cartModel.food.price.toString()),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
    );
  }
}