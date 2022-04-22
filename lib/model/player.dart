class Player {
  int? id;
  String? playerName;
  String? image;
  String? realName;
  bool? isSubstitute;
  int? age;
  String? country;
  bool? isRetired;
  String? role;

  Player({
    this.id,
    this.playerName,
    this.image,
    this.realName,
    this.isSubstitute,
    this.age,
    this.country,
    this.isRetired,
    this.role,
  });

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerName = json['player_name'];
    image = json['image'];
    realName = json['real_name'];
    isSubstitute = json['is_substitute'];
    age = json['age'];
    country = json['country'];
    isRetired = json['is_retired'];
    role = json['role'];
  }
}
