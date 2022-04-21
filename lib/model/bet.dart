import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/team.dart';
import 'package:uuid/uuid.dart';

class Bet {
  double selectedTeamCote = 0;
  late String betId;
  Team selectedTeam;
  Match match;

  double _amount = 0;
  get amount => _amount;

  Bet({required this.selectedTeam, required this.match, required this.selectedTeamCote}){
    betId = const Uuid().v4();
  }

  void setAmount(double a){
    if(a >= 0) _amount = a;
  }

  Bet.fromParameters(Map<String, dynamic> data, this.match, this.selectedTeam){
    betId = data["betid"];
    _amount = data["betiesamount"];
  }
}