import 'package:admin_dashboard/ui/cards/store_card.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class StoresView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final size = MediaQuery.of(context).size;

    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Cashback Destacados', style: CustomLabels.h4),
          const SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              StoreCard(
                img: 'https://polycashback.com/imgTiendas/1.png',
                cardWidth: size.width / 4,
                title: 'Adidas',
                subtitle: 'Indumentaria Deportiva',
                childWidget: Text('2.5% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'https://polycashback.com/imgTiendas/6329c7bfdda06.png',
                cardWidth: size.width / 4,
                title: 'Aliexpress',
                subtitle: 'Tienda Online',
                childWidget: Text('3.46% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'https://polycashback.com/imgTiendas/61f2913723d47.png',
                cardWidth: size.width / 4,
                title: 'Booking ES',
                subtitle: 'Hoteles y Alojamientos',
                childWidget: Text('2% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'https://polycashback.com/imgTiendas/619e0e07453ce.png',
                cardWidth: size.width / 4,
                title: 'Decahtlon',
                subtitle: 'Tienda Deportiva',
                childWidget: Text('1.75% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'https://polycashback.com/imgTiendas/6284ad1e5e17a.png',
                cardWidth: size.width / 4,
                title: 'El Corte Inglés',
                subtitle: 'Tienda Departamental',
                childWidget: Text('2.3% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'https://polycashback.com/imgTiendas/61f28f6e55ba1.png',
                cardWidth: size.width / 4,
                title: 'Iberia',
                subtitle: 'Aerolinea',
                childWidget: Text('0.75% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'https://polycashback.com/imgTiendas/61f28d185d80e.png',
                cardWidth: size.width / 4,
                title: 'Ikea',
                subtitle: 'Tienda de Muebles y Decoración',
                childWidget: Text('2.5% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'https://polycashback.com/imgTiendas/JaponShop.png',
                cardWidth: size.width / 4,
                title: 'Japon Shop',
                subtitle: 'Productos Japoneses',
                childWidget: Text('2.4% cashback máx', style: CustomLabels.cashback),
              ),
              StoreCard(
                img: 'https://polycashback.com/imgTiendas/61cef91c203aa.png',
                cardWidth: size.width / 4,
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
