import 'package:bet_it/widgets/confirmation_btn.dart';
import 'package:bet_it/widgets/country_city_date_birth_form.dart';
import 'package:bet_it/widgets/name_surname_form.dart';
import 'package:bet_it/widgets/nickname_mail_form.dart';
import 'package:bet_it/widgets/password_form.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

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
  var nameController = TextEditingController();
  var surnameController = TextEditingController();

  var nicknameController = TextEditingController();
  var mailController = TextEditingController();

  var passwordConfirmationController = TextEditingController();
  var passwordController = TextEditingController();

  var ddnController = TextEditingController();
  var countryController = TextEditingController();
  var cityController = TextEditingController();

  final _formKeyNameSurname = GlobalKey<FormState>();
  final _formKeyNicknameMail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final _formKeyDDNCountryCity = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.black.withOpacity(1),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/eSport.jpg"),
              opacity: 0.6,
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 80.0),
              child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Text(
                                "Inscription.",
                                style: GoogleFonts.roboto(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            controller: controller,
                            children: [
                              Form(
                                key: _formKeyNameSurname,
                                child: Flex(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  direction: Axis.vertical,
                                  children: [
                                    Center(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            buildGenderRow(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 40,
                                                bottom: 40,
                                              ),
                                              child: NameSurnameForm(nameController: nameController, surnameController: surnameController),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      if (_formKeyNameSurname.currentState!.validate()) {
                                                        controller.nextPage(
                                                          duration: const Duration(
                                                            milliseconds: 800,
                                                          ),
                                                          curve: Curves.easeInOut,
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets.only(
                                                        left: 40,
                                                        right: 40,
                                                      ),
                                                      child: const Text("Suivant"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //Pseudo, Mail, Mdp
                              Form(
                                key: _formKeyNicknameMail,
                                child: Center(
                                  child: Flex(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    direction: Axis.vertical,
                                    children: [
                                      Center(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 0,
                                                  bottom: 40,
                                                ),
                                                child: NicknameMailForm(nicknameController: nicknameController, mailController: mailController),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      if (_formKeyNicknameMail.currentState!.validate()) {
                                                        controller.nextPage(
                                                          duration: const Duration(
                                                            milliseconds: 800,
                                                          ),
                                                          curve: Curves.easeInOut,
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets.only(
                                                        left: 40,
                                                        right: 40,
                                                      ),
                                                      child: const Text("Suivant"),
                                                    ),
                                                  ),
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
                              Form(
                                key: _formKeyPassword,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 40.0),
                                      child: PasswordForm(
                                        passwordConfirmationController: passwordConfirmationController,
                                        passwordController: passwordController,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            controller.nextPage(
                                              duration: const Duration(
                                                milliseconds: 800,
                                              ),
                                              curve: Curves.easeInOut,
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 40,
                                              right: 40,
                                            ),
                                            child: const Text("Suivant"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Form(
                                key: _formKeyDDNCountryCity,
                                child: Center(
                                  child: Flex(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    direction: Axis.vertical,
                                    children: [
                                      Center(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 0,
                                                  bottom: 40,
                                                ),
                                                child: CountryCityDateBirthForm(
                                                  ddnController: ddnController,
                                                  countryController: countryController,
                                                  cityController: cityController,
                                                ),
                                              ),
                                              ConfirmationButton(
                                                formKeyDDNCountryCity: _formKeyDDNCountryCity,
                                                mailController: mailController,
                                                passwordController: passwordController,
                                                nameController: nameController,
                                                surnameController: surnameController,
                                                nicknameController: nicknameController,
                                                countryController: countryController,
                                                cityController: cityController,
                                                ddnController: ddnController,
                                                selectedGender: selectedGender,
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
                          )),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              "Déjà un compte ?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
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
                    ],
                  )),
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

  Row buildGenderRow() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
          child: ElevatedButton(
            style: ButtonStyle(backgroundColor: isWomanSelected ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.blue)),
            onPressed: () {
              if (mounted) {
                setState(() {
                  isWomanSelected = !isWomanSelected;
                });
                selectedGender = "Male";
              }
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                "Homme",
                style: TextStyle(
                  color: isWomanSelected ? Colors.blue : Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
          child: ElevatedButton(
            style: ButtonStyle(backgroundColor: isWomanSelected ? MaterialStateProperty.all(Colors.blue) : MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              if (mounted) {
                setState(() {
                  isWomanSelected = !isWomanSelected;
                });
                selectedGender = "Femme";
              }
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                "Femme",
                style: TextStyle(
                  color: isWomanSelected ? Colors.white : Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
