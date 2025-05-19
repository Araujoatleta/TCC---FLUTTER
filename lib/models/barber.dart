class Barber {
  final String id;
  final String name;
  final String imageUrl;
  final String specialty;
  final double rating;
  final int reviews;

  Barber({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.specialty,
    required this.rating,
    required this.reviews,
  });
}

final List<Barber> barbers = [
  Barber(
    id: '1',
    name: 'Maicon',
    imageUrl: 'https://images.pexels.com/photos/1805600/pexels-photo-1805600.jpeg',
    specialty: 'Corte Degradê',
    rating: 4.8,
    reviews: 128,
  ),
  Barber(
    id: '2',
    name: 'Pedro',
    imageUrl: 'https://images.pexels.com/photos/2061820/pexels-photo-2061820.jpeg',
    specialty: 'Barba',
    rating: 4.7,
    reviews: 98,
  ),
];