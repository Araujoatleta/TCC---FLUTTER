import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../models/barber.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/barber_card.dart';

class SuggestionsSection extends StatelessWidget {
  final List<Barber> barbers;
  
  const SuggestionsSection({
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
            title: 'Sugestões',
            subtitle: 'Para você',
            actionLabel: 'Ver todas',
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: barbers.length,
            itemBuilder: (context, index) {
              final barber = barbers[index];
              return BarberCard(barber: barber);
            },
          ),
        ),
      ],
    );
  }
}