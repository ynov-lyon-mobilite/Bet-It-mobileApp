import 'package:bet_it/model/match.dart';
import 'package:collection/collection.dart';

class TournamentsFilterTool {
  static Map<String, List<Match>> filterMatchByTournamentsFromList(List<Match> matchList){
    return groupBy(matchList, (Match map) => map.tournamentName);
  }
}
