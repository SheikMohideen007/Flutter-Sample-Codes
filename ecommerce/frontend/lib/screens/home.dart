import 'package:flutter/material.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
