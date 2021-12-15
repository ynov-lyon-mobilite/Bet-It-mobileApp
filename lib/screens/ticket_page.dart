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
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "Panier"),
                Tab(text: "En Cours"),
                Tab(text: "Terminé(s)"),
              ],
            ),
            title: const Text('Flutter Tabs Example'),
          ),
          body: TabBarView(
            children: [
              FinishedPage(),
              Center(child: Text("Transit")),
              Center(child: Text("ok"))
            ],
          ),
        )
    );
  }
}
