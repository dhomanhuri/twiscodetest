import 'package:flutter/material.dart';
import 'package:twiscodetest/constants.dart';
import 'package:twiscodetest/models/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'item_card.dart';
import 'package:twiscodetest/utils/secure_storage.dart';
import '../../../globals.dart' as globals;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var url = Uri.parse(
      'https://ranting.twisdev.com/index.php/rest/items/search/api_key/teampsisthebest/');
  // late List<Product> products = [];
  Future<void> getData() async {
    var response = await http.post(url);

    try {
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        int count = 0;
        for (int i = 0; i < jsonData.length; i++) {
          globals.products.add(Product(
            id: i,
            title: jsonData[i]['title'],
            description: jsonData[i]['description'],
            location_name: jsonData[i]['location_name'],
            added_user_name: jsonData[i]['added_user_name'],
            price: int.parse(jsonData[i]['price']),
            image: "assets/images/bag_" + (count + 1).toString() + ".png",
            color: warna[count],
          ));
          count++;
          if (count == warna.length) {
            count = 0;
          }
        }
      } else {
        throw (response.statusCode);
      }
    } catch (err) {
      throw (err);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: ((context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error'),
          );
        } else {
          return Column(
            children: [
              Padding(padding: EdgeInsets.all(5)),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: GridView.builder(
                    itemCount: globals.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.50,
                      mainAxisSpacing: kDefaultPaddin,
                      crossAxisSpacing: kDefaultPaddin,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () async {
                        var a = await SecureStorage.getCart(index);
                        print("Test" + a);
                        if (a == '0') {
                          await SecureStorage.setCart(index.toString(), 1);
                        } else {
                          await SecureStorage.setCart(
                              index.toString(), int.parse(a) + 1);
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              globals.products[index].title + " added to cart"),
                        ));
                      },
                      child: ItemCard(
                        product: globals.products[index],
                        press: () {
                          print("test");
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
