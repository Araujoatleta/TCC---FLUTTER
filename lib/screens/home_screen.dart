import 'package:flutter/material.dart';
import '../widgets/service_card.dart';
import '../widgets/category_card.dart';
import '../widgets/promotion_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Procure barbeiros desejados...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    filled: true,
                    fillColor: const Color(0xFF1A1A1A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  ),
                ),
                const SizedBox(height: 20),
                const PromotionCarousel(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categorias',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Ver todos',
                        style: TextStyle(
                          color: Color(0xFFF5A623),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CategoryCard(
                        image: 'assets/categories/cacheados.jpg',
                        title: 'Cacheados',
                      ),
                      SizedBox(width: 12),
                      CategoryCard(
                        image: 'assets/categories/barba.jpg',
                        title: 'Barba',
                      ),
                      SizedBox(width: 12),
                      CategoryCard(
                        image: 'assets/categories/franja.jpg',
                        title: 'Franja',
                      ),
                      SizedBox(width: 12),
                      CategoryCard(
                        image: 'assets/categories/tranca.jpg',
                        title: 'Trança',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sugestões',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Ver todos',
                        style: TextStyle(
                          color: Color(0xFFF5A623),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.8,
                  children: const [
                    ServiceCard(
                      image: 'assets/services/service1.jpg',
                      title: 'Topete',
                      description: 'corte de cabelo',
                      price: 45.00,
                      discountPrice: 45.00,
                      rating: 5,
                    ),
                    ServiceCard(
                      image: 'assets/services/service2.jpg',
                      title: 'Topete',
                      description: 'corte de cabelo',
                      price: 45.00,
                      discountPrice: 45.00,
                      rating: 5,
                    ),
                    ServiceCard(
                      image: 'assets/services/service3.jpg',
                      title: 'Topete',
                      description: 'corte de cabelo',
                      price: 45.00,
                      discountPrice: 45.00,
                      rating: 5,
                    ),
                    ServiceCard(
                      image: 'assets/services/service4.jpg',
                      title: 'Topete',
                      description: 'corte de cabelo',
                      price: 45.00,
                      discountPrice: 45.00,
                      rating: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}