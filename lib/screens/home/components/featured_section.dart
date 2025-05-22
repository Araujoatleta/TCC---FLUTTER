import 'package:flutter/material.dart';
import '../../../models/barber.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/featured_card.dart';

class FeaturedSection extends StatelessWidget {
  final List<Barber> barbers;
  
  const FeaturedSection({
    Key? key,
    required this.barbers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: SectionHeader(
            title: 'Produtos promocionais',
            actionLabel: 'Ver todos',
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: barbers.length,
            itemBuilder: (context, index) {
              final barber = barbers[index];
              return FeaturedCard(barber: barber);
            },
          ),
        ),
      ],
    );
  }
}