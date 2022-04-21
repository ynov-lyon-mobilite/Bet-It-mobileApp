import 'package:bet_it/model/player.dart';

class Team {
  int? id;
  String? teamName;
  String? code;
  String? logo;
  bool? isDisbanded;
  String? region;
  List<Player>? players;

  Team({
    this.id,
    this.teamName,
    this.code,
    this.logo,
    this.isDisbanded,
    this.region,
    this.players,
  });

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamName = json['team_name'];
    code = json['code'];
    logo = json['logo'];
    isDisbanded = json['is_disbanded'];
    region = json['region'];

    if (json['players'] != null) {
      players = <Player>[];
      json['players'].forEach((v) {
        players!.add(Player.fromJson(v));
      });
    }
  }
}
