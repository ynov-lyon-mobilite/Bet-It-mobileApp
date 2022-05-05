import 'package:bet_it/model/bet_model/bet.dart';
import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/team.dart';
import 'package:uuid/uuid.dart';

class SimpleBet extends Bet {
  double selectedTeamCote = 0;
  Team selectedTeam;
  Match match;

  double _amount = 0;
  get amount => _amount;

  SimpleBet({required this.selectedTeam, required this.match, required this.selectedTeamCote}) : super(const Uuid().v4());

  void setAmount(double a){
    if(a >= 0) _amount = a;
  }

  SimpleBet.fromParameters(Map<String, dynamic> data, this.match, this.selectedTeam) : super(data["betid"]){
    _amount = data["betiesamount"];
  }
}