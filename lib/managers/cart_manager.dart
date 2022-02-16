import 'package:bet_it/global.dart';
import 'package:bet_it/model/bet.dart';
import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/team.dart';
import 'package:bet_it/utils/debug_logger.dart';

class CartManager {
  void computeTotalBet() {
    cart.totalBet = 0;
    for (final bet in cart.betList as List<Bet>) {
      cart.totalBet += bet.amount;
    }
  }

  void computePotentialReward(){
    cart.potentialReward = 0;
    for (final bet in cart.betList as List<Bet>) {
      cart.potentialReward += bet.amount*bet.selectedTeamCote;
    }
  }

  bool addBetToCart(Team team, Match match, double cote) {
    if((cart.betList as List<Bet>).where((m) => m.match.id == match.id).isEmpty) {
      cart.addBet(Bet(selectedTeam: team, match: match, selectedTeamCote: cote));
      return true;
    }
    return false;
  }

  void removeBetFromCart(String betId) {
    DebugLogger.debugLog("cart_manager.dart", "removeBetFromCart", "Remove bet $betId", 2);
    cart.removeBet(betId);
  }
}
