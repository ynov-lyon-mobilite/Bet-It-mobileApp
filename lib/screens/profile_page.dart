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
      backgroundColor: const Color(0xFF282828),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Profil"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/myaccount");
                },
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.person, color: Colors.white,),
                      ),
                      Text("Mon compte", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.settings, color: Colors.white,),
                      ),
                      Text("Mes options", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.assessment_outlined, color: Colors.white,),
                      ),
                      Text("Mes tickets", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.sticky_note_2_outlined, color: Colors.white,),
                      ),
                      Text("Mes codes", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),

            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.red,
              child: InkWell(
                onTap: () {
                  InstanceManager.getAuthInstance().signOut();
                  Navigator.pushReplacementNamed(context, "/login");
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Deconnexion", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
