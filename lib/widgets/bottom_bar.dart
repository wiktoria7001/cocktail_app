import 'package:cocktail_app/models/Cart.dart';
import 'package:cocktail_app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/item_page.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);
    final cartItems = cartData.cartItems;

    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) => Hero(
                    tag: cartItems.values.toList()[index].imgUrl,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ItemPage(
                              productId: cartItems.keys.toList()[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            width: 35,
                            height: 35,
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 4.0,
                                  spreadRadius: 5.0,
                                  offset: Offset(-2, 2),
                                )
                              ],
                              image: DecorationImage(
                                image: NetworkImage(
                                    cartItems.values.toList()[index].imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 2,
                            bottom: 5,
                            child: Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                '${cartItems.values.toList()[index].number}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(cartData.totalAmount.toStringAsFixed(2)),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ));
                      },
                      icon:
                          Icon(Icons.shopping_basket, color: Color(0xFF676E79)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
