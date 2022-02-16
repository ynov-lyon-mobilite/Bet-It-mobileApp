import 'package:bet_it/constants.dart';
import 'package:bet_it/global.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isSimpleSelected = true;

  @override
  void initState() {
    cart.addListener(() {
      if (mounted) setState(() => Null);
      cartManager.computeTotalBet();
      cartManager.computePotentialReward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          bottomSheet: buildBottomPanel(context),
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildBetTypeButtonsRow(),
                Column(children: cartManager.generateWidgetFromList()),
                const SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildBetTypeButtonsRow() {
    return Container(
      height: 35,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => setState(() => isSimpleSelected = true),
              child: Container(
                alignment: Alignment.center,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: isSimpleSelected ? Colors.blue : Colors.white,
                  border: Border.all(
                    color: isSimpleSelected ? Colors.transparent : Colors.blue,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Text(
                  "Simple",
                  style: TextStyle(
                    color: isSimpleSelected ? whiteForegroundColor : Colors.blue,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => setState(() => isSimpleSelected = false),
              child: Container(
                alignment: Alignment.center,
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSimpleSelected ? Colors.blue : Colors.transparent,
                  ),
                  color: isSimpleSelected ? Colors.white : Colors.blue,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  "Combiné",
                  style: TextStyle(
                    color: isSimpleSelected ? Colors.blue : whiteForegroundColor,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 4),
            spreadRadius: 1,
            blurRadius: 7,
          )
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Mise totale: "),
                  Text(
                    "${cart.totalBet}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(" beties"),
                ],
              ),
              Row(
                children: [
                  const Text("Gain total: "),
                  Text(
                    cart.potentialReward.toStringAsFixed(3),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(" beties"),
                ],
              ),
            ],
          ),
          Container(
            color: Colors.blueAccent,
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Parier",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
