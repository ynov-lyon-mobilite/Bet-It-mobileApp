import 'package:bet_it/constants.dart';
import 'package:bet_it/model/instance_manager.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Profil"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Icon(Icons.person, color: Colors.white,),
                  Text("Mon compte", style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: const [
                  Icon(Icons.settings, color: Colors.white,),
                  Text("Mes options", style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: const Text("Deconnexion", style: TextStyle(color: Colors.white),)
            ),
          )
        ],
      ),
    );
  }
}
