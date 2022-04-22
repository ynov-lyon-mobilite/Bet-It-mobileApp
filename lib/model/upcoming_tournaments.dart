import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/tournament_start_date.dart';

class Tournament {
  late int id;
  TournamentStartDate? tournamentStartDate;
  TournamentStartDate? tournamentEndDate;
  String? tournamentName;
  String? country;
  String? region;
  bool? isPlayOff;
  String? eventType;
  bool? isMajor;
  List<Match>? matches;

  Tournament({
    required this.id,
    this.tournamentStartDate,
    this.tournamentEndDate,
    this.tournamentName,
    this.country,
    this.region,
    this.isPlayOff,
    this.eventType,
    this.isMajor,
    this.matches,
  });

  Tournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tournamentStartDate = json['tournament_start_date'] != null ? TournamentStartDate.fromJson(json['tournament_start_date']) : null;
    tournamentEndDate =
        json['tournament_end_date'] != null ? TournamentStartDate.fromJson(json['tournament_end_date']) : null;
    tournamentName = json['tournament_name'];
    country = json['country'];
    region = json['region'];
    isPlayOff = json['is_play_off'];
    eventType = json['event_type'];
    isMajor = json['is_major'];

    if (json['matches'] != null) {
      matches = <Match>[];
      json['matches'].forEach((v) {
        matches!.add(Match.fromJson(v));
      });
    }
  }
}

