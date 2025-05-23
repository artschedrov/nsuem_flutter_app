import 'package:flutter/material.dart';

class DeliveryDescription extends StatelessWidget {
  const DeliveryDescription({super.key});
  
  @override
  Widget build(BuildContext context) {

    var descPrimaryTextStyle = TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var descSecondaryTextStyle = TextStyle(color: Theme.of(context).colorScheme.primary);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("80 руб.", style: descPrimaryTextStyle),
              Text("Стоимость доставки", style: descSecondaryTextStyle),
            ],
          ),
          Column(
            children: [
              Text("15-20 минут", style: descPrimaryTextStyle),
              Text("Время доставки", style: descSecondaryTextStyle)
            ],
          )
        ],
      ),
    );
  }
}