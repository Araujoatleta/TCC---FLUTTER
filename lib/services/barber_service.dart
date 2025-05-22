import 'package:flutter/material.dart';
import '../models/barber.dart';
import '../models/category.dart';

class BarberService {
  // Get all categories
  Future<List<Category>> getCategories() async {
    // Simulate API request
    await Future.delayed(const Duration(milliseconds: 800));
    
    return [
      Category(
        id: '1',
        name: 'Cabelo',
        imageUrl: 'https://i.ibb.co/0G3qbxZ/hair-category.jpg',
      ),
      Category(
        id: '2',
        name: 'Barba',
        imageUrl: 'https://i.ibb.co/rvYJPnY/beard-category.jpg',
      ),
      Category(
        id: '3',
        name: 'Pigmentação',
        imageUrl: 'https://i.ibb.co/xG1zSpF/pigmentation-category.jpg',
      ),
      Category(
        id: '4',
        name: 'Combos',
        imageUrl: 'https://i.ibb.co/7kpJQ2J/combo-category.jpg',
      ),
      Category(
        id: '5',
        name: 'Hidratação',
        imageUrl: 'https://i.ibb.co/z7yLZpC/hydration-category.jpg',
      ),
      Category(
        id: '6',
        name: 'Penteado',
        imageUrl: 'https://i.ibb.co/cYBCJsj/styling-category.jpg',
      ),
      Category(
        id: '7',
        name: 'Tintura',
        imageUrl: 'https://i.ibb.co/k3LFCDF/dyeing-category.jpg',
      ),
      Category(
        id: '8',
        name: 'Afro',
        imageUrl: 'https://i.ibb.co/S0k7pTL/afro-category.jpg',
      ),
    ];
  }

  // Get popular barbers
  Future<List<Barber>> getPopularBarbers() async {
    // Simulate API request
    await Future.delayed(const Duration(milliseconds: 1000));
    
    return [
      Barber(
        id: '1',
        name: 'Tópete',
        imageUrl: 'https://i.ibb.co/Gv90T9G/barber1.jpg',
        rating: 4.9,
        originalPrice: 45.00,
        discountPrice: 35.00,
        specialties: ['Corte masculino', 'Barba', 'Pigmentação'],
        isPopular: true,
      ),
      Barber(
        id: '2',
        name: 'Tópete',
        imageUrl: 'https://i.ibb.co/jZPdRh3/barber2.jpg',
        rating: 4.8,
        originalPrice: 45.00,
        discountPrice: 35.00,
        specialties: ['Corte clássico', 'Barba designer', 'Hidratação'],
        isPopular: true,
      ),
      Barber(
        id: '3',
        name: 'Tópete',
        imageUrl: 'https://i.ibb.co/M5jRkHC/barber3.jpg',
        rating: 4.7,
        originalPrice: 45.00,
        discountPrice: 35.00,
        specialties: ['Fade', 'Barba', 'Coloração'],
        isPopular: true,
      ),
      Barber(
        id: '4',
        name: 'Tópete',
        imageUrl: 'https://i.ibb.co/WgM9p4c/barber4.jpg',
        rating: 4.6,
        originalPrice: 45.00,
        discountPrice: 35.00,
        specialties: ['Corte moderno', 'Degradê', 'Sobrancelha'],
        isPopular: true,
      ),
    ];
  }

  // Get recently viewed barbers
  Future<List<Barber>> getRecentBarbers() async {
    // Simulate API request
    await Future.delayed(const Duration(milliseconds: 600));
    
    return [
      Barber(
        id: '5',
        name: 'Danilo',
        imageUrl: 'https://i.ibb.co/1Z6BPxK/recent1.jpg',
        rating: 4.5,
        originalPrice: 45.00,
        discountPrice: 35.00,
        specialties: ['Corte feminino', 'Coloração', 'Tratamento'],
      ),
      Barber(
        id: '6',
        name: 'Danilo',
        imageUrl: 'https://i.ibb.co/WP84ZVw/recent2.jpg',
        rating: 4.3,
        originalPrice: 45.00,
        discountPrice: 35.00,
        specialties: ['Penteado', 'Mechas', 'Hidratação'],
      ),
      Barber(
        id: '7',
        name: 'Danilo',
        imageUrl: 'https://i.ibb.co/jv0bDpp/recent3.jpg',
        rating: 4.7,
        originalPrice: 45.00,
        discountPrice: 35.00,
        specialties: ['Alisamento', 'Corte longo', 'Tratamento capilar'],
      ),
    ];
  }

  // Get featured products/combos
  Future<List<Barber>> getFeaturedBarbers() async {
    // Simulate API request
    await Future.delayed(const Duration(milliseconds: 700));
    
    return [
      Barber(
        id: '8',
        name: 'Marcano',
        imageUrl: 'https://i.ibb.co/DY3Gk11/featured1.jpg',
        rating: 4.8,
        originalPrice: 40.00,
        discountPrice: 30.00,
        specialties: ['Barba', 'Modelagem', 'Tintura'],
      ),
      Barber(
        id: '9',
        name: 'Neymar',
        imageUrl: 'https://i.ibb.co/1LqQbxN/featured2.jpg',
        rating: 4.9,
        originalPrice: 40.00,
        discountPrice: 30.00,
        specialties: ['Corte masculino', 'Degradê', 'Finalização'],
      ),
    ];
  }

  // Get promotion details
  Future<Map<String, dynamic>> getPromotion() async {
    // Simulate API request
    await Future.delayed(const Duration(milliseconds: 500));
    
    return {
      'title': 'Barba',
      'price': 25.00,
      'imageUrl': 'https://i.ibb.co/HxTjxP3/promotion.jpg',
      'description': 'Aproveite nosso preço especial para barba!',
    };
  }

  // Get combo promotion
  Future<Map<String, dynamic>> getComboPromotion() async {
    // Simulate API request
    await Future.delayed(const Duration(milliseconds: 500));
    
    return {
      'title': 'Combo Premium',
      'description': 'Corte + Barba + Tratamento',
      'price': 65.00,
      'imageUrl': 'https://i.ibb.co/YTgRMBQ/combo-promotion.jpg',
      'rating': 4.9,
    };
  }
}