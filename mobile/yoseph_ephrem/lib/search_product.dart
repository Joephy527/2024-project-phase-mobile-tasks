import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoseph_ephrem/data.dart';
import 'package:yoseph_ephrem/my_home_page.dart';
import 'package:yoseph_ephrem/theme.dart';

import 'features/product/domain/entities/product.dart';

class ItemSearchPage extends StatelessWidget {
  const ItemSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductData>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
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
                  "Search Product",
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
      body: SearchBody(products: productData.data),
    );
  }
}

class SearchBody extends StatefulWidget {
  const SearchBody({super.key, required this.products});

  final List<Product> products;

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final TextEditingController _searchController = TextEditingController();
  late List<Product> filteredProducts;

  // Persistent filter state
  String selectedCategory = '';
  RangeValues selectedRange = const RangeValues(0, 500);
  final double minPrice = 0;
  final double maxPrice = 500;

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(widget.products);
  }

  void filterProducts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredProducts =
          widget.products.where((item) {
            final matchesQuery = item.name.toLowerCase().contains(query);
            final inCategory =
                selectedCategory.isEmpty ||
                (item.category ?? "").toLowerCase().contains(
                  selectedCategory.toLowerCase(),
                );
            final inPriceRange =
                item.price >= selectedRange.start.toInt() &&
                item.price <= selectedRange.end.toInt();
            return matchesQuery && inCategory && inPriceRange;
          }).toList();
    });
  }

  void openFilterSheet() {
    TextEditingController categoryController = TextEditingController(
      text: selectedCategory,
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  child: Container(
                    height: 388,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 24,
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Category"),
                            const SizedBox(height: 8),
                            TextField(
                              controller: categoryController,
                              onChanged: (value) {
                                setModalState(() {
                                  selectedCategory = value;
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.primaryGreyVar,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.primaryGreyVar,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.primaryGreyVar,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 17),

                        /// Price Range
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Price"),
                            const SizedBox(height: 8),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 11,
                                thumbColor: Colors.white,
                                activeTrackColor:
                                    Theme.of(context).colorScheme.primaryBlue,
                                inactiveTrackColor:
                                    Theme.of(
                                      context,
                                    ).colorScheme.primaryGreyVar,
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 1,
                                ),
                                overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 0,
                                ),
                              ),
                              child: RangeSlider(
                                values: selectedRange,
                                min: minPrice,
                                max: maxPrice,
                                onChanged: (RangeValues values) {
                                  setModalState(() {
                                    selectedRange = values;
                                  });
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ETB ${selectedRange.start.toInt()}'),
                                Text('ETB ${selectedRange.end.toInt()}'),
                              ],
                            ),
                          ],
                        ),

                        const Spacer(),

                        /// Apply Button
                        SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primaryBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              filterProducts();
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'APPLY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(32, 28, 32, 26),
        child: Column(
          children: [
            /// Search + Filter Row
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).colorScheme.primaryBlue,
                          ),
                          onPressed: filterProducts,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primaryGreyVar,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primaryGreyVar,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: 48,
                  width: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryBlue,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: openFilterSheet,
                    child: const Icon(
                      Icons.filter_list,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),

            /// Results or empty state
            filteredProducts.isEmpty
                ? const Center(
                  child: Text(
                    'No products found.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                )
                : Column(
                  children: buildGridCards(context, cardData: filteredProducts),
                ),
          ],
        ),
      ),
    );
  }
}
