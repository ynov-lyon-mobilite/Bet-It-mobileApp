import 'package:flutter/material.dart';

class FinishedPage extends StatelessWidget {
  final titles = ["LDLC OL - KC", "FNC - MAD", "T1 - RNG"];
  final subtitles = [
    "Bon prono : KC vainqueur",
    "Bon prono : MAD vainqueur",
    "Bon prono : T1 vainqueur"
  ];
  final color = [
    Colors.red,
    Colors.green,
    Colors.green
  ];
  final icons = [Icons.close, Icons.check, Icons.check];
  final url = [
  "https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/7/73/LDLC_OLlogo_square.png"  ,
  "https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/e/e5/MAD_Lionslogo_profile.png",
    "https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/a/a2/T1logo_square.png"

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            color: color[index],
              child: ListTile(
                  title: Text(titles[index]),
                  subtitle: Text(subtitles[index]),
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(url[index])),
                  trailing: Icon(icons[index])));
        });
  }
}
