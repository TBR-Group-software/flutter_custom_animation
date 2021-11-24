class Product {
  final String id, name, description;
  final int volume;
  final double price;
  final List<String> images;

  Product({
    required this.id,
    required this.name,
    required this.volume,
    required this.price,
    required this.images,
    required this.description,
  });
}
