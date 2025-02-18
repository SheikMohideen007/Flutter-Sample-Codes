import 'package:flutter/material.dart';
import 'package:frontend/screens/product_details.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.devHeight,
      required this.devWidth,
      required this.symbol,
      required this.cardWidth,
      required this.cardHeight});

  final double devHeight;
  final double devWidth;
  final String symbol;
  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductDetails()));
      },
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 233, 233),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: devHeight * 0.22,
                // width: devWidth * 0.42,
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
                      'H&M',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                    SizedBox(width: devWidth * 0.03),
                    SizedBox(
                        width: 15, child: Image.asset('images/star_icon.png')),
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
              ])
            ],
          ),
        ),
      ),
    );
  }
}
