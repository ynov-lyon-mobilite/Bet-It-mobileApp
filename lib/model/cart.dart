import 'package:bet_it/model/bet.dart';
import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  final List<Bet> _betList = [];
  get betList => List.unmodifiable(_betList);

  void addBet(Bet b){
    _betList.add(b);
    notifyListeners();
  }

}