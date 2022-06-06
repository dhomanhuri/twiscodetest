import 'package:flutter/material.dart';
import 'package:twiscodetest/models/Product.dart';
import 'package:twiscodetest/utils/secure_storage.dart';
import '../cart_screen.dart';
import '../../home/components/body.dart';
import '../../../globals.dart' as globals;
import 'package:twiscodetest/screens/cart/components/checkout.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> idd = [];
  List<String> qty = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    var a = await SecureStorage.readSecureAll();
    print("all data: $a");

    // globals.bayar = 0;
    setState(() {
      for (var i in a.keys) {
        idd.add(i);
        qty.add(a[i].toString());
        // for (var i in a.keys) {
        globals.products[int.parse(i)].price;
        globals.bayar +=
            globals.products[int.parse(i)].price * int.parse(a[i].toString());
        // }
        // print(i);
        // print(a[i]);
      }

      // SecureStorage.deleteSecure("-2");
      // idd.removeAt(-2);
      // qty.removeAt(-2);
    });
    print("idd: $idd");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: idd.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        globals.products[int.parse(idd[index])].image,
                      ),
                      radius: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Text(
                            globals.products[int.parse(idd[index])].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Rp. " +
                              globals.products[int.parse(idd[index])].price
                                  .toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                        Text(
                          "(Baru)",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            qty[index] = (int.parse(qty[index]) - 1).toString();
                            if (int.parse(qty[index]) <= 0) {
                              SecureStorage.deleteSecure(idd[index]);
                              idd.removeAt(index);
                              qty.removeAt(index);
                            } else {
                              SecureStorage.setCart(
                                  idd[index], int.parse(qty[index]));
                            }

                            // globals.bayar -=
                            //     globals.products[int.parse(idd[index])].price;
                            // print(globals.bayar);
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.remove_circle)),
                    Text(
                      qty[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            qty[index] = (int.parse(qty[index]) + 1).toString();
                            SecureStorage.setCart(
                                idd[index], int.parse(qty[index]));
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.add_circle)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
