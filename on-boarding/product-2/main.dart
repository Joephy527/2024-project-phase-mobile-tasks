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

    if (command?.toLowerCase() == "new") {
      print("enter product name");
      String? name = stdin.readLineSync();

      print("enter product price");
      String? price = stdin.readLineSync();

      late int parsedPrice;

      while (true) {
        try {
          parsedPrice = int.parse(price != null && price != "" ? price : "0");
          break;
        } on FormatException catch (_) {
          print("please enter a correct price number");
          price = stdin.readLineSync();
        }
      }

      print("enter product description");
      String? description = stdin.readLineSync();

      productManager.addProduct(
        parsedPrice,
        name ?? "",
        description: description ?? "",
      );
    } else if (command?.toLowerCase() == "view all") {
      productManager.viewAllProducts();
    } else if (command?.toLowerCase() == "view") {
      print("enter product name");

      String? productName = stdin.readLineSync();

      productManager.viewProduct(productName: productName);
    } else if (command?.toLowerCase() == "edit") {
      print("enter name of the product you want to edit");
      String? productName = stdin.readLineSync();

      print("enter product name or leave blank if you don't want to edit it");
      String? name = stdin.readLineSync();

      print("enter product price or leave blank if you don't want to edit it");
      String? price = stdin.readLineSync();

      late int parsedPrice;

      while (true) {
        try {
          parsedPrice = int.parse(price != null && price != "" ? price : "0");
          break;
        } on FormatException catch (_) {
          print("please enter a correct price number");
          price = stdin.readLineSync();
        }
      }

      print(
        "enter product description or leave blank if you don't want to edit it",
      );
      String? description = stdin.readLineSync();

      productManager.editProduct(
        productName ?? "",
        price: parsedPrice,
        name: name ?? "",
        description: description ?? "",
      );
    } else if (command?.toLowerCase() == "delete") {
      print("enter product name");

      String? productName = stdin.readLineSync();

      productManager.deleteProduct(productName: productName);
    } else {
      print("Plase enter a known command");
    }
  }
}
