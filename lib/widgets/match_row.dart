import 'package:bet_it/constants.dart';
import 'package:bet_it/model/match.dart';
import 'package:flutter/material.dart';

class MatchRow extends StatelessWidget {
  final Match match;

  const MatchRow({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        )
      ),
      child: Row(
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
                  text: TextSpan(
                    text: match.team1.name,
                    style: const TextStyle(fontSize: fontSize18, fontWeight: FontWeight.bold),
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
              Image(
                image: NetworkImage(match.team1.imageUrl),
                height: 50,
              ),
              const Padding(padding: EdgeInsets.only(top: padding10)),
              ElevatedButton(
                onPressed: () {},
                child: Text(match.coteT1.toString()),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50),
            child: Text(
              "VS",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              Image(
                image: NetworkImage(match.team2.imageUrl),
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(top: padding10),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(match.coteT2.toString()),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              ///depend on font Size
              height: MediaQuery.of(context).size.height * 0.18,
              width: 30,
              color: Colors.orange,
              child: RotatedBox(
                quarterTurns: 1,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: match.team2.name,
                      style: const TextStyle(
                        fontSize: fontSize18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              /// <= margin  text container
            ),
          ),
        ],
      ),
    );
  }
}
