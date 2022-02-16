import 'package:bet_it/constants.dart';
import 'package:bet_it/global.dart';
import 'package:bet_it/model/instance_manager.dart';
import 'package:bet_it/model/user.dart';
import 'package:bet_it/screens/ticket_page.dart';
import 'package:bet_it/widgets/match_row.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: padding20),
              child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: padding10),
                    child: Row(
                      children: const [
                        Text(
                          "1000",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize15,
                          ),
                        ),
                        Image(
                          image: AssetImage("assets/betty.png"),
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                  )),
            ),
          ),
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
      body: ListView.builder(
        itemCount: leagueList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: padding10),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    leagueList.elementAt(index).name,
                    style: const TextStyle(
                      color: foregroundColor,
                      fontSize: fontSize15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: leagueList.elementAt(index).matchList.length,
                    itemBuilder: (context, matchIndex) {
                      final matchList = leagueList.elementAt(index).matchList;

                      return MatchRow(
                        match: matchList.elementAt(matchIndex),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        //Floating action button on Scaffold
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyTicketPage()),
          );
        },
        child: const Icon(Icons.receipt_long_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.local_fire_department,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.print,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.people,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    var usersCollection = InstanceManager.getDatabaseInstance().collection("users");

    usersCollection
        .doc(InstanceManager.getAuthInstance().currentUser!.uid)
        .get()
        .then((userFromDb) {
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
