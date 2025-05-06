import 'package:yoseph_ephrem/features/product/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required id,
    required name,
    required description,
    required imageUrl,
    required price,
    rating,
    category,
    shoeSize,
  }) : super(
         id: id,
         name: name,
         description: description,
         imageUrl: imageUrl,
         price: price,
         rating: rating,
         category: category,
         shoeSize: shoeSize,
       );

  factory ProductModel.fromJson(Map<String, dynamic> jsonMap) {
    return ProductModel(
      id: jsonMap["id"],
      name: jsonMap["name"],
      description: jsonMap["description"],
      imageUrl: jsonMap["imageUrl"],
      price: jsonMap["price"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "imageUrl": imageUrl,
      "price": price,
      "rating": rating,
      "category": category,
      "shoeSize": shoeSize,
    };
  }
}
