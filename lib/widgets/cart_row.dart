import 'package:bet_it/global.dart';
import 'package:bet_it/model/bet.dart';
import 'package:flutter/material.dart';

class CartRow extends StatefulWidget {
  final Bet bet;

  const CartRow({Key? key, required this.bet}) : super(key: key);

  @override
  _CartRowState createState() => _CartRowState();
}

class _CartRowState extends State<CartRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            color: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.bet.match.team1.name + " vs " + widget.bet.match.team2.name,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  Text(
                    "Resultat du match: " + widget.bet.selectedTeam.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Cote",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(widget.bet.match.coteT1.toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox(
                            width: 250,
                            child: TextFormField(
                              initialValue: "0",
                              onChanged: (value) {
                                if(value == "") {
                                  cart.modifyBetValue(widget.bet.betId, 0.0);
                                } else {
                                  cart.modifyBetValue(widget.bet.betId, double.parse(value));
                                }
                              },
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5.0),
                                hintText: "Saisis ta mise",
                                suffixIcon: Icon(Icons.euro),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close, size: 15),
              onPressed: () {
                setState(() {
                  cartManager.removeBetFromCart(widget.bet.betId);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
