import 'package:bet_it/constants.dart';
import 'package:bet_it/screens/ticket_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: padding20),
              child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: padding10),
                    child: Row(
                      children: const [
                        Text(
                          "1000",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize15,
                          ),
                        ),
                        Image(
                          image: AssetImage("assets/betty.png"),
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: padding20),
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
                color: const Color(0xFF282828),
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: padding10),
                  ),
                  Text(
                    'LEC - Ligue Europeene de League Of Legends',
                    style: TextStyle(color: Colors.white, fontSize: fontSize15),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  MatchRow(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF282828),
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: padding10),
                  ),
                  const Text(
                    'LEC - Ligue Europeene de League Of Legends',
                    style: TextStyle(color: Colors.white, fontSize: fontSize15),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        ///depend on font Size
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: const Color(0xFF01579B),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'Rogue',
                                style: TextStyle(
                                  fontSize: fontSize18,
                                  fontWeight: FontWeight.bold,
                                ),
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
                          const Image(
                            image: NetworkImage(
                                'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a4/Rogue_%28European_Team%29logo_square.png/revision/latest/scale-to-width-down/5000?cb=20210810012650 '),
                            height: 50,
                          ),
                          const Padding(padding: EdgeInsets.only(top: padding10)),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('2.1'),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      const Text("VS", style: TextStyle(color: Colors.blueAccent)),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Column(
                        children: [
                          const Image(
                            image: NetworkImage(
                                'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/2/2d/Karmine_Corplogo_square.png/revision/latest/scale-to-width-down/1078?cb=20210312231319'),
                            height: 50,
                          ),
                          const Padding(padding: EdgeInsets.only(top: padding10)),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('1.8'),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Container(
                        ///depend on font Size
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Colors.blueAccent,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                text: ' Karmine Corp',
                                style: TextStyle(fontSize: fontSize18, fontWeight: FontWeight.bold),
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
                color: const Color(0xFF282828),
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: padding10),
                  ),
                  const Text(
                    'LFL - Ligue Francaise de League Of Legends',
                    style: TextStyle(color: Colors.white, fontSize: fontSize15),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        ///depend on font Size
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: const Color(0xFF01579B),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'Rogue',
                                style: TextStyle(fontSize: fontSize18, fontWeight: FontWeight.bold),
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
                          const Image(
                              image: NetworkImage(
                                  'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a4/Rogue_%28European_Team%29logo_square.png/revision/latest/scale-to-width-down/5000?cb=20210810012650 '),
                              height: 50),
                          const Padding(padding: EdgeInsets.only(top: padding10)),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('2.7'),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      const Text("VS", style: TextStyle(color: Colors.blueAccent)),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Column(
                        children: [
                          const Image(
                            image: NetworkImage(
                                'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/f/fc/Fnaticlogo_square.png/revision/latest/scale-to-width-down/5000?cb=20210319200026'),
                            height: 50,
                          ),
                          const Padding(padding: EdgeInsets.only(top: padding10)),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('2.2'),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Container(
                        ///depend on font Size
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Colors.orange,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'Fnatic',
                                style: TextStyle(
                                  fontSize: fontSize18,
                                  fontWeight: FontWeight.bold,
                                ),
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
                color: const Color(0xFF282828),
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: padding10),
                  ),
                  const Text(
                    'Match amical de League Of Legends',
                    style: TextStyle(color: Colors.white, fontSize: fontSize15),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        ///depend on font Size
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Colors.red,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'SKT T1',
                                style: TextStyle(
                                  fontSize: fontSize18,
                                  fontWeight: FontWeight.bold,
                                ),
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
                          const Image(
                            image: NetworkImage(
                                'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a2/T1logo_square.png/revision/latest/scale-to-width-down/5000?cb=20210808140847%20T1.png'),
                            height: 50,
                          ),
                          const Padding(padding: EdgeInsets.only(top: padding10)),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('2.1'),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      const Text("VS", style: TextStyle(color: Colors.blueAccent)),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Column(
                        children: [
                          const Image(
                            image: NetworkImage(
                                'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/2/2d/Karmine_Corplogo_square.png/revision/latest/scale-to-width-down/1078?cb=20210312231319'),
                            height: 50,
                          ),
                          const Padding(padding: EdgeInsets.only(top: padding10)),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('1.7'),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Container(
                        ///depend on font Size
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Colors.blueAccent,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(text: ' Karmine Corp', style: TextStyle(fontSize: fontSize18, fontWeight: FontWeight.bold)),
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
                color: const Color(0xFF282828),
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: padding10),
                  ),
                  const Text(
                    'LPL - Ligue Chinoise de League Of Legends',
                    style: TextStyle(color: Colors.white, fontSize: fontSize15),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        ///depend on font Size
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: const Color(0xFF01579B),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'Rogue',
                                style: TextStyle(
                                  fontSize: fontSize18,
                                  fontWeight: FontWeight.bold,
                                ),
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
                          const Image(
                            image: NetworkImage(
                                'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a4/Rogue_%28European_Team%29logo_square.png/revision/latest/scale-to-width-down/5000?cb=20210810012650 '),
                            height: 50,
                          ),
                          const Padding(padding: EdgeInsets.only(top: padding10)),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('1.8'),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      const Text("VS", style: TextStyle(color: Colors.blueAccent)),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Column(
                        children: [
                          const Image(
                            image: NetworkImage(
                                'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/0/09/TSMlogo_square.png/revision/latest/scale-to-width-down/840?cb=20200118050248%20TSM.png'),
                            height: 50,
                          ),
                          const Padding(padding: EdgeInsets.only(top: padding10)),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('2.1'),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                      ),
                      Container(
                        ///depend on font Size
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: 30,
                        color: Colors.white10,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'TSM',
                                style: TextStyle(
                                  fontSize: fontSize18,
                                  fontWeight: FontWeight.bold,
                                ),
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
                color: const Color(0xFF282828),
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
              child: const Center(
                  child: Text(
                'NO MORE BETS !',
                style: TextStyle(color: Colors.white, fontSize: fontSize15),
              )),
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
            MaterialPageRoute(builder: (context) => const MyTicketPage()),
          );
        },
        child: const Icon(Icons.receipt_long_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.local_fire_department,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.print,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
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

class MatchRow extends StatelessWidget {
  const MatchRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          ///depend on font Size
          height: MediaQuery.of(context).size.height * 0.18,
          width: 30,
          color: Colors.blueAccent,
          child: RotatedBox(
            quarterTurns: 3,
            child: Center(
              child: RichText(
                text: const TextSpan(
                  text: 'Karmine Corp',
                  style: TextStyle(fontSize: fontSize18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          /// <= margin  text container
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 120, left: 50),
        ),
        Column(
          children: [
            const Image(
              image: NetworkImage(
                  'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/2/2d/Karmine_Corplogo_square.png/revision/latest/scale-to-width-down/1078?cb=20210312231319'),
              height: 50,
            ),
            const Padding(padding: EdgeInsets.only(top: padding10)),
            ElevatedButton(
              onPressed: () {},
              child: const Text('2.4'),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 50.0, right: 50),
          child: Text(
            "VS",
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
        Column(
          children: [
            const Image(
              image: NetworkImage(
                  'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/f/fc/Fnaticlogo_square.png/revision/latest/scale-to-width-down/5000?cb=20210319200026'),
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(top: padding10),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('1.8'),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 50),
        ),
        Container(
          ///depend on font Size
          height: MediaQuery.of(context).size.height * 0.18,
          width: 30,
          color: Colors.orange,
          child: RotatedBox(
            quarterTurns: 1,
            child: Center(
              child: RichText(
                text: const TextSpan(
                  text: 'Fnatic',
                  style: TextStyle(
                    fontSize: fontSize18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          /// <= margin  text container
        ),
      ],
    );
  }
}
