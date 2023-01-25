import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  //
  final String? img;
  final String? title;
  final String? subtitle;
  final double? cardWidth;
  final Widget childWidget;

  const StoreCard({
    super.key,
    this.img,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StoreImage(img: img),
            Column(
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
                    child: Text(subtitle!, style: CustomLabels.storedesc),
                  ),
                childWidget,
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline, color: Colors.pink),
            )
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

class StoreImage extends StatelessWidget {
  final String? img;

  const StoreImage({
    super.key,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ],
      ),
      child: (img != '')
          ? ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                img!,
                fit: BoxFit.fitWidth,
              ),
            )
          : null,
    );
  }
}
