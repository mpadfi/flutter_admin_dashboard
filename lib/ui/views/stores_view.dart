import 'package:admin_dashboard/ui/cards/store_card.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class StoresView extends StatelessWidget {
  const StoresView({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(30.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Cashback Destacados', style: CustomLabels.h2),
          const SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            spacing: 4,
            runSpacing: 4,
            children: [
              StoreCard(
                img: 'adidas.png',
                cardWidth: size.width < 700 ? size.width : size.width / 4,
                title: 'Adidas',
                subtitle: 'Indumentaria Deportiva',
                childWidget: Text('2.5% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'aliexpress.png',
                cardWidth: size.width < 700 ? size.width : size.width / 4,
                title: 'Aliexpress',
                subtitle: 'Tienda Online',
                childWidget: Text('3.46% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'booking.png',
                cardWidth: size.width < 700 ? size.width : size.width / 4,
                title: 'Booking ES',
                subtitle: 'Hoteles y Alojamientos',
                childWidget: Text('2% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'decathlon.png',
                cardWidth: size.width < 700 ? size.width : size.width / 4,
                title: 'Decahtlon',
                subtitle: 'Tienda Deportiva',
                childWidget: Text('1.75% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'corteingles.jpeg',
                cardWidth: size.width < 700 ? size.width : size.width / 4,
                title: 'El Corte Inglés',
                subtitle: 'Tienda Departamental',
                childWidget: Text('2.3% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'iberia.jpeg',
                cardWidth: size.width < 700 ? size.width : size.width / 4,
                title: 'Iberia',
                subtitle: 'Aerolinea',
                childWidget: Text('0.75% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'ikea.jpeg',
                cardWidth: size.width < 700 ? size.width : size.width / 4,
                title: 'Ikea',
                subtitle: 'Tienda de Muebles y Decoración',
                childWidget: Text('2.5% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'japonshop.jpeg',
                cardWidth: size.width < 700 ? size.width : size.width / 4,
                title: 'Japon Shop',
                subtitle: 'Productos Japoneses',
                childWidget: Text('2.4% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'lidl.png',
                cardWidth: size.width < 700 ? size.width : size.width / 4,
                title: 'Lidl',
                subtitle: 'Supermercados',
                childWidget: Text('3.5% cashback máx', style: CustomLabels.cashback),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
