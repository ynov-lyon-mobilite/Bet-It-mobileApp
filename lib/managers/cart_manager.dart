import 'package:bet_it/global.dart';
import 'package:bet_it/managers/bet_manager.dart';
import 'package:bet_it/model/bet_model/simple_bet.dart';
import 'package:bet_it/model/instance_manager.dart';
import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/team.dart';
import 'package:bet_it/utils/debug_logger.dart';
import 'package:bet_it/widgets/cart_row.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartManager {
  bool isSimpleSelected = true;

  Future<bool> saveCombinedBet(List<int> matchList, List<int> selectedTeamIdList, double totalCote, double mise) async {
    bool result = false;

    if (matchList.isNotEmpty && mise > 0) {
      Map<String, int> betMatchMap = {};

      for (var i = 0; i < matchList.length; i++) {
        betMatchMap.putIfAbsent(matchList[i].toString(), () => selectedTeamIdList[i]);
      }

      await InstanceManager.getDatabaseInstance().collection("bets").add(
        {
          "betid": const Uuid().v4(),
          "isCombined": true,
          "ownerid": InstanceManager.getAuthInstance().currentUser!.uid,
          "selectedteams": betMatchMap,
          "betiesamount": mise,
          "totalcote": double.parse(totalCote.toStringAsFixed(2)),
        },
      );

      result = true;
    }
    return result;
  }

  Future<bool> saveBetsRangeInDatabase(List<SimpleBet> betList) async {
    bool insertResult = false;

    if (betList.isNotEmpty) {
      for (final bet in betList) {
        if (await BetManager.checkBetNotInDB(bet)) {
          InstanceManager.getDatabaseInstance().collection("bets").add(
            {
              "isCombined": false,
              "betid": bet.betId,
              "ownerid": InstanceManager.getAuthInstance().currentUser!.uid,
              "selectedteamid": bet.selectedTeam.id,
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
    return cart.getBetList().map((bet) => CartRow(bet: bet)).toList();
  }

  void computeTotalBet() {
    cart.totalBet = 0;
    for (final bet in cart.getBetList()) {
      cart.totalBet += bet.amount;
    }
  }

  void computeTotalCote() {
    cart.totalCote = 1;
    for (final bet in cart.getBetList()) {
      cart.totalCote *= bet.selectedTeamCote;
    }
  }

  void computePotentialReward() {
    if (isSimpleSelected) {
      cart.potentialReward = 0;
      for (final bet in cart.getBetList()) {
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
    if (cart.getBetList().where((m) => m.match.id == match.id).isEmpty) {
      cart.addBet(SimpleBet(selectedTeam: team, match: match, selectedTeamCote: cote));
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
    cart.totalCote = 0;
  }

  void clearCart() {
    cart.clearCart();
    resetPotentialReward();
  }
}
