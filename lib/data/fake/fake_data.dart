import '../models/product.dart';

const products = <Product>[
  Product(
    id: 'c1',
    category: 'Cleanser',
    name: 'Green Plum',
    price: 13,
    rating: 4.5,
    imageAsset: 'assets/images/green_plum.png',
    description: 'Brightening cleanser with water to gently remove impurities',
    skinType: 'All Skin Type',
    keyIngredients: 'Water',
  ),
  Product(
    id: 'c2',
    category: 'Cleanser',
    name: 'Rice water Bright',
    price: 5.87,
    rating: 4.5,
    imageAsset: 'assets/images/rice_water.png',
    description: 'Brightening cleanser with rice water to gently remove impurities',
    skinType: 'All Skin Type',
    keyIngredients: 'Water',
  ),
  
];

List<Product> productsByCategory(String cat) =>
    products.where((p) => p.category == cat).toList();