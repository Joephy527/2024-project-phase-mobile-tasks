import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoseph_ephrem/add_product.dart';
import 'package:yoseph_ephrem/data.dart';
import 'package:yoseph_ephrem/item_detail_page.dart';

import 'package:yoseph_ephrem/my_home_page.dart';
import 'package:yoseph_ephrem/search_product.dart';

import 'features/product/domain/entities/product.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => ProductData(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/item-detail':
            final item = settings.arguments as Product;

            return _fadeRoute(ItemDetailPage(item: item));
          case '/':
            return _fadeRoute(const MyHomePage(userName: "yoseph"));
          case '/add-product':
            if (settings.arguments != null && settings.arguments is Product) {
              final item = settings.arguments as Product;
              return _fadeRoute(AddProduct(product: item));
            } else {
              return _fadeRoute(const AddProduct());
            }
          case '/search':
            return _fadeRoute(const ItemSearchPage());

          // Fallback
          default:
            return _fadeRoute(const MyHomePage(userName: "yoseph"));
        }
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFEFEFE),
        textTheme: GoogleFonts.poppinsTextTheme(),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

PageRouteBuilder _fadeRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
