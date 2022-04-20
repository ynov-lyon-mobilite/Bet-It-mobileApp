import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Team {
  late String teamId;
  String name;
  String? imageUrl;

  Team({required this.name, this.imageUrl});
}
