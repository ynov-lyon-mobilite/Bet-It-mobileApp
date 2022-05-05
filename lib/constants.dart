import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/team.dart';
import 'package:bet_it/model/upcoming_tournaments.dart';
import 'package:flutter/material.dart';

const Color backgroundColor = Colors.white;
const Color foregroundColor = Colors.black;
const Color whiteForegroundColor = Colors.white;
const double buttonWidth = 100;
const double padding5 = 5;
const double padding10 = 10;
const double padding20 = 20;
const double padding50 = 50;
const double fontSize15 = 15;
const double fontSize20 = 20;
const double fontSize18 = 18;

final teamTest1 = Team(
  id: 1,
  code: "TT1",
  isDisbanded: false,
  logo: null,
  region: "Europe",
  teamName: "Team Test 1"
);

final teamTest2 = Team(
  id: 2,
  code: "TT2",
  isDisbanded: false,
  logo: null,
  region: "Europe",
  teamName: "Team Test 2"
);

List<Match>? testMatchList = [
  Match(
    id: 51,
    team1: teamTest1,
    team2: teamTest2,
    matchDate: null,
    matchName: "TeamTest1 vs TeamTest2",
    tournamentName: "LEC",
    winner: null,
    coteT1: 2.2,
    coteT2: 1.3,
  ),
];

final testTournament = Tournament(
  id: 1,
  tournamentStartDate: null,
  tournamentEndDate: null,
  tournamentName: "Championnat d'Europe de League of Legends",
  country: "France",
  region: "Europe",
  isPlayOff: false,
  eventType: null,
  isMajor: true,
  matches: testMatchList,
);
