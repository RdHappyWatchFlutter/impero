import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:impero/model/product.dart';

class ProductDetail extends StatefulWidget {
  final ProductElement productElement;
  const ProductDetail({super.key, required this.productElement});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productElement.name,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(widget.productElement.imageName),
                fit: BoxFit.fill
              )
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.productElement.name}",
                    style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text("Price :  ${widget.productElement.priceCode}",
                    style: TextStyle(color: Colors.black,fontSize: 20.0,),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
