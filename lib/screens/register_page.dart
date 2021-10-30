import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;
  bool isWomanSelected = true;
  String selectedGender = "Woman";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(1),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/eSport.jpg"),
            opacity: 0.6,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 80.0),
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Text(
                            "Bet-It",
                            style: GoogleFonts.roboto(
                              fontSize: 50,
                              color: Colors.blue,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          controller: controller,
                          children: [
                            //Nom, Prenom, Sexe
                            Form(
                              child: Center(
                                child: Flex(
                                  direction: Axis.vertical,
                                  children: [
                                    Center(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 1, 10, 1),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      if (mounted) {
                                                        setState(() {
                                                          isWomanSelected =
                                                              !isWomanSelected;
                                                        });
                                                        selectedGender = "Male";
                                                      }
                                                    },
                                                    child: Text(
                                                      "Homme",
                                                      style: TextStyle(
                                                          color: isWomanSelected
                                                              ? Colors.blue
                                                              : Colors.white),
                                                    ),
                                                  ),
                                                  color: isWomanSelected
                                                      ? Colors.white
                                                      : Colors.blue,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 1, 10, 1),
                                                  color: isWomanSelected
                                                      ? Colors.blue
                                                      : Colors.white,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      if (mounted) {
                                                        setState(() {
                                                          isWomanSelected =
                                                              !isWomanSelected;
                                                        });
                                                        selectedGender =
                                                            "Woman";
                                                      }
                                                    },
                                                    child: Text(
                                                      "Femme",
                                                      style: TextStyle(
                                                          color: isWomanSelected
                                                              ? Colors.white
                                                              : Colors.blue),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 70.0,
                                                  right: 70.0,
                                                  top: 40,
                                                  bottom: 40),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 15.0),
                                                    child: TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: "Nom",
                                                        prefixIcon: Icon(Icons
                                                            .account_circle_outlined),
                                                      ),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText: "Prenom",
                                                      prefixIcon: Icon(Icons
                                                          .account_circle_outlined),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 200,
                                                  color: Colors.blue,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      controller.nextPage(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      800),
                                                          curve:
                                                              Curves.easeInOut);
                                                    },
                                                    child: const Text(
                                                      "Suivant",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Pseudo, Mail, Mdp
                            Form(
                              child: Center(
                                child: Flex(
                                  direction: Axis.vertical,
                                  children: [
                                    Center(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 70.0,
                                                  right: 70.0,
                                                  top: 0,
                                                  bottom: 40),
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText: "Pseudo",
                                                            prefixIcon: Icon(
                                                                Icons.person)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 25.0),
                                                    child: TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText:
                                                            "Adresse mail",
                                                        prefixIcon: Icon(Icons
                                                            .mail_outline_outlined),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 200,
                                                  color: Colors.blue,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      controller.nextPage(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      800),
                                                          curve:
                                                              Curves.easeInOut);
                                                    },
                                                    child: const Text(
                                                      "Suivant",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Adresse
                            Form(
                              child: Center(
                                child: Flex(
                                  direction: Axis.vertical,
                                  children: [
                                    Center(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 70.0,
                                                  right: 70.0,
                                                  top: 0,
                                                  bottom: 40),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 25.0),
                                                    child: TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText:
                                                            "Mot de passe",
                                                        prefixIcon: Icon(
                                                          Icons.lock,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText: "Confirmation",
                                                      prefixIcon: Icon(
                                                        Icons.lock,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 200,
                                                  color: Colors.blue,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      controller.nextPage(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      800),
                                                          curve:
                                                              Curves.easeInOut);
                                                    },
                                                    child: const Text(
                                                      "Suivant",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Date de naissance, pays de naissance, ville de naissance
                            Form(
                              child: Center(
                                child: Flex(
                                  direction: Axis.vertical,
                                  children: [
                                    Center(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 70.0,
                                                  right: 70.0,
                                                  top: 0,
                                                  bottom: 40),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 15.0),
                                                    child: TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText:
                                                            "Date de naissance",
                                                        prefixIcon: Icon(
                                                          Icons.calendar_today,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 15.0),
                                                    child: TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText: "Pays de naissance",
                                                        prefixIcon: Icon(
                                                          Icons.map,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    decoration:
                                                    const InputDecoration(
                                                      hintText: "Ville de naissance",
                                                      prefixIcon: Icon(
                                                        Icons.apartment_rounded,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 200,
                                                  color: Colors.blue,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      controller.nextPage(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      800),
                                                          curve:
                                                              Curves.easeInOut);
                                                    },
                                                    child: const Text(
                                                      "Confirmer",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
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
                    StepProgressIndicator(
                      size: 10,
                      totalSteps: 3,
                      currentStep: currentIndex,
                      selectedColor: Colors.blue,
                      unselectedColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentIndex = controller.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
