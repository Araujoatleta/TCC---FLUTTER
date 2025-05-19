import 'package:flutter/material.dart';
import '/models/barber_shop.dart';
import '/constants/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/widgets/search_bar_widget.dart';
import '/widgets/featured_shops_carousel.dart';

class DetailScreen extends StatelessWidget {
  final BarberShop shop;

  const DetailScreen({
    super.key,
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  SearchBarWidget(),
                  const SizedBox(height: 24),
                  Text(
                    'Destaques',
                    style: AppTheme.headingStyle,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FeaturedShopsCarousel(shops: featuredBarberShops),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Sobre ${shop.name}',
                    style: AppTheme.headingStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Endereço: ${shop.address}',
                    style: AppTheme.bodyStyle,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Nossa barbearia oferece os melhores serviços de corte, barba e tratamentos capilares. Com profissionais experientes e ambiente aconchegante, garantimos que sua experiência será única.',
                    style: TextStyle(color: AppTheme.textSecondaryColor),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Serviços',
                    style: AppTheme.headingStyle,
                  ),
                  const SizedBox(height: 16),
                  _buildServiceItem('Corte de Cabelo', 'R\$ 45,00'),
                  _buildServiceItem('Barba', 'R\$ 35,00'),
                  _buildServiceItem('Corte + Barba', 'R\$ 70,00'),
                  _buildServiceItem('Sobrancelha', 'R\$ 20,00'),
                  _buildServiceItem('Pigmentação', 'R\$ 60,00'),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.accentColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Agendar Horário',
                        style: AppTheme.bodyStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(String name, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: AppTheme.bodyStyle),
          Text(price, style: AppTheme.bodyStyle.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: shop.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.favorite_border, color: Colors.white),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.share, color: Colors.white),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}