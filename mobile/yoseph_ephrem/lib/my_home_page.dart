import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yoseph_ephrem/data.dart';

import 'package:yoseph_ephrem/theme.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        flexibleSpace: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: SafeArea(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Theme.of(context).colorScheme.primaryGrey,
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('MMMM d, y').format(DateTime.now()),
                          style: GoogleFonts.syne(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimaryGrey,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Text(
                              "Hello, ",
                              style: GoogleFonts.sora(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryGreyDarker,
                              ),
                            ),
                            Text(
                              userName,
                              style: GoogleFonts.sora(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffDDDDDD), width: 1),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Image.asset(
                        'images/notification.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: HomeBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Transform.translate(
        offset: const Offset(-16, -16),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primaryBlue,
          onPressed: () {
            Navigator.of(context).pushNamed("/add-product");
          },
          tooltip: 'Add a product',
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductData>(context);
    return Container(
      padding: EdgeInsets.fromLTRB(32, 0, 32, 36),
      child: Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 32),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Available Product",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/search");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffD9D9D9), width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 40,
                      width: 40,
                      child: Center(child: Icon(Icons.search, size: 24)),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(bottom: 36),
                child: Column(
                  children: buildGridCards(context, cardData: productData.data),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<GestureDetector> buildGridCards(
  BuildContext context, {
  required List<CardItem> cardData,
}) {
  List<GestureDetector> cards =
      cardData.map((item) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/item-detail', arguments: item);
          },
          child: Container(
            width: 366,
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x08000000),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'images/shoe.png',
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: const Color(0xFFFEFEFE),
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryBlack,
                              ),
                            ),
                            Text(
                              "\$${item.price}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onPrimaryBlack,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.category,
                              style: TextStyle(
                                fontSize: 12,
                                color:
                                    Theme.of(context).colorScheme.onPrimaryGrey,
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'images/star.png',
                                  width: 20,
                                  height: 20,
                                ),
                                Text(
                                  "(${item.rating})",
                                  style: GoogleFonts.sora(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onPrimaryGrey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList();
  return cards;
}
