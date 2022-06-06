import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../globals.dart' as globals;
import 'package:twiscodetest/utils/secure_storage.dart';
import '../../../constants.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  int bayar = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initb();
    // bayar = globals.total;
  }

  initb() async {
    // await SecureStorage.deleteSecureAll();
    var a = await SecureStorage.readSecureAll();
    print("all data: $a");
    setState(() {
      for (var i in a.keys) {
        globals.products[int.parse(i)].price;
        bayar +=
            globals.products[int.parse(i)].price * int.parse(a[i].toString());
      }
    });
    globals.bayar = bayar;
    // print("bayar: $bayar");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: (15),
        horizontal: (30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: (20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total harga:\n",
                    children: [
                      TextSpan(
                        text: "\Rp " + globals.bayar.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      print(globals.bayar);
                    },
                    child: Container(
                      width: (100),
                      height: (50),
                      alignment: Alignment.center,
                      child: Text("Order"),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
