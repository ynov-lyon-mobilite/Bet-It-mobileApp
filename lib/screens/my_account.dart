import 'package:bet_it/constants.dart';
import 'package:bet_it/global.dart';
import 'package:bet_it/model/instance_manager.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282828),
      appBar: AppBar(
        title: const Text("Mon compte"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xFF262626),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Informations publiques",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Pseudo: "+currentUser.nickname,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: fontSize15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: const Color(0xFF262626),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Mon identité",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Prénom: "+currentUser.surname,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: fontSize15,
                        ),
                      ),
                      Text(
                        "Date de naissance: "+currentUser.ddn,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: fontSize15,
                        ),
                      ),
                      Text(
                        "Pays de naissance: "+currentUser.countryOfBirth,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: fontSize15,
                        ),
                      ),
                      Text(
                        "Nom: "+currentUser.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: fontSize15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: const Color(0xFF262626),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Mes informations de contact",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Adresse mail: "+currentUser.mailAddress,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: fontSize15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
