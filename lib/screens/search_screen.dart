import 'package:flutter/material.dart';
import '../constants/theme.dart';
import '../widgets/search_bar_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Pesquisar',
                      style: AppTheme.headingStyle,
                    ),
                  ),
                  _buildProfileAvatar(),
                ],
              ),
              const SizedBox(height: 16),
              const SearchBarWidget(),
              const SizedBox(height: 24),
              Text(
                'Pesquisas Recentes',
                style: AppTheme.subtitleStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildRecentSearch('Barbearia perto de mim'),
              _buildRecentSearch('Corte degradê'),
              _buildRecentSearch('Barba completa'),
              const SizedBox(height: 24),
              Text(
                'Categorias Populares',
                style: AppTheme.subtitleStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildCategoryChip('Corte Masculino'),
                  _buildCategoryChip('Barba'),
                  _buildCategoryChip('Degradê'),
                  _buildCategoryChip('Relaxamento'),
                  _buildCategoryChip('Sobrancelha'),
                  _buildCategoryChip('Tintura'),
                ],
              ),
            ],
          ),
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

  Widget _buildRecentSearch(String query) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          const Icon(
            Icons.history,
            color: AppTheme.textSecondaryColor,
            size: 18,
          ),
          const SizedBox(width: 12),
          Text(
            query,
            style: AppTheme.bodyStyle,
          ),
          const Spacer(),
          const Icon(
            Icons.close,
            color: AppTheme.textSecondaryColor,
            size: 18,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Chip(
      backgroundColor: AppTheme.cardColor,
      label: Text(
        label,
        style: AppTheme.smallStyle,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    );
  }
}