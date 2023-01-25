import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class WalletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final size = MediaQuery.of(context).size;

    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Wallet View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          Row(
            children: [
              WhiteCard(
                cardWidth: size.width / 6,
                title: 'FIAT',
                subtitle: 'Total',
                childWidget: Text('33,46 EUR', style: CustomLabels.price),
              ),
              WhiteCard(
                cardWidth: size.width / 6,
                title: 'SATOSHIS',
                subtitle: 'Total',
                childWidget: Text('143000 SATS', style: CustomLabels.price),
              ),
              WhiteCard(
                cardWidth: size.width / 6,
                title: 'BITCOIN',
                subtitle: 'Total',
                childWidget: Text('0.00143 BTC', style: CustomLabels.price),
              ),
              WhiteCard(
                cardWidth: size.width / 6,
                title: 'BIT2ME',
                subtitle: 'Total',
                childWidget: Text('500 B2M', style: CustomLabels.price),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
