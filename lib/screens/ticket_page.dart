import 'package:flutter/material.dart';

class MyTicketPage extends StatefulWidget {
  const MyTicketPage({Key? key}) : super(key: key);

  @override
  State<MyTicketPage> createState() => _MyTicketPage();
}

class _MyTicketPage extends State<MyTicketPage> {
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          width: 160.0,
          color: Colors.red,
        ),
        Container(
          width: 160.0,
          color: Colors.blue,
        ),
        Container(
          width: 160.0,
          color: Colors.green,
        ),
        Container(
          width: 160.0,
          color: Colors.yellow,
        ),
        Container(
          width: 160.0,
          color: Colors.orange,
        ),
      ],
=======
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
          body: const TabBarView(
            children: [
              Center(child: Text("Car")),
              Center(child: Text("Transit")),
              Center(child: Text("ok"))
            ],
          ),
        )
>>>>>>> Stashed changes
    );
  }
}
