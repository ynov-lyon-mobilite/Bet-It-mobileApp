import 'package:bet_it/global.dart';
import 'package:bet_it/model/bet.dart';
import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/team.dart';

class BetManager {
  void addBetToCart(Team team, Match match){
    cart.addBet(Bet(selectedTeam: team, match: match));
  }
}