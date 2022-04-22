import 'package:bet_it/screens/cart_page.dart';
import 'package:bet_it/screens/inprogress_page.dart';
import 'package:flutter/material.dart';

import '../widgets/finished_page.dart';

class MyTicketPage extends StatefulWidget {
  const MyTicketPage({Key? key}) : super(key: key);

  @override
  State<MyTicketPage> createState() => _MyTicketPage();
}

class _MyTicketPage extends State<MyTicketPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Widget> tabs = const [
    Tab(text: "Panier"),
    Tab(text: "En Cours"),
    Tab(text: "Terminé(s)"),
  ];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        bottom: TabBar(controller: _tabController, tabs: tabs),
        title: const Text('Panier'),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const CartPage(),
          const InProgressPage(),
          FinishedPage(),
        ],
      ),
    );
  }
}
