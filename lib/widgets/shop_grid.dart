import 'package:flutter/material.dart';
import '/models/barber_shop.dart';
import '/widgets/shop_card.dart';

class ShopGrid extends StatelessWidget {
  final List<BarberShop> shops;

  const ShopGrid({
    super.key,
    required this.shops,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: shops.length,
      itemBuilder: (context, index) {
        return ShopCard(shop: shops[index]);
      },
    );
  }
}