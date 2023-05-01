import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../providers/cart_provider.dart" show Cart;
import "../../widgets/cart_item.dart";

class CartScreen extends StatelessWidget {
  static const String routeName = "/Cart-screen";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your CartItem"),
      ),
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(96, 22, 19, 19), width: 0.5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Cart",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      "Buy Again",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "SubTotal \$ ${cart.totalAmount.toString()}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      const Text(
                        "EMI Available",
                        style: TextStyle(
                            color: Color.fromARGB(255, 92, 90, 90),
                            fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Details",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(0, 113, 133, 1)),
                          ))
                    ],
                  ),
                  // Select this option at checkout.
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Icon(
                        Icons.check_circle,
                        color: Color.fromRGBO(0, 133, 0, 1),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Part of your order qualifies for FREE Delivery.",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 133, 0, 1),
                                fontSize: 16),
                          ),
                          Row(
                            children: [
                              const Text("Select this option at checkout."),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Details",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(0, 113, 133, 1)),
                                  ))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(96, 22, 19, 19), width: 0.5),
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Text(
                              "Proceed to buy (${cart.itemcount.toString()})",
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: ListView.builder(
                    itemCount: cart.itemcount,
                    itemBuilder: (context, index) => CartItem(
                          imageUrl:
                              cart.cartItems.values.toList()[index].imageUrl,
                          price: cart.cartItems.values.toList()[index].price,
                          quantity:
                              cart.cartItems.values.toList()[index].quantity,
                          title: cart.cartItems.values.toList()[index].title,
                          id: cart.cartItems.keys.toList()[index],
                        )),
              ),
            ),
          ],

          // Card(
          //   margin: const EdgeInsets.all(15),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8),
          //     child:
          //  Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     const Text(
          //       "Total",
          //       style: TextStyle(
          //         fontSize: 22,
          //       ),
          //     ),
          //     const Spacer(),
          //     Chip(
          //       label: Text("\$ ${cart.totalAmount.toString()}",
          //           style:
          //               Theme.of(context).primaryTextTheme.titleMedium),
          //       backgroundColor: Theme.of(context).colorScheme.primary,
          //     ),
          //     TextButton(
          //         onPressed: () {}, child: const Text("ORDER NOW ")),
          //   ],
          // ),
          //   ),
          // )
        ),
      ),
    );
  }
}
