import 'package:bet_it/model/bet_model/bet.dart';
import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/team.dart';

class CombinedBet extends Bet{
  late double betiesAmount;
  late double totalCote;
  List<Match> matchList = [];
  List<Team> selectedTeamList = [];

  CombinedBet({
    required this.betiesAmount,
    required this.totalCote,
    required this.matchList,
    required this.selectedTeamList,
    required String betId,
  }) : super(betId);

}
