import 'package:bet_it/constants.dart';
import 'package:bet_it/global.dart';
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

  Column buildLeftTeamColumn(BuildContext context) {
    return Column(
      children: [
        Image(
          image: NetworkImage(match.team1.imageUrl),
          height: 50,
        ),
        Text(match.team1.name),
        SizedBox(
          width: buttonWidth,
          child: ElevatedButton(
            onPressed: () {
              if (!cartManager.addBetToCart(match.team1, match, match.coteT1)) {
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
            child: Text(match.coteT1.toString()),
          ),
        ),
      ],
    );
  }

  Column buildRightTeamColumn(BuildContext context) {
    return Column(
      children: [
        Image(
          image: NetworkImage(match.team2.imageUrl),
          height: 50,
        ),
        Text(match.team2.name),
        SizedBox(
          width: buttonWidth,
          child: ElevatedButton(
            onPressed: () {
              if (!cartManager.addBetToCart(match.team2, match, match.coteT2)) {
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
            child: Text(match.coteT2.toString()),
          ),
        ),
      ],
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
      color: match.team2.teamBannerColor,
      child: RotatedBox(
        quarterTurns: 1,
        child: Center(
          child: RichText(
            text: TextSpan(
              text: match.team2.name,
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
      color: match.team1.teamBannerColor,
      child: RotatedBox(
        quarterTurns: 3,
        child: Center(
          child: RichText(
            text: TextSpan(
              text: match.team1.name,
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
