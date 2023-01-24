import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 40.0),
          const TextSeparator(text: 'Main'),
          CustomMenuItem(
            text: 'Dashboard',
            icon: Icons.dashboard_outlined,
            onPressed: () {
              SideBarProvider.closeMenu();
            },
          ),
          CustomMenuItem(text: 'Wallet', icon: Icons.wallet, onPressed: () {}),
          CustomMenuItem(text: 'Stores', icon: Icons.shopping_bag_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Profile', icon: Icons.account_circle_outlined, onPressed: () {}),
          const SizedBox(height: 50.0),
          const TextSeparator(text: 'Actions'),
          CustomMenuItem(text: 'Extension', icon: Icons.downloading_outlined, onPressed: () {}),
          CustomMenuItem(text: 'Logout', icon: Icons.exit_to_app_outlined, onPressed: () {}),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xff00ccf9),
          Color(0xff624ef2),
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
      );
}
