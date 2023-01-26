import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  //
  final String? title;
  final String? subtitle;
  final double? cardWidth;
  final Widget childWidget;

  const HomeCard({
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
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(20),
        decoration: buildBoxDecoration(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (subtitle != null)
              FittedBox(
                fit: BoxFit.contain,
                child: Text(subtitle!, style: CustomLabels.h4),
              ),
            if (title != null)
              FittedBox(
                fit: BoxFit.contain,
                child: Text(title!, style: CustomLabels.h3),
              ),
            childWidget,
          ],
        ));
  }

  BoxDecoration buildBoxDecoration(context) {
    final size = MediaQuery.of(context).size;
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: size.width > 700 ? Border.all(color: Colors.black12) : null,
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.black.withOpacity(0.10),
      //     blurRadius: 20,
      //   )
      // ],
    );
  }
}
