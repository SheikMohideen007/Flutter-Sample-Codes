import 'package:flutter/material.dart';
import 'package:frontend/utils/product_card.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  double devHeight = 0.0, devWidth = 0.0;
  String symbol = "\$";
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'Search',
                    suffixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.all(5),
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)))),
            SizedBox(height: 30),
            SizedBox(
              height: devHeight * 0.15,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: devHeight * 0.02),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  categoryCard(imgPath: 'p_img2.png', category: 'Men'),
                  categoryCard(imgPath: 'p_img34.png', category: 'Women'),
                  categoryCard(imgPath: 'p_img3.png', category: 'Kids'),
                  categoryCard(imgPath: 'p_img2.png', category: 'Men'),
                  categoryCard(imgPath: 'p_img34.png', category: 'Women'),
                  categoryCard(imgPath: 'p_img3.png', category: 'Kids'),
                ]),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductCard(
                        devHeight: devHeight,
                        devWidth: devWidth,
                        symbol: symbol,
                        cardWidth: devWidth * 0.45,
                        cardHeight: devHeight * 0.4,
                      ),
                      ProductCard(
                        devHeight: devHeight,
                        devWidth: devWidth,
                        symbol: symbol,
                        cardWidth: devWidth * 0.45,
                        cardHeight: devHeight * 0.4,
                      ),
                    ],
                  ),
                  SizedBox(height: devHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductCard(
                        devHeight: devHeight,
                        devWidth: devWidth,
                        symbol: symbol,
                        cardWidth: devWidth * 0.45,
                        cardHeight: devHeight * 0.4,
                      ),
                      ProductCard(
                        devHeight: devHeight,
                        devWidth: devWidth,
                        symbol: symbol,
                        cardWidth: devWidth * 0.45,
                        cardHeight: devHeight * 0.4,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget categoryCard({required String imgPath, required String category}) {
    return Padding(
      padding: EdgeInsets.only(right: devWidth * 0.04),
      child: Column(
        children: [
          Container(
            height: devHeight * 0.08,
            width: devWidth * 0.17,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('images/$imgPath'))),
          ),
          Text(category, style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
