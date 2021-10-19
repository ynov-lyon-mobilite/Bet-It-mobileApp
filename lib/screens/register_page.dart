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
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 100.0),
          child: SafeArea(
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Text(
                      "Bet-It",
                      style: GoogleFonts.roboto(
                        fontSize: 50,
                        color: Colors.blue,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: controller,
                        children: [
                          Form(
                            child: Flex(
                              direction: Axis.vertical,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                                            child: TextButton(
                                              onPressed: () {
                                                if(mounted){
                                                  setState(() {
                                                    isWomanSelected = !isWomanSelected;
                                                  });
                                                  selectedGender = "Male";
                                                }
                                              },
                                              child: Text("Homme", style: TextStyle(color: isWomanSelected ? Colors.blue : Colors.white),),
                                            ),
                                            color: isWomanSelected ? Colors.white : Colors.blue,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                                            color: isWomanSelected ? Colors.blue : Colors.white,
                                            child: TextButton(
                                              onPressed: () {
                                                if(mounted){
                                                  setState(() {
                                                    isWomanSelected = !isWomanSelected;
                                                  });
                                                  selectedGender = "Woman";

                                                }
                                              },
                                              child: Text("Femme", style: TextStyle(color: isWomanSelected ? Colors.white : Colors.blue),),
                                            ),
                                          ),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 100.0, right: 100.0, top: 40, bottom: 40),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                hintText: "Nom",
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: const InputDecoration(hintText: "Prenom"),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 200,
                                            color: Colors.blue,
                                            child: TextButton(
                                              onPressed: () {
                                                controller.nextPage(duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
                                              },
                                              child: const Text(
                                                "Suivant",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Form(
                            child: Center(
                              child: Text("mail / mdp / pseudo"),
                            ),
                          ),
                          const Form(
                            child: Center(
                              child: Text("Adresse"),
                            ),
                          ),
                          const Form(
                            child: Center(
                              child: Text("Date de naissance, pays de naissance, ville de naissance"),
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
                  )
                ],
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
