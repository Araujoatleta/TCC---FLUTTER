import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../widgets/search_bar.dart';

class BarbershopListScreen extends StatelessWidget {
  const BarbershopListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barbearias'),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomSearchBar(
              hintText: 'Buscar barbearia...',
              onSearch: (query) {
                // Handle search
              },
            ),
          ),

          // Filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildFilterChip('Mais próximas'),
                _buildFilterChip('Melhor avaliadas'),
                _buildFilterChip('Promoções'),
                _buildFilterChip('Abertas agora'),
              ],
            ),
          ),

          // Barbershop List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 10, // Replace with actual data
              itemBuilder: (context, index) {
                return _buildBarbershopCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        onSelected: (selected) {
          // Handle filter selection
        },
        backgroundColor: const Color(0xFF252525),
        selectedColor: Colors.amber,
      ),
    );
  }

  Widget _buildBarbershopCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF252525),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Image.network(
            'https://example.com/barbershop.jpg',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Barbearia Vintage',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 14,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '4.5',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Location and Hours
                Row(
                  children: const [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      '2.5 km de distância',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.access_time, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      'Aberto até 20h',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Services
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildServiceChip('Corte'),
                    _buildServiceChip('Barba'),
                    _buildServiceChip('Pigmentação'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}