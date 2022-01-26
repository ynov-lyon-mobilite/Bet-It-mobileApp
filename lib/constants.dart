import 'package:bet_it/model/league.dart';
import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/team.dart';
import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xFF121212);
const double padding5 = 5;
const double padding10 = 10;
const double padding20 = 20;
const double padding50 = 50;
const double fontSize15 = 15;
const double fontSize18 = 18;

final kCorp = Team(name: 'Karmine Corp', imageUrl: 'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/2/2d/Karmine_Corplogo_square.png/revision/latest/scale-to-width-down/1078?cb=20210312231319', teamBannerColor: Colors.blueAccent);
final fnatic = Team(name: 'Fnatic', imageUrl: 'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/f/fc/Fnaticlogo_square.png/revision/latest/scale-to-width-down/5000?cb=20210319200026', teamBannerColor: Colors.orange);
final rogue = Team(name: 'Rogue', imageUrl: 'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a4/Rogue_%28European_Team%29logo_square.png/revision/latest/scale-to-width-down/5000?cb=20210810012650', teamBannerColor: const Color(0xFF01579B));
final sktt1 = Team(name: 'SKT T1', imageUrl: 'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a2/T1logo_square.png/revision/latest/scale-to-width-down/5000?cb=20210808140847%20T1.png', teamBannerColor: Colors.red);
final tsm = Team(name: 'TSM', imageUrl: 'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/0/09/TSMlogo_square.png/revision/latest/scale-to-width-down/840?cb=20200118050248%20TSM.png', teamBannerColor: Colors.white10);

final m1 = Match(team1: kCorp, team2: fnatic, coteT1: 2.4, coteT2: 1.8);
final m2 = Match(team1: rogue, team2: kCorp, coteT1: 2.1, coteT2: 1.8);
final m3 = Match(team1: rogue, team2: fnatic, coteT1: 2.7, coteT2: 2.2);
final m4 = Match(team1: sktt1, team2: kCorp, coteT1: 2.1, coteT2: 1.7);
final m5 = Match(team1: rogue, team2: tsm, coteT1: 1.8, coteT2: 2.1);

final lec = League(name: "LEC - Ligue Européenne Championship", matchList: [m1, m2]);
final lfl = League(name: "LFL - Ligue Française de League Of Legends", matchList: [m3]);
final ma = League(name: "Match Amical de League Of Legends", matchList: [m4]);
final lpl = League(name: "LPL - Ligue Chinoise de League Of Legends", matchList: [m5]);

List<League> leagueList = [lec, lfl, ma, lpl];