import 'dart:convert';

import 'package:yoseph_ephrem/features/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yoseph_ephrem/features/product/domain/entities/product.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const productModel = ProductModel(
    id: 1,
    name: 'Derby Leather Shoes',
    price: 120,
    category: 'Men’s shoe',
    imageUrl: "",
    rating: 4.0,
    shoeSize: 41,
    description:
        "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
  );

  test('Should be subclass of product entity', () async {
    //assert
    expect(productModel, isA<Product>());
  });

  test('Should return valid model from json', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture("product.json"));

    // act
    final result = ProductModel.fromJson(jsonMap);

    //assert
    expect(result, productModel);
  });

  test('Should return valid json from model', () async {
    // act
    final result = productModel.toJson();
    final expectedJson = {
      "id": 1,
      "name": "Derby Leather Shoes",
      "price": 120,
      "category": "Men’s shoe",
      "imageUrl": "",
      "rating": 4.0,
      "shoeSize": 41,
      "description":
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
    };

    //assert
    expect(result, expectedJson);
  });
}
