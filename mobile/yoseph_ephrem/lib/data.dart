import 'package:flutter/material.dart';
import 'features/product/domain/entities/product.dart';

class ProductData with ChangeNotifier {
  static final ProductData _instance = ProductData._internal();

  factory ProductData() => _instance;

  ProductData._internal();

  final List<Product> _data = [
    Product(
      id: 1,
      name: 'Derby Leather Shoes',
      price: 120,
      category: 'Men’s shoe',
      imageUrl: "",
      rating: 4.0,
      shoeSize: 41,
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
    ),
    Product(
      id: 2,
      name: 'Derby Leather Shoes',
      price: 120,
      category: 'Men’s shoe',
      imageUrl: "",
      rating: 4.0,
      shoeSize: 41,
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
    ),
    Product(
      id: 3,
      name: 'Derby Leather Shoes',
      price: 120,
      category: 'Men’s shoe',
      imageUrl: "",
      rating: 4.0,
      shoeSize: 41,
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
    ),
  ];

  List<Product> get data => _data;

  void deleteItem(Product item) {
    _data.remove(item);
    notifyListeners();
  }
}
