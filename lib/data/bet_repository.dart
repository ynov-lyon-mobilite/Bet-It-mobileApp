import 'package:bet_it/data/match_repository.dart';
import 'package:bet_it/data/team_repository.dart';
import 'package:bet_it/model/bet_model/bet.dart';
import 'package:bet_it/model/bet_model/simple_bet.dart';
import 'package:bet_it/model/bet_model/combined_bet.dart';
import 'package:bet_it/model/instance_manager.dart';
import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/team.dart';

class BetRepository {
  static Future<List<Bet>> getPersonalBetList() async {
    List<Bet> finalBetList = [];

    final betList = await InstanceManager.getDatabaseInstance()
        .collection("bets")
        .where(
          'ownerid',
          isEqualTo: InstanceManager.getAuthInstance().currentUser!.uid,
        )
        .get();

    for (final element in betList.docs) {
      if (element.data()["isCombined"]) {
        final selectedTeams = element.data()["selectedteams"] as Map<dynamic, dynamic>;
        final totalCote = element.data()["totalcote"];
        final betiesAmount = element.data()["betiesamount"];

        CombinedBet combinedBet = CombinedBet(
          betId: element.data()["betid"],
          betiesAmount: betiesAmount,
          totalCote: totalCote,
          matchList: [],
          selectedTeamList: [],
        );

        for (int i = 0; i < selectedTeams.length; i++) {
          Match match = await MatchRepository.getMatchById(int.parse(selectedTeams.keys.elementAt(i))) as Match;
          Team selectedTeam = await TeamRepository.getTeamById(selectedTeams.values.elementAt(i)) as Team;

          combinedBet.matchList.add(match);
          combinedBet.selectedTeamList.add(selectedTeam);
        }
        finalBetList.add(combinedBet);

      } else {
        final matchId = element.data()["matchid"];
        Match match = await MatchRepository.getMatchById(matchId) as Match;

        final selectedTeamId = element.data()["selectedteamid"];
        Team selectedTeam = await TeamRepository.getTeamById(selectedTeamId) as Team;

        finalBetList.add(SimpleBet.fromParameters(element.data(), match, selectedTeam));
      }
    }

    return finalBetList;
  }
}
