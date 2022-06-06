import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twiscodetest/constants.dart';
import 'package:twiscodetest/screens/home/components/body.dart';
import 'package:twiscodetest/utils/secure_storage.dart';
import '../cart/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     var a = await SecureStorage.readSecureAll();
      //     for (var i in a.keys) {
      //       print(i);
      //       print(a[i]);
      //     }

      //     // print("data" + a['0'].toString());
      //   },
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // leading: IconButton(
      //   icon: SvgPicture.asset("assets/icons/back.svg"),
      //   onPressed: () {},
      // ),
      actions: <Widget>[
        // IconButton(
        //     onPressed: () {},
        //     icon: SvgPicture.asset(
        //       "assets/icons/search.svg",
        //       color: kTextColor,
        //     )),
        IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: kTextColor,
            ))
      ],
    );
  }
}
