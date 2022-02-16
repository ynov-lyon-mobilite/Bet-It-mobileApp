import 'package:bet_it/model/team.dart';

class Match {
  String id;
  double coteT1;
  double coteT2;
  Team team1;
  Team team2;

  Match({
    required this.id,
    required this.team1,
    required this.team2,
    required this.coteT1,
    required this.coteT2,
  });
}
