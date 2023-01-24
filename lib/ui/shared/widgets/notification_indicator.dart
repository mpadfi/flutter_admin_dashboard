import 'package:flutter/material.dart';

class NotificationIndicator extends StatelessWidget {
  const NotificationIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        const Icon(
          Icons.notifications_none_outlined,
          color: Colors.grey,
        ),
        Positioned(
          left: 2,
          child: Container(
            width: 5,
            height: 5,
            decoration: buildDecoration(),
          ),
        )
      ],
    ));
  }

  BoxDecoration buildDecoration() {
    return BoxDecoration(
      color: Colors.pink,
      borderRadius: BorderRadius.circular(100),
    );
  }
}
