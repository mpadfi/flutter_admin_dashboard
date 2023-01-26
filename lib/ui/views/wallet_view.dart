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
          Text('Balance', style: CustomLabels.h2),
          const SizedBox(height: 10),
          Wrap(
            children: [
              WhiteCard(
                cardWidth: size.width < 700 ? size.width : size.width / 6,
                title: 'FIAT',
                subtitle: 'Total',
                childWidget: Text('33,46 EUR', style: CustomLabels.price),
              ),
              WhiteCard(
                cardWidth: size.width < 700 ? size.width : size.width / 6,
                title: 'SATOSHIS',
                subtitle: 'Total',
                childWidget: Text('143000 SATS', style: CustomLabels.price),
              ),
              WhiteCard(
                cardWidth: size.width < 700 ? size.width : size.width / 6,
                title: 'BITCOIN',
                subtitle: 'Total',
                childWidget: Text('0.00143 BTC', style: CustomLabels.price),
              ),
              WhiteCard(
                cardWidth: size.width < 700 ? size.width : size.width / 6,
                title: 'BIT2ME',
                subtitle: 'Total',
                childWidget: Text('500 B2M', style: CustomLabels.price),
              ),
            ],
          ),
          const SizedBox(height: 20),
          size.width > 700
              ? Table(
                  children: [
                    TableRow(decoration: const BoxDecoration(), children: [
                      SizedBox(height: 35, child: Container()),
                      TableCell(child: Text('FIAT', style: CustomLabels.h4)),
                      TableCell(child: Text('SATHOSHIS', style: CustomLabels.h4)),
                      TableCell(child: Text('BITCOIN', style: CustomLabels.h4)),
                      TableCell(child: Text('BIT2ME', style: CustomLabels.h4)),
                    ]),
                    TableRow(children: [
                      SizedBox(height: 35, child: Text('Pendiente', style: CustomLabels.h4.copyWith(color: Colors.amber[500]))),
                      TableCell(child: Text('3,28 EUR', style: CustomLabels.p)),
                      TableCell(child: Text('15562 SATS', style: CustomLabels.p)),
                      TableCell(child: Text('0,00015562 BTC', style: CustomLabels.p)),
                      TableCell(child: Text('500 B2M', style: CustomLabels.p)),
                    ]),
                    TableRow(children: [
                      SizedBox(height: 35, child: Text('Disponible', style: CustomLabels.h4.copyWith(color: Colors.green))),
                      TableCell(child: Text('30,53 EUR', style: CustomLabels.p)),
                      TableCell(child: Text('127340 SATS', style: CustomLabels.p)),
                      TableCell(child: Text('0,0012734 BTC', style: CustomLabels.p)),
                      TableCell(child: Text('500 B2M', style: CustomLabels.p)),
                    ]),
                    TableRow(children: [
                      SizedBox(height: 35, child: Text('Total', style: CustomLabels.h4)),
                      TableCell(child: Text('33,81 EUR', style: CustomLabels.p)),
                      TableCell(child: Text('142902 SATS', style: CustomLabels.p)),
                      TableCell(child: Text('0,00142902 BTC', style: CustomLabels.p)),
                      TableCell(child: Text('500 B2M', style: CustomLabels.p)),
                    ]),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
