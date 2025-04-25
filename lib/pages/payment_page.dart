import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_app/components/my_button.dart';

import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  void userTappedPay() {
    if(formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Подтвердить платеж"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Номер карты: $cardNumber"),
                  Text("Срок: $expiryDate"),
                  Text("Имя держателя карты: $cardHolderName"),
                  Text("CVV: $cvvCode")
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Отмена")
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DeliveryProgressPage()
                      ),
                    );
                  }, child: const Text("Да")
              )
            ],
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Оплата"),

      ),
      body: Column(
        children: [
          CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: showBackView,
              onCreditCardWidgetChange: (p0) {},
          ),
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;

                });
              },
              formKey: formKey
          ),
          const Spacer(),
          MyButton(text: "Оплатить", onTap: userTappedPay ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}