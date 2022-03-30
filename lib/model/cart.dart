import 'package:bet_it/model/bet.dart';
import 'package:bet_it/utils/debug_logger.dart';
import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  double totalBet = 0;
  double totalCote = 0;
  double potentialReward = 0;

  final List<Bet> _betList = [];
  get betList => List<Bet>.unmodifiable(_betList);

  Bet getBetValueWithId(String betId){
    return _betList.where((b) => b.betId == betId).first;
  }

  void modifyBetValue(String betId, double newValue){
    getBetValueWithId(betId).setAmount(newValue);
    DebugLogger.debugLog("cart_manager.dart", "modifyBetValue", "Modify bet $betId with $newValue", 2);
    notifyListeners();
  }

  void modifyCombinedBetValue(double value) {
    totalBet = value;
    DebugLogger.debugLog("cart_manager.dart", "modifyCombinedBetValue", "Modify totalbet $totalBet", 2);
    notifyListeners();
  }

  void addBet(Bet b){
    _betList.add(b);
    notifyListeners();
  }

  void removeBet(String betId) {
    _betList.removeWhere((bet) => bet.betId == betId);
    notifyListeners();
  }
}