import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shop_app/providers/product.dart";
import "../screens/product_details_screen/product_detail_screen.dart";
import "../providers/cart_provider.dart";

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final addcart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: const Color.fromARGB(221, 221, 110, 110),
          leading: IconButton(
            icon: Consumer<Product>(
              builder: (context, product, _) => Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
            onPressed: () {
              product.toggleFavorite();
            },
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              addcart.add(
                  product.id, product.price, product.title, product.imageUrl);
            },
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
