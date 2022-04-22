import 'dart:convert';

import 'package:bet_it/model/match.dart';
import 'package:bet_it/utils/debug_logger.dart';
import 'package:http/http.dart' as http;

class MatchRepository {
  static Future<Match?> getMatchById(int id) async {
    Match? match;
    
    final response = await http.get(Uri.parse("http://bet-it.net/bet_it/public/api/match/$id}"));

    if(response.statusCode == 200){
      match = Match.fromJson((jsonDecode(response.body)["match"] as List).first);
    }
    return match;
  }

  static Future<List<Match>?> getAllMatch() async {
    List<Match> matchList = [];

    final response = await http.get(Uri.parse("http://bet-it.net/bet_it/public/api/upcoming/matches"));

    if(response.statusCode == 200){
      DebugLogger.debugLog("match_repository.dart", "getAllMatch()", "Status code: ${response.statusCode}", 2);

      final resultList = jsonDecode(response.body)["upcoming_matches"] as List;

      for (final element in resultList) {
        matchList.add(Match.fromJson(element));
      }
      return matchList;

    } else {
      DebugLogger.debugLog("match_repository.dart", "getAllMatch()", "FAIL: Status code: ${response.statusCode}", 2);
      return null;
    }
  }
}