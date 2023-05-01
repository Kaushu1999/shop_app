import 'package:flutter/material.dart';
import "package:shop_app/screens/cart_screen/cart_screen.dart";
import "./providers/cart_provider.dart";
import "./colors.dart";
// ******Proviers ******
import "./providers/product_provider.dart";
import "package:provider/provider.dart";
// ******Screens******
import "./screens/production_overview/product_overview_screen.dart";
import "./screens/product_details_screen/product_detail_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: primary)
              .copyWith(secondary: Colors.white),
          fontFamily: "Lato",
        ),
        home: const ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) =>
              const ProductDetailScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
        },
      ),
    );
  }
}
