class TournamentStartDate {
  String? date;
  int? timezoneType;
  String? timezone;

  TournamentStartDate({this.date, this.timezoneType, this.timezone});

  TournamentStartDate.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }
}