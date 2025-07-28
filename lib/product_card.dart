import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int discount = 20;
  String urlIMage =
      "https://th.bing.com/th/id/R.ed1a6de77585f3900fc3f5a19c5c5522?rik=r9a0ula5f6LkQw&pid=ImgRaw&r=0";
  double rating = 3;
  bool isVaforite = false;
  int count = 0;
  double price = 0;
  String title = "Wireless HeadPhone";
  bool isAddedToCart = false;

  void changecount(bool isAdd) {
    setState(() {
      if (isAdd && count < 10) {
        count += 1;
      }
      if (!isAdd && count > 0) {
        count -= 1;
      }
    });
  }

  void favorite() {
    setState(() {
      isVaforite = !isVaforite;
    });
  }

  void addtocart() {
    setState(() {
      isAddedToCart = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue.shade50,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(height: 50.h, urlIMage),
              SizedBox(height: 20),
              Text(title, style: TextStyle(fontSize: 28)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("200 egp", style: TextStyle(fontSize: 24)),
                  SizedBox(width: 10),
                  StarRating(rating: 4, allowHalfRating: false),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isAddedToCart
                      ? SizedBox()
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  changecount(false);
                                },
                                icon: Icon(Icons.remove, color: Colors.blue),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                child: Text(
                                  count.toString(),
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  changecount(true);
                                },
                                icon: Icon(Icons.add, color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                  ElevatedButton(
                    onPressed: () {
                      if (!isAddedToCart) {
                        addtocart();
                      }
                    },
                    child: Text(isAddedToCart ? "Added !" : "Add To Cart"),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.cyan),
          child: Text("$discount%"),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            onPressed: () => favorite(),
            icon: Icon(
              Icons.favorite,
              color: isVaforite ? Colors.red : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
