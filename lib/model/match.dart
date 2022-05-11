import 'package:bet_it/model/team.dart';
import 'package:bet_it/model/tournament_start_date.dart';

class Match {
  late int id;
  late TournamentStartDate? matchDate;
  late String matchName;
  late String tournamentName;
  late Team team1;
  late Team team2;
  double coteT1 = 0;
  double coteT2 = 0;
  late String? winner;

  Match({
    required this.id,
    required this.matchDate,
    required this.matchName,
    required this.tournamentName,
    required this.team1,
    required this.team2,
    required this.coteT1,
    required this.coteT2,
    this.winner,
  });

  Match.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matchName = json['match_name'];
    tournamentName = json['tournament_name'];
    team1 = Team.fromJson(json['team_1']);
    team2 = Team.fromJson(json['team_2']);
    winner = json['winner'];
    coteT1 = json['odd_team_1'] is String ? 0 : json['odd_team_1']*1.0;
    coteT2 = json['odd_team_2'] is String ? 0 : json['odd_team_2']*1.0;
  }
}
