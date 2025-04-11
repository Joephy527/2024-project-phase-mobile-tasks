import 'package:flutter/material.dart';

class CardItem {
  final String title;
  final int id;
  final int price;
  final String category;
  final double rating;
  final int shoeSize;
  final String description;

  CardItem({
    required this.title,
    required this.price,
    required this.category,
    required this.rating,
    required this.shoeSize,
    required this.description,
    required this.id,
  });
}

class ProductData with ChangeNotifier {
  final List<CardItem> _data = [
    CardItem(
      id: 1,
      title: 'Derby Leather Shoes',
      price: 120,
      category: 'Men’s shoe',
      rating: 4.0,
      shoeSize: 41,
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
    ),
    CardItem(
      id: 2,
      title: 'Derby Leather Shoes',
      price: 120,
      category: 'Men’s shoe',
      rating: 4.0,
      shoeSize: 41,
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
    ),
    CardItem(
      id: 3,
      title: 'Derby Leather Shoes',
      price: 120,
      category: 'Men’s shoe',
      rating: 4.0,
      shoeSize: 41,
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
    ),
  ];

  List<CardItem> get data => _data;

  void deleteItem(CardItem item) {
    _data.remove(item);
    notifyListeners();
  }
}
