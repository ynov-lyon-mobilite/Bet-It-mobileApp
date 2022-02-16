import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/team.dart';
import 'package:uuid/uuid.dart';

class Bet {
  late String betId;
  Team selectedTeam;
  Match match;

  double _amount = 0;
  get amount => _amount;

  Bet({required this.selectedTeam, required this.match}){
    betId = const Uuid().v4();
  }

  void setAmount(double a){
    if(a > 0) _amount = a;
  }
}