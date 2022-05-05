import 'package:bet_it/constants.dart';
import 'package:bet_it/data/bet_repository.dart';
import 'package:bet_it/model/bet_model/bet.dart';
import 'package:bet_it/model/bet_model/combined_bet.dart';
import 'package:bet_it/model/bet_model/simple_bet.dart';
import 'package:bet_it/utils/debug_logger.dart';
import 'package:flutter/material.dart';

class InProgressPage extends StatefulWidget {
  const InProgressPage({Key? key}) : super(key: key);

  @override
  State<InProgressPage> createState() => _InProgressPageState();
}

class _InProgressPageState extends State<InProgressPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BetRepository.getPersonalBetList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Bet> betList = snapshot.data as List<Bet>;

            return Scaffold(
              backgroundColor: backgroundColor,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: betList.length,
                    itemBuilder: (context, index) {
                      return buildInProgressBet(betList[index]);
                    },
                  ),
                ),
              ),
            );
          } else {
            return const Scaffold(
              backgroundColor: backgroundColor,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  Padding buildInProgressBet(Bet bet) {
    bool isSimpleBet = bet is SimpleBet;

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: isSimpleBet ? buildSimpleBet(bet) : buildCombinedBet(bet as CombinedBet),
      ),
    );
  }

  buildCombinedBet(CombinedBet bet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            bet.matchList.length,
            (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${bet.matchList.elementAt(index).team1.teamName} vs ${bet.matchList.elementAt(index).team2.teamName}",
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  const Text("Résultat envisagé:"),
                  Text(
                    "${bet.selectedTeamList.elementAt(index).teamName}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                ],
              );
            },
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Beties misés:"),
            Text(
              "${bet.betiesAmount}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text("Cote totale:"),
            Text(
              "${bet.totalCote}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Row buildSimpleBet(SimpleBet bet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${bet.match.team1.teamName} vs ${bet.match.team2.teamName}",
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
            const Text("Résultat envisagé:"),
            Text(
              bet.selectedTeam.teamName!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            const Text("Beties misés:"),
            Text(
              "${bet.amount}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
