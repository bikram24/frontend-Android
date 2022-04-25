import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/product/product_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class RecommendedList extends StatelessWidget {
  List<Product> products = [
    Product('assets/redguitar-removebg-preview.png', 'Guitar', 'Red Beauty', 25000),
    Product('assets/accessories-removebg-preview.png', 'Padle', 'Overdrive padle', 9000),
    Product('assets/guitarbag-removebg-preview.png', 'Guitar Bag', 'Guitar Bag For you', 3000),
    Product('assets/64a-removebg-preview.png', 'Steel Black Capo',
        'Black color Capo', 700),
    Product('assets/strings-removebg-preview.png', 'Strings', 'Best Guitar Strings', 250),
    Product('assets/pleasure-guitar-removebg-preview.png', 'Pleasure Guitar', 'Buy Pleasure Guitar and get (1 guitar bag,1set string,1 pcs picksand 1 pcs fender capo free)', 13000),
    Product('assets/21-removebg-preview.png', 'Guitar Audio Cable', 'Black and White guitar audio cable', 900),
    Product('assets/10-removebg-preview.png', 'Picks', 'Alice Picks 5 piece of combo', 100),
    Product('assets/headphone_9.png', 'Headphones', 'Description', 4500),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: mediumYellow,
                ),
              ),
              Center(
                  child: Text(
                'Recommended',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => new ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Colors.grey.withOpacity(0.3),
                              Colors.grey.withOpacity(0.7),
                            ],
                            center: Alignment(0, 0),
                            radius: 0.6,
                            focal: Alignment(0, 0),
                            focalRadius: 0.1),
                      ),
                      child: Hero(
                          tag: products[index].image,
                          child: Image.asset(products[index].image))),
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}
