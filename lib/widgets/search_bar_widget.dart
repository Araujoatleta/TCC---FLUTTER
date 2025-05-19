import 'package:flutter/material.dart';
import '/constants/theme.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        style: AppTheme.bodyStyle,
        decoration: InputDecoration(
          hintText: 'Procure serviços barberarias...',
          hintStyle: AppTheme.subtitleStyle,
          prefixIcon: const Icon(Icons.search, color: AppTheme.textSecondaryColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}