import 'package:cocktail_app/pages/catalog_page.dart';
import 'package:flutter/material.dart';

class CatalogListTile extends StatelessWidget {
  final imgUrl;

  const CatalogListTile({super.key, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemCatalog(imgUrl: imgUrl)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                ),
            ),
          ),
          title: Text('Letni orzeźwiający wybór'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('09:00 - 00:00'),
              Row(
                children: <Widget>[
                  Icon(Icons.star, size: 15, color: Colors.pinkAccent),
                  Text('4.9'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
