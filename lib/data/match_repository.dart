import 'dart:convert';

import 'package:bet_it/model/match.dart';
import 'package:bet_it/utils/debug_logger.dart';
import 'package:http/http.dart' as http;

class MatchRepository {
  Future<List<Match>?> getAllMatch() async {
    List<Match> matchList = [];

    final response = await http.get(Uri.parse("http://bet-it.net/bet_it/public/api/upcoming/matches"));

    if(response.statusCode == 200){
      final resultList = (jsonDecode(response.body)["upcoming_matches"] as List);
      DebugLogger.debugLog("match_repository.dart", "getAllMatch()", "${resultList.length} items", 2);

      for (final element in resultList) {
        DebugLogger.debugLog("match_repository.dart", "getAllMatch()", "$element added", 2);

        matchList.add(Match.fromJson(element));
      }
      return matchList;
    } else {
      return null;
    }
  }
}