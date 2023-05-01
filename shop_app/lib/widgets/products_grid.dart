import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/product_provider.dart";
import "../widgets/product_item.dart";

class ProductGrid extends StatelessWidget {
  final bool showFavs;
  const ProductGrid(this.showFavs, {super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final product = showFavs ? productData.favitems : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2),
      itemCount: product.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: product[index],
        child: const ProductItem(),
      ),
    );
  }
}
