
import 'package:flutter/material.dart';

class FinishedPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              gradient: LinearGradient(begin: FractionalOffset.topLeft, end: FractionalOffset.bottomRight, colors: [
                Color(0xFF148535),
                Color(0xFF148535),
                Color(0XFF0D6630),
                Color(0XFF0D6630),
                Color(0xFF148535),
                Color(0xFF148535),
              ], stops: [
                0.0,
                0.3,
                0.3,
                0.7,
                0.7,
                1.0
              ]),
            ),
            height: MediaQuery.of(context).size.height * 0.125,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 90),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 75),
                    ),
                    Column(
                      children: const [
                        Image(
                            image: NetworkImage('https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a4/Rogue_%28European_Team%29logo_square.png/revision/latest/scale-to-width-down/5000?cb=20210810012650 '),
                            height: 50),
                        Padding(padding: EdgeInsets.only(top: 5)),
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
              borderRadius: BorderRadius.circular(6.0),
              gradient: LinearGradient(begin: FractionalOffset.topLeft, end: FractionalOffset.bottomRight, colors: [
                Color(0xFFBB0B0B),
                Color(0xFFBB0B0B),
                Color(0XFF850606),
                Color(0XFF850606),
                Color(0xFFBB0B0B),
                Color(0xFFBB0B0B),
              ], stops: [
                0.0,
                0.3,
                0.3,
                0.7,
                0.7,
                1.0
              ]),
            ),
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom:100),
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
        ],
      ),
    );
  }
}
