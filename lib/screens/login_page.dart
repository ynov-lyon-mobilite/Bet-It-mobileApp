import 'package:bet_it/managers/auth_manager.dart';
import 'package:bet_it/model/instance_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;

  final mailController = TextEditingController();
  final passwordController = TextEditingController();

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
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Text(
                          "Connexion.",
                          style: GoogleFonts.roboto(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Form(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    const Align(
                                      child: Text(
                                        "ADRESSE MAIL",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          letterSpacing: 2,
                                          fontSize: 8,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    TextFormField(
                                      controller: mailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                                        hintText: "Adresse mail",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  children: [
                                    const Align(
                                      child: Text(
                                        "MOT DE PASSE",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          letterSpacing: 2,
                                          fontSize: 8,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    TextFormField(
                                      controller: passwordController,
                                      keyboardType: TextInputType.visiblePassword,
                                      obscureText: !isPasswordVisible,
                                      decoration: InputDecoration(
                                        hintText: "Mot de passe",
                                        hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                                        suffixIcon: IconButton(
                                          onPressed: () => setState(() {
                                            isPasswordVisible = !isPasswordVisible;
                                          }),
                                          icon: isPasswordVisible
                                              ? const Icon(
                                                  Icons.visibility_off,
                                                  size: 20,
                                                  color: Colors.blue,
                                                )
                                              : const Icon(
                                                  Icons.visibility,
                                                  size: 20,
                                                  color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if(value!.isEmpty || value == "") {
                                          return "Merci d'écrire votre mot de passe";
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Mot de passe oublié ?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            AuthManager.loginUserFirebase(mailController.text, passwordController.text).then((value) {
                              if(value.user != null) {
                                Navigator.of(context).pushNamed("/home");
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 40,
                              right: 40,
                            ),
                            child: const Text("Se connecter"),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pushNamed("/register"),
                          child: const Text(
                            "Créer un compte",
                            style: TextStyle(color: Colors.grey, fontSize: 11,),
                          ),
                        )
                      ],
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
}
