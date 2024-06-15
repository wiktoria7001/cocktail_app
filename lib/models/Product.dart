import 'dart:collection';

import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imgUrl;
  final color;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imgUrl,
      required this.color});
}

class ProductDataProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p3',
      title: 'Sunshine Sipper',
      description:
          'Glowing with a golden hue, this drink is a perfect blend of rum, pineapple juice, and a touch of honey. Ideal for sunny afternoons, each sip transports you to a tropical beach.',
      price: 15.00,
      imgUrl:
          'https://www.recipetineats.com/wp-content/uploads/2019/09/Tequila-Sunrise.jpg',
      color: '0xFFFFF59D',
    ),
    Product(
      id: 'p1',
      title: 'Ocean Breeze',
      description:
          'This blue drink evokes images of a paradise lagoon. Made with vodka, Blue Curaçao, and lemon juice, it’s both refreshing and delightfully sweet.',
      price: 77.99,
      imgUrl:
          'https://hg-images.condecdn.net/image/m9kmKQ4JKBn/crop/810/f/Turquoise-Tonic-house-29may15_pr_b.jpg',
      color: '0xFFBBDEFB',
    ),
    Product(
      id: 'p2',
      title: 'Ruby Romance',
      description:
          'This deep red drink combines cranberry juice, vodka, and a splash of grenadine. Intense and bold, it’s perfect for romantic evenings or elegant gatherings.',
      price: 99.99,
      imgUrl:
          'https://minimalistbaker.com/wp-content/uploads/2012/08/Grown-Up-Watermelon-Limeades.jpg',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p4',
      title: 'Emerald Elixir',
      description:
          'This green drink enchants with its fresh and delicate flavors. A mix of mint liqueur, lime juice, and a hint of vodka creates a taste explosion reminiscent of a spring garden.',
      price: 35.99,
      imgUrl:
          'https://www.baconismagic.ca/wp-content/uploads/2018/02/Cuba-libre-cocktail-recipe-720x720.jpg',
      color: '0xFFCCFF90',
    ),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView((_items));

  Product getElementById(String id) =>
      _items.singleWhere((value) => value.id == id);
}
