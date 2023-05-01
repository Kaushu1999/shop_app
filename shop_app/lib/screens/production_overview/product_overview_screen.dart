import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:shop_app/screens/cart_screen/cart_screen.dart";
import "../../widgets/products_grid.dart";
import "../../providers/cart_provider.dart";
import "../../widgets/badge.dart";

enum FilterOptions {
  favorites,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showAllFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop App"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedItem) {
              setState(() {
                if (selectedItem == FilterOptions.favorites) {
                  _showAllFavorites = true;
                } else {
                  _showAllFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text("Only  Favorites "),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text("Show All "),
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (context, cart, ch) => CustomBadge(
              value: cart.itemcount.toString(),
              color: Theme.of(context).colorScheme.primary,
              child: ch!,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: ProductGrid(_showAllFavorites),
    );
  }
}
