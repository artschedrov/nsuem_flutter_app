import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrLocation extends StatelessWidget {
  const CurrLocation({super.key});

  void openLocationBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Ваше местоположение"),
          content: TextField(decoration: const InputDecoration(hintText: "Поиск адреса.."),
          ),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Отмена"),
            ),

            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Сохранить"),
            ),

          ],
        )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Доставить сейчас",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationBox(context),
            child: Row(
              children: [
                Text(
                  "ул. Красный проспект 1",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            )
          )
        ],
      ),
    );
  }
}
