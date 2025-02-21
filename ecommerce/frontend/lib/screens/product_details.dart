import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String brand, ratings, title;
  const ProductDetails(
      {super.key,
      required this.brand,
      required this.ratings,
      required this.title});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double devHeight = 0.0, devWidth = 0.0;
  String symbol = "\$";
  int sizes = 3;
  List<bool> size = [false, false, true];
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('Detail Product'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: devWidth * 0.03),
            child: SizedBox(
                height: devHeight * 0.025,
                child: Image.asset('images/cart_icon.png')),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: devHeight * 0.5,
            width: devWidth,
            child: Image.asset(
              'images/p_img2.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: devWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: devHeight * 0.01),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            'H&M',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.favorite_border))
                    ],
                  ),
                ),
                Text(
                  'Oversized fit printed jbsjb',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(height: devHeight * 0.01),
                Row(children: [
                  Text('$symbol 300',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: devWidth * 0.02),
                  Text('$symbol 400',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red.shade300,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough)),
                ]),
                SizedBox(height: devHeight * 0.01),
                Text(
                  'A garment that hangs from the shoulders and covers the body, part or all of the legs, and usually part or all of the arms.',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: devHeight * 0.01),
                Text('Available Sizes'),
                SizedBox(height: devHeight * 0.01),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        for (int i = 0; i < sizes; i++) {
                          setState(() {
                            if (i == 0) {
                              size[i] = true;
                            } else {
                              size[i] = false;
                            }
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: size[0] ? Colors.black : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('XS',
                              style: TextStyle(
                                  color:
                                      size[0] ? Colors.white : Colors.black)),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        for (int i = 0; i < sizes; i++) {
                          setState(() {
                            if (i == 1) {
                              size[i] = true;
                            } else {
                              size[i] = false;
                            }
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: size[1] ? Colors.black : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('S',
                              style: TextStyle(
                                  color:
                                      size[1] ? Colors.white : Colors.black)),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        for (int i = 0; i < sizes; i++) {
                          setState(() {
                            if (i == 2) {
                              size[i] = true;
                            } else {
                              size[i] = false;
                            }
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: size[2] ? Colors.black : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('M',
                              style: TextStyle(
                                  color:
                                      size[2] ? Colors.white : Colors.black)),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: devWidth * 0.5,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.shopping_bag),
                        SizedBox(width: devWidth * 0.02),
                        Text('Add to Cart'.toUpperCase())
                      ],
                    )),
              ),
              SizedBox(
                width: devWidth * 0.5,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.shopping_bag),
                        SizedBox(width: devWidth * 0.02),
                        Text('BUY NOW')
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
