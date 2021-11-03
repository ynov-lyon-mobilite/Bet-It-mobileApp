import 'package:bet_it/utils/debug_logger.dart';
import 'package:country_picker/country_picker.dart';
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
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          controller: controller,
                          children: [
                            Form(
                              key: _formKeyNameSurname,
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
                                            buildGenderRow(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 70.0,
                                                right: 70.0,
                                                top: 40,
                                                bottom: 40,
                                              ),
                                              child: buildColumnNameSurname(),
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
                                                      if(_formKeyNameSurname.currentState!.validate()){
                                                        controller.nextPage(
                                                          duration:
                                                          const Duration(
                                                            milliseconds: 800,
                                                          ),
                                                          curve: Curves.easeInOut,
                                                        );
                                                      }
                                                    },
                                                    child: const Text(
                                                      "Suivant",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
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
                              key: _formKeyNicknameMail,
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
                                                bottom: 40,
                                              ),
                                              child: buildColumnNicknameMail(),
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
                                                      if(_formKeyNicknameMail.currentState!.validate()){
                                                        controller.nextPage(
                                                          duration:
                                                          const Duration(
                                                            milliseconds: 800,
                                                          ),
                                                          curve: Curves.easeInOut,
                                                        );
                                                      }
                                                    },
                                                    child: const Text(
                                                      "Suivant",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
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
                            Form(
                              key: _formKeyPassword,
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
                                                bottom: 40,
                                              ),
                                              child: buildColumnPassword(),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 200,
                                                  color: Colors.blue,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      controller.nextPage(
                                                        duration:
                                                            const Duration(
                                                          milliseconds: 800,
                                                        ),
                                                        curve: Curves.easeInOut,
                                                      );
                                                    },
                                                    child: const Text(
                                                      "Suivant",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
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
                            Form(
                              key: _formKeyDDNCountryCity,
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
                                              child: CountryCityDateBirthForm(
                                                ddnController: ddnController,
                                                countryController: countryController,
                                                cityController: cityController,
                                              ),
                                            ),
                                            buildConfirmationBtn(),
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

  Row buildConfirmationBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          color: Colors.blue,
          child: TextButton(
            onPressed: () {
              if(_formKeyDDNCountryCity.currentState!.validate()){


                DebugLogger.debugLog("registe_page", "buildConfirmationBtn", nameController.text, 2);
                DebugLogger.debugLog("registe_page", "buildConfirmationBtn", surnameController.text, 2);
                DebugLogger.debugLog("registe_page", "buildConfirmationBtn", nicknameController.text, 2);
                DebugLogger.debugLog("registe_page", "buildConfirmationBtn", countryController.text, 2);
                DebugLogger.debugLog("registe_page", "buildConfirmationBtn", cityController.text, 2);
                DebugLogger.debugLog("registe_page", "buildConfirmationBtn", ddnController.text, 2);
                DebugLogger.debugLog("registe_page", "buildConfirmationBtn", mailController.text, 2);
                DebugLogger.debugLog("registe_page", "buildConfirmationBtn", selectedGender, 2);
              }
            },
            child: const Text(
              "Confirmer",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Column buildColumnPassword() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              hintText: "Mot de passe",
              prefixIcon: Icon(
                Icons.lock,
                size: 20,
              ),
            ),
            controller: passwordController,
          ),
        ),
        TextFormField(
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(
            hintText: "Confirmation",
            prefixIcon: Icon(
              Icons.lock,
              size: 20,
            ),
          ),
          controller: passwordConfirmationController,
        ),
      ],
    );
  }

  Column buildColumnNicknameMail() {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if(value == null || value.isEmpty){
              return "Veuillez remplir votre pseudo";
            }
            return null;
          },
          decoration: const InputDecoration(
            hintText: "Pseudo",
            prefixIcon: Icon(Icons.person),
          ),
          controller: nicknameController,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if(value == null || value.isEmpty){
                return "Veuillez remplir votre adresse mail";
              }
              return null;
            },
            controller: mailController,
            decoration: const InputDecoration(
              hintText: "Adresse mail",
              prefixIcon: Icon(Icons.mail_outline_outlined),
            ),
          ),
        ),
      ],
    );
  }

  Column buildColumnNameSurname() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: TextFormField(
            keyboardType: TextInputType.name,
            validator: (value) {
              if(value == null || value.isEmpty){
                return "Veuillez remplir votre nom";
              }
              return null;
            },
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Nom",
              prefixIcon: Icon(Icons.account_circle_outlined),
            ),
          ),
        ),
        TextFormField(
          validator: (value) {
            if(value == null || value.isEmpty){
              return "Veuillez remplir votre prénom";
            }
            return null;
          },
          controller: surnameController,
          decoration: const InputDecoration(
            hintText: "Prenom",
            prefixIcon: Icon(Icons.account_circle_outlined),
          ),
        ),
      ],
    );
  }

  Row buildGenderRow() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
          child: TextButton(
            onPressed: () {
              if (mounted) {
                setState(() {
                  isWomanSelected = !isWomanSelected;
                });
                selectedGender = "Male";
              }
            },
            child: Text(
              "Homme",
              style: TextStyle(
                color: isWomanSelected ? Colors.blue : Colors.white,
              ),
            ),
          ),
          color: isWomanSelected ? Colors.white : Colors.blue,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
          color: isWomanSelected ? Colors.blue : Colors.white,
          child: TextButton(
            onPressed: () {
              if (mounted) {
                setState(() {
                  isWomanSelected = !isWomanSelected;
                });
                selectedGender = "Woman";
              }
            },
            child: Text(
              "Femme",
              style: TextStyle(
                color: isWomanSelected ? Colors.white : Colors.blue,
              ),
            ),
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

class CountryCityDateBirthForm extends StatefulWidget {
  final TextEditingController ddnController;
  final TextEditingController countryController;
  final TextEditingController cityController;

  const CountryCityDateBirthForm({
    Key? key,
    required this.ddnController,
    required this.countryController,
    required this.cityController,
  }) : super(key: key);

  @override
  _CountryCityDateBirthFormState createState() => _CountryCityDateBirthFormState();
}

class _CountryCityDateBirthFormState extends State<CountryCityDateBirthForm> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: GestureDetector(
            onTap: () async {
              var selectedDate = await showDatePicker(
                locale: const Locale("fr","FR"),
                context: context,
                initialDate: DateTime.now(),
                lastDate: DateTime.now(),
                firstDate: DateTime(1900),
              );
              setState(() {
                widget.ddnController.text = "${selectedDate?.day}-${selectedDate?.month}-${selectedDate?.year}";
              });
            },
            child: TextFormField(
              enabled: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Indiquez votre date de naissance";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Date de naissance",
                prefixIcon: Icon(
                  Icons.calendar_today,
                  size: 20,
                ),
              ),
              controller: widget.ddnController,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                onSelect: (Country country) {
                  widget.countryController.text = country.name;
                },
              );
            },
            child: TextFormField(
              enabled: false,
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "Veuillez remplir votre pays de naissance";
                }
                return null;
              },
              controller: widget.countryController,
              decoration: const InputDecoration(
                hintText: "Pays de naissance",
                prefixIcon: Icon(Icons.map),
              ),
            ),
          ),
        ),
        TextFormField(
          validator: (value) {
            if(value == null || value.isEmpty){
              return "Veuillez remplir votre ville de naissance";
            }
            return null;
          },
          controller: widget.cityController,
          decoration: const InputDecoration(
            hintText: "Ville de naissance",
            prefixIcon: Icon(Icons.location_city_sharp),
          ),
        ),
      ],
    );
  }
}

