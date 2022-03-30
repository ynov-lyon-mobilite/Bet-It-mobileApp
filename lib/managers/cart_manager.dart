import 'package:bet_it/global.dart';
import 'package:bet_it/managers/bet_manager.dart';
import 'package:bet_it/model/bet.dart';
import 'package:bet_it/model/instance_manager.dart';
import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/team.dart';
import 'package:bet_it/utils/debug_logger.dart';
import 'package:bet_it/widgets/cart_row.dart';
import 'package:flutter/material.dart';

class CartManager {
  bool isSimpleSelected = true;

  bool saveBetsInDatabase(Bet bet) {
    InstanceManager.getDatabaseInstance().collection("bets").add(
      {
        "owner": InstanceManager.getDatabaseInstance()
            .collection("users")
            .doc(InstanceManager.getAuthInstance().currentUser!.uid),
        "selectedteamid": bet.selectedTeam.teamId,
        "matchid": bet.match.id,
        "betiesamount": bet.amount,
        "selectedteamcote": bet.selectedTeamCote,
      },
    );
    return false;
  }

  Future<bool> saveBetsRangeInDatabase(List<Bet> betList) async {
    bool insertResult = false;

    if(betList.isNotEmpty){
      for (final bet in betList) {
        if(await BetManager.checkBetNotInDB(bet)){
          InstanceManager.getDatabaseInstance().collection("bets").add(
            {
              "ownerid": InstanceManager.getDatabaseInstance()
                  .collection("users")
                  .doc(InstanceManager.getAuthInstance().currentUser!.uid),
              "selectedteamid": bet.selectedTeam.teamId,
              "matchid": bet.match.id,
              "betiesamount": bet.amount,
              "selectedteamcote": bet.selectedTeamCote,
            },
          );
          insertResult = true;
        } else {
          insertResult = false;
        }
      }
    } else {
      insertResult = false;
    }
    return insertResult;
  }

  List<Widget> generateWidgetFromList() {
    return (cart.betList as List<Bet>).map((bet) => CartRow(bet: bet)).toList();
  }

  void computeTotalBet() {
    cart.totalBet = 0;
    for (final bet in cart.betList as List<Bet>) {
      cart.totalBet += bet.amount;
    }
  }

  void computeTotalCote() {
    cart.totalCote = 1;
    for (final bet in cart.betList as List<Bet>) {
      cart.totalCote *= bet.selectedTeamCote;
    }
  }

  void computePotentialReward() {
    if (isSimpleSelected) {
      cart.potentialReward = 0;
      for (final bet in cart.betList as List<Bet>) {
        cart.potentialReward += bet.amount * bet.selectedTeamCote;
      }
      DebugLogger.debugLog("cart_manager.dart", "computePotentialReward",
          "SIMPLE | Change potential reward to ${cart.potentialReward}", 2);
    } else {
      cart.potentialReward = cart.totalBet * cart.totalCote;
      DebugLogger.debugLog("cart_manager.dart", "computePotentialReward",
          "COMBINED | Change potential reward to ${cart.potentialReward}", 2);
    }
  }

  bool addBetToCart(Team team, Match match, double cote) {
    if ((cart.betList as List<Bet>).where((m) => m.match.id == match.id).isEmpty) {
      cart.addBet(Bet(selectedTeam: team, match: match, selectedTeamCote: cote));
      return true;
    }
    return false;
  }

  void removeBetFromCart(String betId) {
    DebugLogger.debugLog("cart_manager.dart", "removeBetFromCart", "Remove bet $betId", 2);
    cart.removeBet(betId);
  }

  void resetPotentialReward() {
    cart.potentialReward = 0;
    cart.totalBet = 0;
  }
}
