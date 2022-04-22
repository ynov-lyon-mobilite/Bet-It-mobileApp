import 'dart:convert';

import 'package:bet_it/model/upcoming_tournaments.dart';
import 'package:bet_it/utils/debug_logger.dart';
import 'package:http/http.dart' as http;

class TournamentRepository {
  static Future<List<Tournament>?> getUpcomingTournament() async {
    List<Tournament> tournamentList = [];

    final response = await http.get(Uri.parse("http://bet-it.net/bet_it/public/api/upcoming/tournaments"));

    if(response.statusCode == 200){
      final resultList = jsonDecode(response.body)["upcoming_tournaments"] as List;

      for (final element in resultList) {
        if((element["matches"] as List).isNotEmpty){
          final match = Tournament.fromJson(element);
          tournamentList.add(match);
        }
      }

      return tournamentList;
    } else {
      DebugLogger.debugLog("match_repository.dart", "getAllMatch()", "FAIL: Status code: ${response.statusCode}", 2);
      return null;
    }
  }
}