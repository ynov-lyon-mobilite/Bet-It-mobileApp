import 'package:bet_it/screens/cart_page.dart';
import 'package:flutter/material.dart';

import '../widgets/finished_page.dart';

class MyTicketPage extends StatefulWidget {
  const MyTicketPage({Key? key}) : super(key: key);

  @override
  State<MyTicketPage> createState() => _MyTicketPage();
}

class _MyTicketPage extends State<MyTicketPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: const Color(0xFF121212),
          appBar: AppBar(
            shadowColor: Colors.transparent,
            bottom: const TabBar(
              tabs: [
                Tab(text: "Panier"),
                Tab(text: "En Cours"),
                Tab(text: "Terminé(s)"),
              ],
            ),
            title: const Text('Panier'),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const CartPage(),
              const Center(child: Text("ok")),
              FinishedPage()
            ],
          ),
        )
    );
  }
}
