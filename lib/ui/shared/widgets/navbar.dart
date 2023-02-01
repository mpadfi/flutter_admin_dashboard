import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(top: 5),
        height: 50,
        width: double.infinity,
        decoration: buildBoxDecoration(),
        child: Row(
          children: [
            if (size.width <= 700)
              IconButton(
                icon: const Icon(Icons.menu_outlined),
                onPressed: () => SideBarProvider.openMenu(),
              ),
            SizedBox(width: size.width <= 700 ? 5 : 10),
            // Search input
            if (size.width > 390)
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const SearchText(),
              ),
            const Spacer(),
            const NotificationIndicator(),
            const SizedBox(width: 10.0),
            const NavbarAvatar(),
            const SizedBox(width: 10.0),
          ],
        ));
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 10,
        //   )
        // ],
      );
}
