import 'package:bet_it/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../main.dart';


class AccountCode extends StatelessWidget {
  const AccountCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code(s) Joueur'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const Center(
            child: Text(
              "Veuillez saisir votre code promotionel :",
            ),
          ),
          Center( child: TextField()),
          Center(
            child: ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {

              },
            ),
          ),
        ],),


      ),
    );
  }
}
