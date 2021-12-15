import 'package:flutter/material.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    Key? key,
    required this.passwordConfirmationController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordConfirmationController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Column(
            children: [
              const Align(
                child: Text(
                  "MOT DE PASSE",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2,
                    fontSize: 11,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Merci de rentrer un mot de passe";
                  }
                  if(value != passwordConfirmationController.text){
                    return "Les mots de passe ne correspondent pas";
                  }
                  return null;
                },
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  hintText: "Mot de passe",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                controller: passwordController,
              ),
            ],
          ),
        ),
        Column(
          children: [
            const Align(
              child: Text(
                "CONFIRMATION DE MOT DE PASSE",
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2,
                  fontSize: 11,
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
            TextFormField(
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "Merci de rentrer un mot de passe";
                }
                if(value != passwordController.text){
                  return "Les mots de passe ne correspondent pas";
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                hintText: "Confirmation",
                hintStyle: TextStyle(color: Colors.grey)
              ),
              controller: passwordConfirmationController,
            ),
          ],
        ),
      ],
    );
  }
}