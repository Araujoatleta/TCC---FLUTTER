import 'package:flutter/material.dart';
import '../../models/barber.dart';
import '../../models/category.dart';
import '../../services/barber_service.dart';
import 'components/category_section.dart';
import 'components/promotion_section.dart';
import 'components/suggestions_section.dart';
import 'components/recent_section.dart';
import 'components/featured_section.dart';
import 'components/combo_section.dart';
import '../../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BarberService _barberService = BarberService();
  
  late Future<List<Category>> _categoriesFuture;
  late Future<List<Barber>> _popularBarbersFuture;
  late Future<List<Barber>> _recentBarbersFuture;
  late Future<List<Barber>> _featuredBarbersFuture;
  late Future<Map<String, dynamic>> _promotionFuture;
  late Future<Map<String, dynamic>> _comboPromotionFuture;
  
  @override
  void initState() {
    super.initState();
    _loadData();
  }
  
  void _loadData() {
    _categoriesFuture = _barberService.getCategories();
    _popularBarbersFuture = _barberService.getPopularBarbers();
    _recentBarbersFuture = _barberService.getRecentBarbers();
    _featuredBarbersFuture = _barberService.getFeaturedBarbers();
    _promotionFuture = _barberService.getPromotion();
    _comboPromotionFuture = _barberService.getComboPromotion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _loadData();
            });
          },
          child: CustomScrollView(
            slivers: [
              // App bar with search
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: CustomSearchBar(
                    hintText: 'Procure um barbeiro ou serviço...',
                    onSearch: (query) {
                      // Handle search
                    },
                  ),
                ),
              ),
              
              // Promotion Banner
              SliverToBoxAdapter(
                child: FutureBuilder<Map<String, dynamic>>(
                  future: _promotionFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (snapshot.hasData) {
                      return PromotionSection(promotion: snapshot.data!);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              
              // Categories
              SliverToBoxAdapter(
                child: FutureBuilder<List<Category>>(
                  future: _categoriesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (snapshot.hasData) {
                      return CategorySection(categories: snapshot.data!);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              
              // Suggestions
              SliverToBoxAdapter(
                child: FutureBuilder<List<Barber>>(
                  future: _popularBarbersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (snapshot.hasData) {
                      return SuggestionsSection(barbers: snapshot.data!);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              
              // Recently viewed
              SliverToBoxAdapter(
                child: FutureBuilder<List<Barber>>(
                  future: _recentBarbersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (snapshot.hasData) {
                      return RecentSection(barbers: snapshot.data!);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              
              // Combo promotion
              SliverToBoxAdapter(
                child: FutureBuilder<Map<String, dynamic>>(
                  future: _comboPromotionFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (snapshot.hasData) {
                      return ComboSection(combo: snapshot.data!);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              
              // Featured products
              SliverToBoxAdapter(
                child: FutureBuilder<List<Barber>>(
                  future: _featuredBarbersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (snapshot.hasData) {
                      return FeaturedSection(barbers: snapshot.data!);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              
              // Bottom padding
              const SliverToBoxAdapter(
                child: SizedBox(height: 80),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Home', true),
            _buildNavItem(Icons.search, 'Buscar', false),
            _buildNavItem(Icons.calendar_today, 'Agenda', false),
            _buildNavItem(Icons.person, 'Perfil', false),
          ],
        ),
      ),
    );
  }
  
  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return InkWell(
      onTap: () {
        // Handle navigation
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? Theme.of(context).primaryColor : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Theme.of(context).primaryColor : Colors.grey,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}