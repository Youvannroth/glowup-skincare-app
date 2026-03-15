class Product {
  final String id;
  final String category;
  final String name;
  final double price;
  final double rating;
  final String imageAsset;
  final String description;
  final String skinType;
  final String keyIngredients;

  const Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.rating,
    required this.imageAsset,
    required this.description,
    required this.skinType,
    required this.keyIngredients,
  });
}