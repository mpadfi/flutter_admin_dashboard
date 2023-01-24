import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinkBar extends StatelessWidget {
  const LinkBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: (size.width > 1000) ? size.height * 0.075 : null,
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(
            text: 'About',
            onClick: () => print('about'),
          ),
          const LinkText(text: 'Help Center'),
          const LinkText(text: 'Terms and Conditions'),
          const LinkText(text: 'Privacy'),
          const LinkText(text: 'Cookies'),
          const LinkText(text: 'Blog'),
          const LinkText(text: 'Status'),
          const LinkText(text: 'Status'),
        ],
      ),
    );
  }
}
