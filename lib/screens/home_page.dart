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
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Text('LEC - Ligue Europeene de League Of Legends', style: TextStyle( color: Colors.white, fontSize: 15),),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        ///depend on font Size
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Colors.blueAccent,
                        child:
                        RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                  text: 'Karmine Corp',
                                  style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold)
                              ),
                            ),
                          ),
                        ),
                        /// <= margin  text container
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 120),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Column(
                        children: [
                          Image(image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/2/2d/Karmine_Corplogo_square.png/revision/latest/scale-to-width-down/1078?cb=20210312231319'), height: 50),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ElevatedButton(
                            onPressed: () {  }, child: const Text('2.4'),

                          ),
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
                        children: [
                          Image(
                              image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/f/fc/Fnaticlogo_square.png/revision/latest/scale-to-width-down/5000?cb=20210319200026'),
                              height: 50),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ElevatedButton(
                            onPressed: () {  }, child: const Text('1.8'),

                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Container(
                        ///depend on font Size
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Colors.orange,
                        child:
                        RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                  text: 'Fnatic',
                                  style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold)
                              ),
                            ),
                          ),
                        ),
                        /// <= margin  text container
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF282828),
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Text('LEC - Ligue Europeene de League Of Legends', style: TextStyle( color: Colors.white, fontSize: 15),),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        ///depend on font Size
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Color(0xFF01579B),
                        child:
                        RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                  text: 'Rogue',
                                  style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold)
                              ),
                            ),
                          ),
                        ),
                        /// <= margin  text container
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 120),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Column(
                        children: [
                          Image(
                              image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a4/Rogue_%28European_Team%29logo_square.png/revision/latest/scale-to-width-down/5000?cb=20210810012650 '),
                              height: 50),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ElevatedButton(
                            onPressed: () {  }, child: const Text('2.1'),

                          ),
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
                        children: [
                          Image(
                              image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/2/2d/Karmine_Corplogo_square.png/revision/latest/scale-to-width-down/1078?cb=20210312231319'),
                              height: 50),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ElevatedButton(
                            onPressed: () {  }, child: const Text('1.8'),

                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Container(
                        ///depend on font Size
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Colors.blueAccent,
                        child:
                        RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                  text: ' Karmine Corp',
                                  style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold)
                              ),
                            ),
                          ),
                        ),
                        /// <= margin  text container
                      ),],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF282828),
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Text('LFL - Ligue Francaise de League Of Legends', style: TextStyle( color: Colors.white, fontSize: 15),),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        ///depend on font Size
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Color(0xFF01579B),
                        child:
                        RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                  text: 'Rogue',
                                  style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold)
                              ),
                            ),
                          ),
                        ),
                        /// <= margin  text container
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 120),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Column(
                        children:  [
                          Image(
                              image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a4/Rogue_%28European_Team%29logo_square.png/revision/latest/scale-to-width-down/5000?cb=20210810012650 '),
                              height: 50),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ElevatedButton(
                            onPressed: () {  }, child: const Text('2.7'),

                          ),
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
                        children: [
                          Image(
                              image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/f/fc/Fnaticlogo_square.png/revision/latest/scale-to-width-down/5000?cb=20210319200026'),
                              height: 50),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ElevatedButton(
                            onPressed: () {  }, child: const Text('2.2'),

                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Container(
                        ///depend on font Size
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Colors.orange,
                        child:
                        RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                  text: 'Fnatic',
                                  style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold)
                              ),
                            ),
                          ),
                        ),
                        /// <= margin  text container
                      ),],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF282828),
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Text('Match amical de League Of Legends', style: TextStyle( color: Colors.white, fontSize: 15),),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        ///depend on font Size
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Colors.red,
                        child:
                        RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                  text: 'SKT T1',
                                  style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold)
                              ),
                            ),
                          ),
                        ),
                        /// <= margin  text container
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 120),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Column(
                        children: [
                          Image(
                              image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a2/T1logo_square.png/revision/latest/scale-to-width-down/5000?cb=20210808140847%20T1.png'),
                              height: 50),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ElevatedButton(
                            onPressed: () {  }, child: const Text('2.1'),

                          ),
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
                        children: [
                          Image(
                              image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/2/2d/Karmine_Corplogo_square.png/revision/latest/scale-to-width-down/1078?cb=20210312231319'),
                              height: 50),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ElevatedButton(
                            onPressed: () {  }, child: const Text('1.7'),

                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Container(
                        ///depend on font Size
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Colors.blueAccent,
                        child:
                        RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                  text: ' Karmine Corp',
                                  style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold)
                              ),
                            ),
                          ),
                        ),
                        /// <= margin  text container
                      ),],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF282828),
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Text('LPL - Ligue Chinoise de League Of Legends', style: TextStyle( color: Colors.white, fontSize: 15),),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        ///depend on font Size
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Color(0xFF01579B),
                        child:
                        RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                  text: 'Rogue',
                                  style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold)
                              ),
                            ),
                          ),
                        ),
                        /// <= margin  text container
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 120),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Column(
                        children: [
                          Image(
                              image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a4/Rogue_%28European_Team%29logo_square.png/revision/latest/scale-to-width-down/5000?cb=20210810012650 '),
                              height: 50),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ElevatedButton(
                            onPressed: () {  }, child: const Text('1.8'),

                          ),
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
                        children: [
                          Image(
                              image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/0/09/TSMlogo_square.png/revision/latest/scale-to-width-down/840?cb=20200118050248%20TSM.png'),
                              height: 50),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ElevatedButton(
                            onPressed: () {  }, child: const Text('2.1'),

                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Container(
                        ///depend on font Size
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Colors.white10,
                        child:
                        RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                  text: 'TSM',
                                  style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold)
                              ),
                            ),
                          ),
                        ),
                        /// <= margin  text container
                      ),],
                  ),
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
              child: Center(child: Text('NO MORE BETS !', style: TextStyle( color: Colors.white, fontSize: 15),)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
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
