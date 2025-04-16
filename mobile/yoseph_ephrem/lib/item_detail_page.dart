import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yoseph_ephrem/add_product.dart';
import 'package:yoseph_ephrem/data.dart';

import 'package:yoseph_ephrem/theme.dart';

class ItemDetailPage extends StatelessWidget {
  final CardItem item;

  const ItemDetailPage({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 286,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'images/shoe2.png',
                      fit: BoxFit.cover,
                      height: 286,
                    ),
                  ),
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    child: IconButton(
                      tooltip: "Back",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Container(
                        padding: EdgeInsets.all(8.0),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item.category,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimaryGrey,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset('images/star.png', width: 24, height: 24),
                          Text(
                            "(${item.rating})",
                            style: GoogleFonts.sora(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color:
                                  Theme.of(context).colorScheme.onPrimaryGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0, key: Key("1")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimaryBlack,
                        ),
                      ),
                      Text(
                        "\$${item.price}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimaryBlack,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0, key: Key("2")),
                  Text(
                    "Size:",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimaryBlack,
                    ),
                  ),
                  SizedBox(height: 12.0, key: Key("3")),
                  Row(children: _buildSizes(item.shoeSize, context)),
                  SizedBox(height: 32.0, key: Key("4")),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimaryGreyDarker,
                    ),
                  ),
                  SizedBox(height: 61.0, key: Key("5")),
                  Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Provider.of<ProductData>(
                              context,
                              listen: false,
                            ).deleteItem(item);

                            Navigator.of(context).pop();
                          },
                          style: OutlinedButton.styleFrom(
                            fixedSize: const Size(152, 50),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primaryRed,
                              width: 1.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "DELETE",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primaryRed,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(152, 50),
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AddProduct(product: item),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              "UPDATE",
                              style: TextStyle(
                                color: Colors.white.withAlpha(201),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Container> _buildSizes(int shoeSize, BuildContext context) {
  List<Container> sizes = [];

  for (int i = shoeSize - 2; i <= shoeSize + 2; i++) {
    final isSelected = i == shoeSize;

    sizes.add(
      Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: i == shoeSize + 2 ? 0 : 12),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Theme.of(context).colorScheme.primaryBlue
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "$i",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  return sizes;
}
