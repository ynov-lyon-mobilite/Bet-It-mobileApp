import 'package:bet_it/constants.dart';
import 'package:bet_it/data/bet_repository.dart';
import 'package:bet_it/model/bet.dart';
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
              body: ListView.builder(
                itemCount: betList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${betList.elementAt(index).match.team1.teamName} vs ${betList.elementAt(index).match.team1.teamName}",
                                style: const TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                              const Text("Résultat envisagé:"),
                              Text(
                                betList.elementAt(index).selectedTeam.teamName!,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text("Beties misés:"),
                              Text("${betList.elementAt(index).amount}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
}
