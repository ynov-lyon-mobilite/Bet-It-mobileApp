import 'package:bet_it/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../main.dart';


class FantasyLeague extends StatelessWidget {
  const FantasyLeague({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fantasy League'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Text("La Fantasy League est en maintenance"),
                  Image(image: AssetImage('assets/heimer.png')),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Retour'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
            ),

          ],

        ),
      ),
    );
  }
}
