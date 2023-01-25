import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Dashboard View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          WhiteCard(
            title: 'FIAT',
            subtitle: 'Total',
            childWidget: Text('33,46 EUR', style: CustomLabels.price),
          ),
          WhiteCard(
            title: 'SATOSHIS',
            subtitle: 'Total',
            childWidget: Text('143000 SATS', style: CustomLabels.price),
          ),
        ],
      ),
    );
  }
}
