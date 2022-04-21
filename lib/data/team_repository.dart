import 'dart:convert';

import 'package:bet_it/model/team.dart';
import 'package:http/http.dart' as http;

class TeamRepository {
  static Future<Team?> getTeamById(int selectedTeamId) async {
    Team? team;

    final response = await http.get(Uri.parse("http://bet-it.net/bet_it/public/api/team/$selectedTeamId}"));

    if(response.statusCode == 200){
      team = Team.fromJson((jsonDecode(response.body)["team"] as List).first);
    }

    return team;
  }
}
