import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';
// import 'package:getwidget/getwidget.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                // borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.title,
              style: TextStyle(color: kTextColor),
            ),
          ),
          Text(
            "\Rp. ${product.price}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.orange),
          ),
          Container(
            // padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: kTextColor.withOpacity(0.6),
                ),
                Text(
                  product.location_name,
                  style: TextStyle(color: kTextColor),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: kTextColor.withOpacity(0.6),
                ),
                Text(
                  product.added_user_name,
                  style: TextStyle(color: kTextColor),
                ),
              ],
            ),
          ),
          Card(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Ready Stock"),
            ),
          ),
          Stack(
            children: [
              Container(
                height: 0,
                color: Colors.black,
                width: double.infinity,
              ),
              Positioned(
                  bottom: 30,
                  right: 10,
                  // right: 0,
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/images/halal.png"),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ))
            ],
            overflow: Overflow.visible,
          )
        ],
      ),
    );
  }
}
