import 'package:bet_it/managers/auth_manager.dart';
import 'package:bet_it/managers/dialog_manager.dart';
import 'package:bet_it/model/instance_manager.dart';
import 'package:bet_it/utils/debug_logger.dart';
import 'package:flutter/material.dart';

class ConfirmationButton extends StatelessWidget {
  const ConfirmationButton({
    Key? key,
    required GlobalKey<FormState> formKeyDDNCountryCity,
    required this.mailController,
    required this.passwordController,
    required this.nameController,
    required this.surnameController,
    required this.nicknameController,
    required this.countryController,
    required this.cityController,
    required this.ddnController,
    required this.selectedGender,
  })  : _formKeyDDNCountryCity = formKeyDDNCountryCity,
        super(key: key);

  final GlobalKey<FormState> _formKeyDDNCountryCity;
  final TextEditingController mailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController nicknameController;
  final TextEditingController countryController;
  final TextEditingController cityController;
  final TextEditingController ddnController;
  final String selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            if (_formKeyDDNCountryCity.currentState!.validate()) {
              var registrationResult = await AuthManager.createUserFirebase(mailController.text, passwordController.text);

              if (registrationResult != null) {
                DebugLogger.debugLog("register_page", "buildConfirmationBtn", "Email send", 4);

                registrationResult.user!.sendEmailVerification();
                AuthManager.fillInformationsInDatabase(
                  registrationResult.user!.uid,
                  nameController.text,
                  surnameController.text,
                  nicknameController.text,
                  mailController.text,
                  countryController.text,
                  cityController.text,
                  ddnController.text,
                  selectedGender,
                );

                Navigator.of(context).pushNamed('/home');
                DialogManager.showCustomDialog(context, "Confirmer votre mail", "Un mail a été envoyé à l'adresse que vous avez inscrit, cliquez sur le lien reçu pour valider votre compte.");
              } else {
                DebugLogger.debugLog("confirmation_btn", "build", "Compte non-créé", 1);
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: const Text("Confirmer"),
          ),
        ),
      ],
    );
  }
}
