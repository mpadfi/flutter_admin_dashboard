import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Icons View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(
                title: 'ac_unit_outlined',
                cardWidth: 200,
                childWidget: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Center(child: Icon(Icons.ac_unit_outlined)),
                ),
              ),
              WhiteCard(
                title: 'wallet_outlined',
                cardWidth: 200,
                childWidget: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Center(child: Icon(Icons.wallet_outlined)),
                ),
              ),
              WhiteCard(
                title: 'shopping_bag',
                cardWidth: 200,
                childWidget: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Center(child: Icon(Icons.shopping_bag_outlined)),
                ),
              ),
              WhiteCard(
                title: 'check_circle',
                cardWidth: 200,
                childWidget: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Center(child: Icon(Icons.check_circle_outlined)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('Buttons', style: CustomLabels.h2),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated'),
              ),
              FilledButton(
                onPressed: () {},
                child: const Text('Filled'),
              ),
              FilledButton.tonal(
                onPressed: () {},
                child: const Text('Filled Tonal'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('TextButton'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xff624ef2))),
                onPressed: () {},
                child: const Text('Outlined'),
              )
            ],
          )
        ],
      ),
    );
  }
}
