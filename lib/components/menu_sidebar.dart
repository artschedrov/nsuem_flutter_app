import 'package:flutter/material.dart';
import 'package:food_app/components/menu_sidebar_tile.dart';

import 'login_register_switcher.dart';

class MenuSidebar extends StatelessWidget {
  const MenuSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:Column(
        children: [
          Padding(padding: const EdgeInsets.only(top:100.0)),
          Padding(padding: const EdgeInsets.all(25.0),
          child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MenuSidebarTile(
            text: "ГЛАВНАЯ",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          const Spacer(),
          MenuSidebarTile(
            text: "ВЫЙТИ",
            icon: Icons.logout,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginRegisterSwitcher(),
              ),
            ),
          ),
          const SizedBox(height: 25)
        ],
      )
    );
  }
}