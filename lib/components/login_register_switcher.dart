import 'package:flutter/material.dart';
import 'package:food_app/pages/login_page.dart';
import 'package:food_app/pages/register_page.dart';

class LoginRegisterSwitcher extends StatefulWidget {
  const LoginRegisterSwitcher({super.key});
  
  @override
  State<LoginRegisterSwitcher> createState() => _LoginRegisterSwitcher();
}

class _LoginRegisterSwitcher extends State<LoginRegisterSwitcher> {
  bool showLogin = true;
  
  void togglePage() {
    setState(() {
      showLogin = !showLogin;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if(showLogin) {
      return LoginPage(onTap: togglePage);
    } else {
      return RegisterPage(onTap: togglePage);
    }
  }
}

