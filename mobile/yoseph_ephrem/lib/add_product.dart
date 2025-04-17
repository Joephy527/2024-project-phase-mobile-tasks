import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yoseph_ephrem/data.dart';
import 'package:yoseph_ephrem/features/product/domain/entities/product.dart';

import 'package:yoseph_ephrem/theme.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key, this.product});

  final Product? product;

  bool get isEditing => product != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  tooltip: "Back",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      color: Theme.of(context).colorScheme.primaryBlue,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  isEditing ? "Edit Product" : "Add Product",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onPrimaryBlack,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: AddProductBody(product: product),
    );
  }
}

class AddProductBody extends StatefulWidget {
  final Product? product;

  const AddProductBody({super.key, this.product});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _nameController.text = widget.product?.name ?? '';
      _categoryController.text = widget.product?.category ?? "";
      _priceController.text = widget.product?.price.toString() ?? '';
      _descriptionController.text = widget.product?.description ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.product != null;
    final productData = Provider.of<ProductData>(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 16),
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.primaryGreyLighter,
                ),
                height: 190,
                width: 366,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/gallery.png', width: 40, height: 40),
                    const SizedBox(height: 24),
                    Text(
                      "Upload image",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22, key: Key("1")),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.primaryGreyLighter,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Category",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: _categoryController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.primaryGreyLighter,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please pick a category';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Price",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.primaryGreyLighter,
                          suffixIcon: Icon(Icons.attach_money),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a price';
                          }
                          final number = num.tryParse(value);
                          if (number == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Theme.of(context).colorScheme.primaryGreyLighter,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35, key: Key("2")),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final name = _nameController.text;
                        final category = _categoryController.text;
                        final price = int.parse(_priceController.text);
                        final description = _descriptionController.text;

                        final newItem = Product(
                          id: widget.product?.id ?? productData.data.length + 1,
                          imageUrl: "",
                          name: name,
                          price: price,
                          category: category,
                          description: description,
                          shoeSize: widget.product?.shoeSize ?? 41,
                          rating: widget.product?.rating ?? 4.0,
                        );

                        if (isEditing) {
                          final index = productData.data.indexWhere(
                            (item) => item.id == widget.product!.id,
                          );

                          if (index != -1) {
                            productData.data[index] = newItem;
                          }
                        } else {
                          productData.data.add(newItem);
                        }
                      }

                      Navigator.of(context).pushNamed("/");
                    },
                    child: Center(
                      child: Text(
                        isEditing ? "Update" : "ADD",
                        style: TextStyle(
                          color: Colors.white.withAlpha(201),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primaryRed,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primaryRed,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
