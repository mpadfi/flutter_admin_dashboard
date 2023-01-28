import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/ui/shared/widgets/widgets.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  void navigateTo(String routeName) {
    SideBarProvider.closeMenu();
    NavigationService.navigateTo(routeName);
  }

  @override
  Widget build(BuildContext context) {
    //
    final currentPage = Provider.of<SideBarProvider>(context).currentPage;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

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
            isActive: currentPage == Flurorouter.dashboarRoute,
            text: 'Dashboard',
            icon: Icons.dashboard_outlined,
            onPressed: () => navigateTo(Flurorouter.dashboarRoute),
          ),
          CustomMenuItem(
            isActive: currentPage == Flurorouter.walletRoute,
            text: 'Wallet',
            icon: Icons.wallet,
            onPressed: () => navigateTo(Flurorouter.walletRoute),
          ),
          CustomMenuItem(
            isActive: currentPage == Flurorouter.storesRoute,
            text: 'Stores',
            icon: Icons.shopping_bag_outlined,
            onPressed: () => navigateTo(Flurorouter.storesRoute),
          ),
          CustomMenuItem(text: 'Profile', icon: Icons.account_circle_outlined, onPressed: () {}),
          CustomMenuItem(
            isActive: currentPage == Flurorouter.iconsRoute,
            text: 'Icons',
            icon: Icons.check_circle_outlined,
            onPressed: () => navigateTo(Flurorouter.iconsRoute),
          ),
          CustomMenuItem(
            isActive: currentPage == Flurorouter.categoriesRoute,
            text: 'Categories',
            icon: Icons.layers_rounded,
            onPressed: () => navigateTo(Flurorouter.categoriesRoute),
          ),
          const SizedBox(height: 50.0),
          const TextSeparator(text: 'Actions'),
          CustomMenuItem(text: 'Extension', icon: Icons.downloading_outlined, onPressed: () {}),
          CustomMenuItem(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            onPressed: () {
              authProvider.logout();
            },
          ),
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
