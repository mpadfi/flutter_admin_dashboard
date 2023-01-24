import 'package:admin_dashboard/ui/layouts/auth/widgets/background_login.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    //
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            (size.width > 1000) ? _DesktopBody(child: child) : _MobileBody(child: child),
            // Link
            const LinkBar(),
          ],
        ),
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.95,
        color: Colors.black,
        child: Row(
          children: [
            // Imagen lateral login-registro
            const Expanded(child: BackgroundLogin()),
            //* LOGIN VIEW CONTAINER
            Container(
              width: 600,
              height: double.infinity,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  const CustomTitle(),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: child,
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _MobileBody extends StatelessWidget {
  //
  final Widget child;
  const _MobileBody({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          const CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 460,
            child: child,
          ),
          const SizedBox(
            width: double.infinity,
            height: 400,
            child: BackgroundLogin(),
          )
        ],
      ),
    );
  }
}
