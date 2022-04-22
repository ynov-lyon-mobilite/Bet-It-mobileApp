import 'package:bet_it/model/match.dart';

class League {
  String name;
  List<Match> matchList = [];

  League({required this.name, required this.matchList});
  League.withoutMatch({required this.name});

  factory League.fromJson(Map<String, Object> json) {
    return League.withoutMatch(name: json["tournament_name"] as String);
  }
}
