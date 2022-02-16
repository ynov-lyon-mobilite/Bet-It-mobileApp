import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Team {
  late String teamId;
  String name;
  String imageUrl;
  Color teamBannerColor;

  Team({
    required this.name,
    required this.imageUrl,
    required this.teamBannerColor,
  }){
    teamId = const Uuid().v4();
  }
}
