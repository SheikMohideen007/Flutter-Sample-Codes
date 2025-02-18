import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double devHeight = 0.0, devWidth = 0.0;
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
          )
        ],
      ),
    );
  }
}
