import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/quntity_selector.dart';
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
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)
          ),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.all(8.0),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
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
                           Text(cartModel.food.price.toString(),
                             style: TextStyle(
                               color: Theme.of(context).colorScheme.primary
                             ),
                           ),
                         ],
                       ),
                       Spacer(),
                       QuantitySelector(
                           quantity: cartModel.quantity,
                           food: cartModel.food,
                           onDecrement: () {
                             restaurant.removeFromCart(cartModel);
                           },
                           onIncrement: (){
                             restaurant.addToCart(cartModel.food, cartModel.selectedAddons);
                           }
                       )
                     ],
                   ),
                  ),
                  SizedBox(
                    height: cartModel.selectedAddons.isEmpty ? 0 : 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: cartModel.selectedAddons
                          .mapList(
                            (addon) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                              child: FilterChip(
                                label: Row(
                                  children: [
                                    Text('${addon.name} '),
                                    Text(addon.price.toString()),
                                  ],
                                ),
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: Theme.of(context).colorScheme.primary)),
                                onSelected: (value) {},
                                backgroundColor: Theme.of(context).colorScheme.secondary,
                              ),
                            )
                          )
                      ),
                    ),
                ],
              ),
            )
    );
  }
}