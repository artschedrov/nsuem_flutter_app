import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/my_button.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/models/restaurant_model.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final FoodModel food;
  final Map<Addon, bool> selectedAddon = {};
  FoodPage(
      {
        super.key,
        required this.food
      }) {
    for (Addon addon in food.availableAddons) {
      selectedAddon[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addToCart(FoodModel food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);
    List<Addon> currentySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddon[addon] == true) {
        currentySelectedAddons.add(addon);
      }
    }
    context.read<RestaurantModel>().addToCart(food, currentySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(widget.food.imgPath),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    ),
                  ),
                  Text(
                    widget.food.price.toString() + " ₽",
                    style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                  widget.food.description,
                  ),
                  const SizedBox(height: 10),
                  Divider(color: Theme.of(context).colorScheme.secondary,),
                  const SizedBox(height: 10),

                  Text(
                    "Дополнения",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary
                      ),
                    borderRadius: BorderRadius.circular(8)
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                      Addon addon = widget.food.availableAddons[index];
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text(addon.price.toString() + " ₽"),
                          value: widget.selectedAddon[addon],
                          onChanged: (bool? value) {
                            setState(() {
                            widget.selectedAddon[addon] = value!;
                            });
                          }
                        );
                      }
                    )
                  ),
                ]
              ),
            ),
            MyButton(
            text: "Добавить в заказ",
            onTap: () => addToCart(widget.food, widget.selectedAddon),),
              const SizedBox(height: 20),
            ],
          ),
        )

        ),

        // SafeArea(
        //     child: Opacity(
        //         opacity: 0.6,
        //         child: Container(
        //           margin: const EdgeInsets.only(left: 25),
        //           decoration: BoxDecoration(
        //             color: Theme.of(context).colorScheme.secondary,
        //             shape: BoxShape.circle,
        //           ),
        //           child: IconButton(
        //             onPressed: () => Navigator.pop(context),
        //             icon: const Icon(Icons.arrow_back_rounded),
        //           )
        //         )
        //     )
        // )

      ],
    );
  }
}