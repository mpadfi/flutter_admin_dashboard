import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class WhiteCard extends StatelessWidget {
  //
  final String? title;
  final String? subtitle;
  final double? cardWidth;
  final Widget childWidget;

  const WhiteCard({
    super.key,
    this.title,
    this.subtitle,
    required this.childWidget,
    this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: cardWidth,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(20),
        decoration: buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              FittedBox(
                fit: BoxFit.contain,
                child: Text(title!, style: CustomLabels.h3),
              ),
            if (subtitle != null)
              FittedBox(
                fit: BoxFit.contain,
                child: Text(subtitle!, style: CustomLabels.h4),
              ),
            childWidget,
          ],
        ));
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.14),
          blurRadius: 10,
        )
      ],
    );
  }
}
