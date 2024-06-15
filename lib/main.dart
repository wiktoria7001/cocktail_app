import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'models/Cart.dart';
import 'models/Product.dart';
import 'pages/home_page.dart';

void main() {
  runApp(CocktailApp());
}

class CocktailApp extends StatelessWidget {
  const CocktailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider> (
            create: (context) => ProductDataProvider(),
        ),

        ChangeNotifierProvider<CartDataProvider> (
          create: (context) => CartDataProvider(),
        ),
      ],
      child:MaterialApp(
        title: 'Cocktail App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.marmeladTextTheme(
            Theme.of(context).textTheme,
          )
        ),
        home: HomePage(),
      ),
    );
  }
}
