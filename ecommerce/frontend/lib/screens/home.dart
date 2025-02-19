import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/product_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double devHeight = 0.0;
  double devWidth = 0.0;
  String symbol = "\$";
  List<String> sampleImages = [
    'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg',
    'https://img.freepik.com/free-photo/shapely-woman-vintage-dress-touching-her-glasses-outdoor-shot-interested-relaxed-girl-brown-outfit_197531-11308.jpg',
    'https://img.freepik.com/premium-photo/cheerful-lady-brown-outfit-looking-around-outdoor-portrait-fashionable-caucasian-model-with-short-wavy-hairstyle_197531-25791.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: devWidth * 0.035, vertical: devHeight * 0.01),
          child: SingleChildScrollView(
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
                    child: FanCarouselImageSlider.sliderType1(
                      showIndicator: false,
                      expandFitAndZoomable: true,
                      slideViewportFraction: 1,
                      sliderWidth: devWidth,
                      imageRadius: 20,
                      expandImageWidth: devWidth,
                      imagesLink: sampleImages,
                      isAssets: false,
                      autoPlay: true,
                      sliderHeight: devHeight * 0.23,

                      // showIndicator: false,
                    ),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.all(Radius.circular(40)),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: AssetImage(
                    //           'images/hero_img.png',
                    //         ))

                    //         ),
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
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
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
                SizedBox(height: devHeight * 0.01),
                SizedBox(
                  height: devHeight * 0.4,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, snapshot) {
                        return Padding(
                          padding: EdgeInsets.all(devHeight * 0.008),
                          child: ProductCard(
                              devHeight: devHeight,
                              devWidth: devWidth,
                              symbol: symbol,
                              cardWidth: devWidth * 0.5,
                              cardHeight: devHeight * 0.35),
                        );
                      }),
                ),
                SizedBox(height: devHeight * 0.01),
                Text(
                  'Best Collections',
                  style: GoogleFonts.aDLaMDisplay(
                      fontWeight: FontWeight.w300, fontSize: 22),
                ),
                SizedBox(height: devHeight * 0.01),
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
