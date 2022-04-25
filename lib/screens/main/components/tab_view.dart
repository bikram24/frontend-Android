import 'package:ecommerce_int2/models/category.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';
import 'recommended_list.dart';

class TabView extends StatelessWidget {
  List<Category> categories = [
    Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Electric Guitars',
      'assets/whiteguitar-removebg-preview.png',
    ),
    Category(
      Color(0xffF749A2),
      Color(0xffFF7375),
      'Acoustic Guitars',
      'assets/pleasure-guitar-removebg-preview.png',
    ),
    Category(
      Color(0xff00E9DA),
      Color(0xff5189EA),
      'AMPs',
      'assets/amp-removebg-preview.png',
    ),
    Category(
      Color(0xffAF2D68),
      Color(0xff632376),
      'Brands',
      'assets/Alesis-logo-vector-removebg-preview.png',
    ),
    Category(
      Color(0xff36E892),
      Color(0xff33B2B9),
      'Accessories',
      'assets/21-removebg-preview.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Others',
      'assets/Ibanez-TS-MINI-Tube-Screamer-Mini-Guitar-Effects-Pedal-01-removebg-preview.png',
    ),
  ];

  final TabController tabController;

  TabView({
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / 9);
    return TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (_, index) => CategoryCard(
                              category: categories[index],
                            ))),
                SizedBox(
                  height: 16.0,
                ),
                Flexible(child: RecommendedList()),
              ],
            ),
          ),
          Column(children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedList())
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedList())
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedList())
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedList())
          ]),
        ]);
  }
}
