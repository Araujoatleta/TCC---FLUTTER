class BarberShop {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final String address;
  final bool isFeatured;

  BarberShop({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.address,
    this.isFeatured = false,
  });
}

final List<BarberShop> featuredBarberShops = [
  BarberShop(
    id: '1',
    name: 'Barber sul',
    location: 'Rua Santa Maria',
    imageUrl: 'https://images.pexels.com/photos/1319460/pexels-photo-1319460.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    address: '21 de Julho, Rua Santa Maria',
    isFeatured: true,
  ),
  BarberShop(
    id: '2',
    name: 'Invencible Barbearia',
    location: 'Av. Broadway',
    imageUrl: 'https://images.pexels.com/photos/1813272/pexels-photo-1813272.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    address: 'Jordão, 456, Barueri',
    isFeatured: true,
  ),
];

final List<BarberShop> allBarberShops = [
  ...featuredBarberShops,
  BarberShop(
    id: '3',
    name: 'Barbearia Factory',
    location: 'Centro',
    imageUrl: 'https://images.pexels.com/photos/1805600/pexels-photo-1805600.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    address: 'Rua Sete de Setembro, 123',
  ),
  BarberShop(
    id: '4',
    name: 'Barbearia Empório',
    location: 'Vila Nova',
    imageUrl: 'https://images.pexels.com/photos/2061820/pexels-photo-2061820.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    address: 'Av. das Indústrias, 789',
  ),
  BarberShop(
    id: '5',
    name: 'Corte & Estilo',
    location: 'Jardim América',
    imageUrl: 'https://images.pexels.com/photos/3998429/pexels-photo-3998429.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    address: 'Rua das Flores, 456',
  ),
  BarberShop(
    id: '6',
    name: 'Modern Cut',
    location: 'Liberdade',
    imageUrl: 'https://images.pexels.com/photos/2076930/pexels-photo-2076930.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    address: 'Av. Paulista, 987',
  ),
];