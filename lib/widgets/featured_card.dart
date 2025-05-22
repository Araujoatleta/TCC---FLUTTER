import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/barber.dart';
import '../screens/service/service_details_screen.dart';

class FeaturedCard extends StatelessWidget {
  final Barber barber;
  
  const FeaturedCard({
    Key? key,
    required this.barber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailsScreen(
              title: barber.name,
              description: barber.specialties.join(', '),
              price: barber.discountPrice,
              originalPrice: barber.originalPrice,
              rating: barber.rating,
              imageUrl: barber.imageUrl,
              location: 'Rua André Silva, 17 perto do grêmio',
              openHours: 'Aberto das 9 às 17h',
              styles: barber.specialties,
            ),
          ),
        );
      },
      child: Container(
        width: 110,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF252525),
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image
            SizedBox(
              height: 80,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: barber.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: const Color(0xFF2C2C2C),
                  child: const Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white38),
                      ),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: const Color(0xFF2C2C2C),
                  child: const Icon(
                    Icons.error_outline,
                    color: Colors.white38,
                  ),
                ),
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Name
                  Text(
                    barber.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 4),
                  
                  // Price
                  Row(
                    children: [
                      Text(
                        'R\$ ${barber.originalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 10,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'R\$ ${barber.discountPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}