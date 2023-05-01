import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/cart_provider.dart";

class CartItem extends StatelessWidget {
  final String title;

  final String id;
  final double price;
  final String imageUrl;
  final double quantity;

  const CartItem(
      {required this.imageUrl,
      required this.price,
      required this.quantity,
      required this.title,
      required this.id,
      super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    print(cart.cartItems);
    return SizedBox(
      child: Dismissible(
        key: ValueKey(id),
        direction: DismissDirection.endToStart,
        background: Container(
          color: const Color.fromARGB(255, 253, 249, 249),
          alignment: Alignment.centerRight,
          child: const Icon(
            Icons.delete,
            size: 40,
          ),
        ),
        child: Card(
          elevation: 3,
          color: const Color.fromARGB(255, 253, 249, 249),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 1)),
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)),
                              color: Color.fromARGB(255, 240, 235, 235),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            child: InkWell(
                              onTap: () {
                                cart.remove(id, price, title, imageUrl);
                              },
                              child: const Icon(
                                Icons.delete_outline,
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(color: Colors.grey, width: 1),
                                right: BorderSide(color: Colors.grey, width: 1),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 10),
                            child: Text(" Qty: ${quantity.toString()}"),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
                              color: Color.fromARGB(255, 240, 235, 235),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            child: InkWell(
                              onTap: () {
                                cart.add(id, price, title, imageUrl);
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(title),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("\$ ${price.toString()}"),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "In Stock",
                      style: TextStyle(
                        color: Color.fromRGBO(0, 133, 0, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
