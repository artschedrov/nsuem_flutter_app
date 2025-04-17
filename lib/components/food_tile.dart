import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';

class FoodTile extends StatelessWidget {
  final FoodModel foodModel;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.foodModel,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(foodModel.name),
                      Text(foodModel.price.toString(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        foodModel.description,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  )
                ),
                const SizedBox(width: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(foodModel.imgPath, height: 120),
                ),
              ],
            )
          )
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}