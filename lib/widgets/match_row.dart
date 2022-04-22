import 'package:bet_it/constants.dart';
import 'package:bet_it/global.dart';
import 'package:bet_it/model/match.dart';
import 'package:flutter/material.dart';

class MatchRow extends StatefulWidget {
  final Match match;

  const MatchRow({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  State<MatchRow> createState() => _MatchRowState();
}

class _MatchRowState extends State<MatchRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: backgroundColor,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildLeftTeamColumn(context),
            buildVSText(),
            buildRightTeamColumn(context),
          ],
        ),
      ),
    );
  }

  buildLeftTeamColumn(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          widget.match.team1.logo != null ? Image.network(widget.match.team1.logo!, height: 50) : Image.asset("assets/default-image.png", height: 50),
          Text("${widget.match.team1.teamName}", overflow: TextOverflow.ellipsis),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                if (!cartManager.addBetToCart(widget.match.team1, widget.match, widget.match.coteT1)) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Oups.."),
                        content: const Text("Vous avez déjà parié sur ce match"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("D'accord"),
                          ),
                        ],
                      );
                    },
                  );
                } else {}
              },
              child: Text(widget.match.coteT1.toString()),
            ),
          ),
        ],
      ),
    );
  }

  buildRightTeamColumn(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          widget.match.team2.logo != null ? Image.network(widget.match.team2.logo!, height: 50,) : Image.asset("assets/default-image.png", height: 50,),
          Text(widget.match.team2.teamName!, overflow: TextOverflow.ellipsis),
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                if (!cartManager.addBetToCart(widget.match.team2, widget.match, widget.match.coteT2)) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Oups.."),
                        content: const Text("Vous avez déjà parié sur ce match"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("D'accord"),
                          ),
                        ],
                      );
                    },
                  );
                } else {}
              },
              child: Text(widget.match.coteT2.toString()),
            ),
          ),
        ],
      ),
    );
  }

  Text buildVSText() {
    return const Text(
      "VS",
      style: TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Container buildRightTeamBanner(BuildContext context) {
    return Container(
      ///depend on font Size
      height: MediaQuery.of(context).size.height * 0.18,
      width: 30,
      child: RotatedBox(
        quarterTurns: 1,
        child: Center(
          child: RichText(
            text: TextSpan(
              text: "${widget.match.team2.teamName}",
              style: const TextStyle(
                color: foregroundColor,
                fontSize: fontSize18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),

      /// <= margin  text container
    );
  }

  Container buildLeftTeamBanner(BuildContext context) {
    return Container(
      ///depend on font Size
      height: MediaQuery.of(context).size.height * 0.18,
      width: 30,
      child: RotatedBox(
        quarterTurns: 3,
        child: Center(
          child: RichText(
            text: TextSpan(
              text: "${widget.match.team1.teamName}",
              style: const TextStyle(
                fontSize: fontSize18,
                fontWeight: FontWeight.bold,
                color: foregroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
