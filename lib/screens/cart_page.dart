import 'package:bet_it/global.dart';
import 'package:bet_it/widgets/cart_row.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.betList.length,
                itemBuilder: (context, index) {
                  return CartRow(bet: cart.betList.elementAt(index));
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsetsDirectional.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0,4),
                        spreadRadius: 1,
                        blurRadius: 7,
                      )
                    ]
                ),
                width: MediaQuery.of(context).size.width,
                height: 130,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mise totale: "),
                    Text("Total des gains: "),
                    Center(
                      child: Container(
                        color: Colors.blueAccent,
                        width: 350,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("Parier", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
