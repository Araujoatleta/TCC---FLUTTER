import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../widgets/section_header.dart';

class ComboSection extends StatelessWidget {
  final Map<String, dynamic> combo;
  
  const ComboSection({
    Key? key,
    required this.combo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: SectionHeader(
            title: 'Combos',
            subtitle: 'Na primeira 10% off',
            actionLabel: 'Ver todos',
          ),
        ),
        Container(
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xFF252525),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              // Image
              CachedNetworkImage(
                imageUrl: combo['imageUrl'],
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: const Color(0xFF2C2C2C),
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white38),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: const Color(0xFF2C2C2C),
                  child: const Icon(
                    Icons.error_outline,
                    color: Colors.white38,
                    size: 32,
                  ),
                ),
              ),
              
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
              
              // Content at bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ratings
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: combo['rating'] ?? 4.5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 16,
                            ignoreGestures: true,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Title
                      Text(
                        combo['title'] ?? 'Combo Premium',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 4),
                      
                      // Description
                      Text(
                        combo['description'] ?? 'Corte + Barba',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Price and button
                      Row(
                        children: [
                          // Price
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'R\$ ${(combo['price'] * 1.1).toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.6),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                'R\$ ${combo['price'].toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                          
                          const Spacer(),
                          
                          // Button
                          ElevatedButton(
                            onPressed: () {
                              // Handle booking
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                            child: const Text('Agendar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              // Indicator dots
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIndicatorDot(true),
                    _buildIndicatorDot(false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildIndicatorDot(bool isActive) {
    return Container(
      width: isActive ? 16 : 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isActive ? Colors.white : Colors.white.withOpacity(0.4),
      ),
    );
  }
}