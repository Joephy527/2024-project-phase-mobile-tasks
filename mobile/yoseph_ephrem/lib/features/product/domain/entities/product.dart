import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final int price;

  final String? category;
  final double? rating;
  final int? shoeSize;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.rating,
    this.category,
    this.shoeSize,
  });

  @override
  List<Object?> get props => [id, name, description, imageUrl, price];
}
