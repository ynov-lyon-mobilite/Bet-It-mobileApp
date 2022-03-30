import 'package:bet_it/constants.dart';
import 'package:bet_it/global.dart';
import 'package:bet_it/model/bet.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    cart.addListener(() {
      if (mounted) setState(() => Null);
      if(cartManager.isSimpleSelected) cartManager.computeTotalBet();
      cartManager.computePotentialReward();
      cartManager.computeTotalCote();
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
              onTap: () => setState(() => cartManager.isSimpleSelected = true),
              child: Container(
                alignment: Alignment.center,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: cartManager.isSimpleSelected ? Colors.blue : Colors.white,
                  border: Border.all(
                    color: cartManager.isSimpleSelected ? Colors.transparent : Colors.blue,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Text(
                  "Simple",
                  style: TextStyle(
                    color: cartManager.isSimpleSelected ? whiteForegroundColor : Colors.blue,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  cartManager.isSimpleSelected = false;
                  cartManager.resetPotentialReward();
                  cartManager.computeTotalCote();
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: cartManager.isSimpleSelected ? Colors.blue : Colors.transparent,
                  ),
                  color: cartManager.isSimpleSelected ? Colors.white : Colors.blue,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  "Combiné",
                  style: TextStyle(
                    color: cartManager.isSimpleSelected ? Colors.blue : whiteForegroundColor,
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
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cartManager.isSimpleSelected ? buildSimpleBetColumn() : buildCombinedBetColumn(),
              !cartManager.isSimpleSelected ? buildBetFieldCombined() : const SizedBox.shrink(),
            ],
          ),
          InkWell(
            onTap: () async {
              if(cartManager.isSimpleSelected){
                if(await cartManager.saveBetsRangeInDatabase(cart.betList)){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Super !"),
                        content: const Text("Vos paris ont été enregistrés"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("D'accord"),
                          ),
                        ],
                      );
                    },
                  );
                } else {

                }
              }
            },
            child: Container(
              color: Colors.blueAccent,
              width: MediaQuery.of(context).size.width,
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                "Parier",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildBetFieldCombined() {
    return Container(
      height: 35,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.number,
        initialValue: "0",
        decoration: const InputDecoration(
          hintText: "Saisis ta mise",
        ),
        onChanged: (value) {
          if (value == "") {
            cart.modifyCombinedBetValue(0.0);
          } else {
            cart.modifyCombinedBetValue(double.parse(value));
          }
        },
      ),
    );
  }

  Widget buildCombinedBetColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Côte totale: "),
            Text(
              cart.totalCote.toStringAsFixed(2),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        buildPotentialReward(),
      ],
    );
  }

  Column buildSimpleBetColumn() {
    return Column(
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
        buildPotentialReward(),
      ],
    );
  }

  Row buildPotentialReward() {
    return Row(
      children: [
        const Text("Gain potentiel: "),
        Text(
          cart.potentialReward.toStringAsFixed(2),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(" beties"),
      ],
    );
  }
}
