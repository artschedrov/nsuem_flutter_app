import 'package:flutter/material.dart';
import 'package:food_app/components/my_button.dart';

import '../components/textfield.dart';

class LoginPage extends StatefulWidget{
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(
          //   Icons.lock_open_rounded,
          //   size:100,
          //   color: Theme.of(context).colorScheme.inversePrimary,
          // ),
          const SizedBox(height: 25),
          Text(
            "Food order app",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary
            ),
          ),
          const SizedBox(height: 25),
          MyTextField(
            controller: emailController,
            hintText: "Email",
            obscureText: false,
          ),

          const SizedBox(height: 10),
          MyTextField(
            controller: passwordController,
            hintText: "Password",
            obscureText: true,
          ),
          MyButton(text: "Вход", onTap: () {}),
          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Нет аккаунта? ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
              const SizedBox(width: 4),
              Text("Зарегистрироваться")
            ],
          )
        ],
      ),
    );
  }
}