import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double devHeight = 0.0;
  double devWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: devWidth * 0.035, vertical: devHeight * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: devHeight * 0.04,
                      child: Image.asset('images/logo.png')),
                  SizedBox(
                      height: devHeight * 0.03,
                      child: Image.asset('images/cart_icon.png'))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: devHeight * 0.02),
                child: Container(
                  height: devHeight * 0.25,
                  width: devWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'images/hero_img.png',
                          ))),
                ),
              ),
              Text(
                'Shop by Category',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
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
              Text(
                'Curated For You',
                style: GoogleFonts.aDLaMDisplay(
                    fontWeight: FontWeight.w300, fontSize: 22),
              ),
              Container(
                color: Colors.grey,
                height: 350,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: devHeight * 0.22,
                      width: devWidth * 0.42,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/p_img1.png'))),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: devHeight * 0.01),
                      child: Row(
                        children: [
                          Text(
                            'H & M',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(width: devWidth * 0.03),
                          SizedBox(
                              width: 15,
                              child: Image.asset('images/star_icon.png')),
                          SizedBox(width: devWidth * 0.02),
                          Text(
                            '4.9 (124)',
                            style: TextStyle(color: Colors.grey.shade700),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Oversized fit printed jbsjb',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
