import 'dart:io';

import 'models.dart';

void main() {
  print("================================================");
  print("=                                              =");
  print("= Welcome to your own product managment system =");
  print("=                                              =");
  print("================================================\n");

  ProductManager productManager = ProductManager();

  while (true) {
    print(
      "***********commands****************************************************",
    );
    print(
      "*                                                                     *",
    );
    print(
      "* write new to add a new product, write view all to view all products *",
    );
    print(
      "*     write view to view a product, write edit to edit a product.     *",
    );
    print(
      "*                  write delete to delete a product.                  *",
    );
    print(
      "*                                                                     *",
    );
    print(
      "****************************************************choose one*********",
    );

    String? command = stdin.readLineSync();
    print("");

    switch (command) {
      case "new":
        print("Enter product name:");
        String? name = stdin.readLineSync();

        print("Enter product price:");
        String? price = stdin.readLineSync();
        int parsedPrice = _parsePrice(price);

        print("Enter product description:");
        String? description = stdin.readLineSync();

        productManager.addProduct(
          parsedPrice,
          name ?? "",
          description: description ?? "",
        );
        break;

      case "view all":
        productManager.viewAllProducts();
        break;

      case "view":
        print("Enter product name:");
        String? productName = stdin.readLineSync();
        productManager.viewProduct(productName: productName);
        break;

      case "edit":
        print("Enter the name of the product you want to edit:");
        String? productName = stdin.readLineSync();

        print("Enter product name or leave blank to keep it unchanged:");
        String? name = stdin.readLineSync();

        print("Enter product price or leave blank to keep it unchanged:");
        String? price = stdin.readLineSync();
        int parsedPrice = _parsePrice(price);

        print("Enter product description or leave blank to keep it unchanged:");
        String? description = stdin.readLineSync();

        productManager.editProduct(
          productName ?? "",
          price: parsedPrice,
          name: name ?? "",
          description: description ?? "",
        );
        break;

      case "delete":
        print("Enter product name:");
        String? productName = stdin.readLineSync();
        productManager.deleteProduct(productName: productName);
        break;

      default:
        print("Please enter a known command.");
    }
  }
}

int _parsePrice(String? price) {
  while (true) {
    try {
      return int.parse(price != null && price.isNotEmpty ? price : "0");
    } on FormatException {
      print("Please enter a correct price number:");
      price = stdin.readLineSync();
    }
  }
}
