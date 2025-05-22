import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PromotionSection extends StatelessWidget {
  final Map<String, dynamic> promotion;
  
  const PromotionSection({
    Key? key,
    required this.promotion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF252525),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Background image
            CachedNetworkImage(
              imageUrl: promotion['imageUrl'],
              height: 140,
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
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    promotion['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  
                  const SizedBox(height: 4),
                  
                  Text(
                    'R\$ ${promotion['price'].toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Call to action button (optional)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Agendar',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
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
                  _buildIndicatorDot(false),
                ],
              ),
            ),
          ],
        ),
      ),
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