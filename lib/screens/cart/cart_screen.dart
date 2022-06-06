import 'package:flutter/material.dart';
import 'package:twiscodetest/models/product.dart';
import 'package:twiscodetest/screens/home/home_screen.dart';
import 'package:twiscodetest/utils/secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twiscodetest/constants.dart';
import 'package:twiscodetest/screens/cart/components/body.dart';
import 'package:twiscodetest/screens/cart/components/checkout.dart';

class CartScreen extends StatefulWidget {
  static String routeName = '/CartScreen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      ),
      // actions: <Widget>[
      //   IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset(
      //         "assets/icons/search.svg",
      //         color: kTextColor,
      //       )),
      //   IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset(
      //         "assets/icons/cart.svg",
      //         color: kTextColor,
      //       ))
      // ],
    );
  }
}
