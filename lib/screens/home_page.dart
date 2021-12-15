import 'package:bet_it/screens/ticket_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          Center(child :
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child:
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    children: const [
                      Text(
                        "1000",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                           ),
                      ),
                      Image(image: AssetImage("assets/betty.png"), width: 30,
                          height: 30,
                          fit:BoxFit.fill)
                    ],
                  ),
                )),),),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.account_circle,
                  size: 26.0,
                ),
              )),

        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF282828),
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 160),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 75),
                      ),
                      Column(
                        children: const [
                          Image(
                              image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a4/Rogue_%28European_Team%29logo_square.png/revision/latest/scale-to-width-down/5000?cb=20210810012650 '),
                              height: 50),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ButtonBar()
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      const Text("VS",
                          style: TextStyle(color: Colors.blueAccent)),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Column(
                        children: const [
                          Image(
                              image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/f/fc/Fnaticlogo_square.png/revision/latest/scale-to-width-down/5000?cb=20210319200026'),
                              height: 50),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ButtonBar()
                        ],
                      ),],
                  ),
                  Row()
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF282828),
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF282828),
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF282828),
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF282828),
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        //Floating action button on Scaffold
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  MyTicketPage()),

          );
        },
        child: Icon(Icons.receipt_long_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.local_fire_department,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.print,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.people,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
