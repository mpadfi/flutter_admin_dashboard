import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

import 'package:admin_dashboard/ui/cards/home_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final size = MediaQuery.of(context).size;
    final user = Provider.of<AuthProvider>(context).user!;

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Row(
            children: [
              Icon(Icons.person_pin, size: 48, color: const Color(0xff624ef2).withOpacity(0.2)),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.nombre, style: CustomLabels.h2),
                  Text(user.correo, style: CustomLabels.p),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                direction: Axis.horizontal,
                children: [
                  HomeCard(
                    cardWidth: size.width < 700 ? 160 : 250,
                    subtitle: 'Total',
                    title: '18776 SATS',
                    childWidget: Text('3,92 EUR', style: CustomLabels.price),
                  ),
                  HomeCard(
                    cardWidth: size.width < 700 ? 160 : 250,
                    subtitle: 'Disponible',
                    title: '1500 SATS',
                    childWidget: Text('0,313 EUR', style: CustomLabels.price),
                  ),
                ],
              ),

              //* ACTIVIDAD
              Container(
                margin: const EdgeInsets.all(12.0),
                // padding: const EdgeInsets.all(20.0),
                width: 520,
                // height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Actividad reciente', style: CustomLabels.h3),
                    const SizedBox(height: 10),
                    const ActividadItem(date: '27/09/2022', store: 'BRUK Barra', desc: 'Compra en BRL', status: 'Pendiente', crypto: '258', fiat: '0,050'),
                    const ActividadItem(date: '22/09/2022', store: 'Un Lugar de...', desc: 'Compra en MXN', status: 'Pendiente', crypto: '35', fiat: '0,010'),
                    const ActividadItem(date: '08/04/2022', store: 'GoDaddy', desc: 'Compra en EUR', status: 'Confirmada', crypto: '19500', fiat: '4,04'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ActividadItem extends StatelessWidget {
  //
  final String date;
  final String store;
  final String desc;
  final String status;
  final String crypto;
  final String fiat;

  const ActividadItem({
    Key? key,
    required this.date,
    required this.store,
    required this.desc,
    required this.status,
    required this.crypto,
    required this.fiat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date, style: CustomLabels.date),
              const SizedBox(height: 4),
              Text(
                store,
                style: CustomLabels.h4,
                overflow: TextOverflow.ellipsis,
              ),
              Text(desc),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  (status == 'Confirmada') ? const Icon(Icons.check_circle, size: 16, color: Colors.green) : const Icon(Icons.schedule, size: 16),
                  const SizedBox(width: 2),
                  Text(
                    status,
                    style: (status == 'Confirmada') ? CustomLabels.confirmed : CustomLabels.pending,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text('SATS $crypto', style: CustomLabels.h4),
              Text('EUR $fiat', style: CustomLabels.priceSmall),
            ],
          ),
        ],
      ),
    );
  }
}
