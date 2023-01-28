import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:admin_dashboard/ui/shared/widgets/navbar.dart';
import 'package:flutter/material.dart';

class DashBoardLayout extends StatefulWidget {
  //
  final Widget child;

  const DashBoardLayout({
    super.key,
    required this.child,
  });

  @override
  State<DashBoardLayout> createState() => _DashBoardLayoutState();
}

class _DashBoardLayoutState extends State<DashBoardLayout> with SingleTickerProviderStateMixin {
  //
  @override
  void initState() {
    super.initState();
    //* INICIALIZACIÓN DEL MENU CONTROLLER (ya que es late)
    SideBarProvider.menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    //
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Row(
                children: [
                  if (size.width >= 700) const Sidebar(),
                  Expanded(
                    child: Column(
                      children: [
                        const Navbar(),
                        //
                        //* VIEW - CONTENIDO DEL LAYOUT

                        Expanded(
                          child: Container(
                            child: widget.child,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (size.width < 700)
                AnimatedBuilder(
                  animation: SideBarProvider.menuController,
                  builder: (context, _) {
                    return Stack(
                      children: [
                        //
                        //* FONDO DEL SIDEBAR
                        if (SideBarProvider.isOpen)
                          AnimatedOpacity(
                            opacity: SideBarProvider.opacity.value,
                            duration: const Duration(milliseconds: 200),
                            child: GestureDetector(
                              onTap: () => SideBarProvider.closeMenu(),
                              child: Container(
                                color: Colors.black26,
                                width: size.width,
                                height: size.height,
                              ),
                            ),
                          ),

                        //* SIDEBAR ANIMACIÓN DE APERTURA
                        Transform.translate(
                          offset: Offset(SideBarProvider.movement.value, 0),
                          child: const Sidebar(),
                        )
                      ],
                    );
                  },
                ),
            ],
          ),
        ));
  }
}
