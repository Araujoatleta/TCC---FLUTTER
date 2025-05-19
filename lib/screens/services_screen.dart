import 'package:flutter/material.dart';
import '/constants/theme.dart';
import '/models/barber_shop.dart';
import '/widgets/shop_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Serviços',
                      style: AppTheme.headingStyle,
                    ),
                    _buildProfileAvatar(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _buildServiceCategory('Cortes de Cabelo'),
                    const SizedBox(height: 16),
                    _buildServiceItem('Corte Básico', 'R\$ 35,00', Icons.content_cut),
                    _buildServiceItem('Corte Degradê', 'R\$ 45,00', Icons.content_cut),
                    _buildServiceItem('Corte Navalhado', 'R\$ 50,00', Icons.content_cut),
                    _buildServiceItem('Corte Premium', 'R\$ 60,00', Icons.content_cut),
                    
                    const SizedBox(height: 24),
                    _buildServiceCategory('Barba'),
                    const SizedBox(height: 16),
                    _buildServiceItem('Barba Simples', 'R\$ 25,00', Icons.face),
                    _buildServiceItem('Barba Completa', 'R\$ 35,00', Icons.face),
                    _buildServiceItem('Barba com Toalha Quente', 'R\$ 45,00', Icons.face),
                    
                    const SizedBox(height: 24),
                    _buildServiceCategory('Tratamentos'),
                    const SizedBox(height: 16),
                    _buildServiceItem('Hidratação', 'R\$ 40,00', Icons.spa),
                    _buildServiceItem('Pigmentação', 'R\$ 60,00', Icons.opacity),
                    _buildServiceItem('Sobrancelha', 'R\$ 20,00', Icons.remove_red_eye),
                    
                    const SizedBox(height: 24),
                    _buildServiceCategory('Pacotes'),
                    const SizedBox(height: 16),
                    _buildServiceItem('Corte + Barba', 'R\$ 70,00', Icons.bookmark),
                    _buildServiceItem('Corte + Barba + Sobrancelha', 'R\$ 85,00', Icons.bookmark),
                    _buildServiceItem('VIP (Todos os serviços)', 'R\$ 120,00', Icons.star),
                    
                    const SizedBox(height: 24),
                    Text(
                      'Barbearias Recomendadas',
                      style: AppTheme.headingStyle,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ShopCard(shop: featuredBarberShops[index % featuredBarberShops.length]);
                  },
                  childCount: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppTheme.accentColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          'PH',
          style: AppTheme.bodyStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCategory(String title) {
    return Text(
      title,
      style: AppTheme.subtitleStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildServiceItem(String name, String price, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: AppTheme.accentColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: AppTheme.bodyStyle,
            ),
          ),
          Text(
            price,
            style: AppTheme.bodyStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}