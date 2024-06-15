

import 'package:cocktail_app/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Cart.dart';
import '../models/Product.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return Container(
      width: 150,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(int.parse(product.color)),
      ),
      child: SingleChildScrollView( // Wrapping Column in SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) =>
                      ItemPage(productId: product.id)),
                );
              },
              child: Column(
                children: <Widget>[
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(product.imgUrl as String),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    '${product.title}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${product.price}'),
                IconButton(
                  onPressed: () {
                    Provider.of<CartDataProvider>(context, listen: false).addItem(
                      productId: product.id,
                      price: product.price,
                      title: product.title,
                      imgUrl: product.imgUrl,
                    );
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Colors.black12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
