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
    //
    final width = MediaQuery.of(context).size.width;

    return Container(
        width: cardWidth,
        margin: EdgeInsets.all(width < 700 ? 4 : 8),
        padding: EdgeInsets.all(width < 700 ? 10 : 16),
        decoration: storeBoxDecoration(),
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
                    child: Text(title!, style: CustomLabels.h4),
                  ),
                if (subtitle != null)
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(subtitle!, style: CustomLabels.storedesc),
                  ),
                const SizedBox(height: 3),
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

  BoxDecoration storeBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      // color: Colors.grey.withOpacity(0.05),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.black12, width: 0.6),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.black.withOpacity(0.10),
      //     blurRadius: 10,
      //   )
      // ],
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
    //
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width < 700 ? 60 : 70,
      height: width < 700 ? 60 : 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 14,
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
