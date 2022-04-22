import 'package:bet_it/data/match_repository.dart';
import 'package:bet_it/data/team_repository.dart';
import 'package:bet_it/model/bet.dart';
import 'package:bet_it/model/instance_manager.dart';
import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/team.dart';

class BetRepository {
  static Future<List<Bet>> getPersonalBetList() async {
    List<Bet> finalBetList = [];

    final betList = await InstanceManager.getDatabaseInstance().collection("bets").where(
      'ownerid', isEqualTo: InstanceManager.getAuthInstance().currentUser!.uid,
    ).get();

    for (final element in betList.docs) {
      final matchId = element.data()["matchid"];
      Match match = await MatchRepository.getMatchById(matchId) as Match;

      final selectedTeamId = element.data()["selectedteamid"];
      Team selectedTeam = await TeamRepository.getTeamById(selectedTeamId) as Team;

      finalBetList.add(Bet.fromParameters(element.data(), match, selectedTeam));
    }

    return finalBetList;
  }
}
