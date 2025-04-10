import 'package:flutter/material.dart';


import '../components/my_button.dart';
import '../components/textfield.dart';

class RegisterPage extends StatefulWidget{
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cofirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 25),
          Text(
            "Создание аккаунта",
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary
            ),
          ),
          const SizedBox(height: 25),
          MyTextField(
            controller: emailController,
            hintText: "Эл.почта",
            obscureText: false,
          ),

          const SizedBox(height: 10),
          MyTextField(
            controller: passwordController,
            hintText: "Пароль",
            obscureText: true,
          ),

          const SizedBox(height: 10),
          MyTextField(
            controller: cofirmPasswordController,
            hintText: "Подтвердить пароль",
            obscureText: true,
          ),
          const SizedBox(height: 25,),
          MyButton(text: "Зарегистрироваться", onTap: () {}),
          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Уже есть аккаунт? ",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Войти",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}