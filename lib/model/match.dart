import 'dart:convert';

import 'package:bet_it/model/team.dart';

class Match {
  int? id;
  MatchDate? matchDate;
  String? matchName;
  String? tournamentName;
  int? bestOf;
  dynamic phase;
  Team? team1;
  Team? team2;
  String? winner;
  double coteT1;
  double coteT2;

  Match({
    this.id,
    this.matchDate,
    this.matchName,
    this.tournamentName,
    this.bestOf,
    this.phase,
    this.team1,
    this.team2,
    this.winner,
    this.coteT1 = 0,
    this.coteT2 = 0,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    id: json["id"],
    matchName: json["match_name"],
    tournamentName: json["tournament_name"],
    bestOf: json["best_of"],
    team1: Team(name: json["team_1"]),
    team2: Team(name: json["team_2"]),
    winner: json["winner"],
  );
}

class MatchDate {
  DateTime? date;
  int? timezoneType;
  String? timezone;

  MatchDate({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  factory MatchDate.fromJson(Map<String, dynamic> json) => MatchDate(
    date: DateTime.parse(json["date"]),
    timezoneType: json["timezone_type"],
    timezone: json["timezone"],
  );
}
