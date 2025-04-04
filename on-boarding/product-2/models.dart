class Product {
  String _name = "", _description = "";
  int _price = 0;

  Product(this._name, this._description, this._price) {}

  String getName() {
    return _name;
  }

  String getDescription() {
    return _description;
  }

  int getPrice() {
    return _price;
  }

  void updateProduct({name, description = "", price}) {
    _name = (name != null && name != "") ? name : _name;
    _description = description != "" ? description : _description;
    _price = price != 0 ? price : _price;
  }
}

class ProductManager {
  int _productNumber = 1;
  var _productsList = {};

  void addProduct(int price, String name, {String? description}) {
    String productName = name == "" ? "product ${_productNumber}" : name;
    _productNumber++;

    Product newProduct = Product(productName, description ?? "", price);
    _productsList[productName] = newProduct;

    print("You've successfully added a product\n");
  }

  void viewAllProducts() {
    if (_productsList.length == 0) {
      print("You have no products at the moment. try creating on\n");
      return;
    }

    int i = 1;

    for (final product in _productsList.values) {
      print("Porduct ${i}");
      print(
        "name: ${product.getName()}, ${product.getDescription() != "" ? "description: ${product.getDescription()}, " : ""}price: ${product.getPrice()} Birr\n",
      );
      i++;
    }
  }

  void viewProduct({String? productName = ""}) {
    for (final currentproductName in _productsList.keys) {
      if (productName == currentproductName) {
        Product product = _productsList[productName];

        print(
          "name: ${product.getName()}, ${product.getDescription() != "" ? "description: ${product.getDescription()}, " : ""}price: ${product.getPrice()} Birr\n",
        );

        return;
      }
    }

    print("Seems like this product doesn't exist, try creating it\n");
  }

  void deleteProduct({String? productName = ""}) {
    for (final product in _productsList.keys) {
      if (productName == product) {
        _productsList.remove(productName);

        print("${productName} deleted");

        return;
      }
    }

    print("Seems like this product doesn't exist, no need to delete it\n");
  }

  void editProduct(String productName, {name, description, price}) {
    for (final currentProductName in _productsList.keys) {
      if (productName == currentProductName) {
        Product currentProduct = _productsList[productName];
        currentProduct.updateProduct(
          name: name,
          description: description,
          price: price,
        );

        print("${productName} edited");

        return;
      }
    }

    print("Seems like this product doesn't exist, try creating it\n");
  }
}
