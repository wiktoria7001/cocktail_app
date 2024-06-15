import 'package:provider/provider.dart';

import '../models/Cart.dart';
import '../widgets/cart_list_item.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Koszyk szczęścia'),
        ),
        body: cartData.cartItems.isEmpty
            ? Card(
                elevation: 5.0,
                margin: const EdgeInsets.all(30.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Koszyk jest pusty',
                  ),
                ),
              )
            : Column(
                children: <Widget>[
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Kwota: ' + cartData.totalAmount.toStringAsFixed(2),
                        style: TextStyle(fontSize: 20.0),
                      ),
                      MaterialButton(
                        onPressed: () {
                          cartData.clear();
                        },
                        color: Theme.of(context).primaryColor,
                        child: Text('Kup'),
                      ),
                    ],
                  ),
                  Divider(),
                  Expanded(child: CartItemList(cartData: cartData)),
                ],
              ));
  }
}
