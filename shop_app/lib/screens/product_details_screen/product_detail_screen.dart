import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../providers/product_provider.dart";

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});
  static const String routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).getbyId(productId);
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: const Text("hello"),
    );
  }
}
