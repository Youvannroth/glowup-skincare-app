class ApiProduct {
  final int id;
  final int categoryId;
  final String name;
  final String description;
  final double price;
  final String image;
  final String skinType;
  final String keyIngredients;
  final String category;

  ApiProduct({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.skinType,
    required this.keyIngredients,
    required this.category,
  });

  factory ApiProduct.fromJson(Map<String, dynamic> json) {
    return ApiProduct(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0,
      image: json['image'] ?? '',
      skinType: json['skin_type'] ?? '',
      keyIngredients: json['key_ingredients'] ?? '',
      category: json['category']?['name'] ?? '',
    );
  }
}