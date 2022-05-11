import 'package:bet_it/constants.dart';
import 'package:bet_it/data/match_repository.dart';
import 'package:bet_it/data/tournaments_filter_tool.dart';
import 'package:bet_it/global.dart';
import 'package:bet_it/model/fantasyLeague.dart';
import 'package:bet_it/model/instance_manager.dart';
import 'package:bet_it/model/match.dart';
import 'package:bet_it/model/user.dart';
import 'package:bet_it/screens/ticket_page.dart';
import 'package:bet_it/widgets/match_row.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MatchRepository.getAllMatch(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Match> data = snapshot.data! as List<Match>;

          if(data.isEmpty) data = testMatchList!;

          final matchList = TournamentsFilterTool.filterMatchByTournamentsFromList(data);

          return Scaffold(
            backgroundColor: backgroundColor,
            extendBody: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.blueAccent,
              actions: <Widget>[
                buildBetiesAmountAndProfilPage(),
                Padding(
                  padding: const EdgeInsets.only(right: padding20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/profile");
                    },
                    child: const Icon(
                      Icons.account_circle,
                      size: 26.0,
                    ),
                  ),
                ),
              ],
            ),
            resizeToAvoidBottomInset: false,
            body: buildGlobalMatchesAndTournamentsList(matchList),
            floatingActionButton: Badge(
              toAnimate: true,
              shape: BadgeShape.circle,
              badgeColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              badgeContent: Text(cart.getBetList().length.toString(), style: const TextStyle(color: Colors.white)),
              child: FloatingActionButton(
                backgroundColor : Colors.deepPurpleAccent,
                //Floating action button on Scaffold
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyTicketPage()),
                  );
                },
                child: const Icon(Icons.receipt_long_rounded),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: buildBottomBar(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Center buildBetiesAmountAndProfilPage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: padding20),
        child: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: padding10),
            child: Row(
              children: [
                FutureBuilder(
                  future: cartManager.getUserBetiesById(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      final beties = snapshot.data;
                      return Text(
                        "$beties",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: fontSize15,
                        ),
                      );
                    } else {
                      return const Text(
                        "0",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize15,
                        ),
                      );
                    }
                  }
                ),
                const Image(
                  image: AssetImage("assets/betty.png"),
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomAppBar buildBottomBar() {
    return BottomAppBar(
      color: Colors.blueAccent,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.local_fire_department,
              color: Colors.purpleAccent,
            ),
            onPressed: () {},
          ),

          IconButton(
            icon: const Icon(
              Icons.people,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FantasyLeague()),
              );
            },
          ),
        ],
      ),
    );
  }


  ListView buildGlobalMatchesAndTournamentsList(Map<String, List<Match>> matchList) {
    return ListView.builder(
      itemCount: matchList.keys.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: padding10),
              ),
              buildTournamentName(matchList, index),
              buildTournamentMatchesList(matchList, index),
            ],
          ),
        );
      },
    );
  }

  Flexible buildTournamentMatchesList(Map<String, List<Match>> matchList, int index) {
    return Flexible(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        //itemCount: tournamentList.elementAt(index).matches!.length,
        itemCount: matchList.values.elementAt(index).length,
        itemBuilder: (context, matchIndex) {
          return MatchRow(match: matchList.values.elementAt(index).elementAt(matchIndex));
        },
      ),
    );
  }

  Padding buildTournamentName(Map<String, List<Match>> matchList, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        matchList.keys.elementAt(index),
        style: const TextStyle(
          color: foregroundColor,
          fontSize: fontSize15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    var usersCollection = InstanceManager.getDatabaseInstance().collection("users");

    usersCollection.doc(InstanceManager.getAuthInstance().currentUser!.uid).get().then((userFromDb) {
      currentUser = User(
        surname: userFromDb.get("surname"),
        name: userFromDb.get("name"),
        mailAddress: userFromDb.get("mailAddress"),
        nickname: userFromDb.get("nickname"),
        countryOfBirth: userFromDb.get("birthCountry"),
        ddn: userFromDb.get("dateOfBirth"),
      );
    });
  }
}
