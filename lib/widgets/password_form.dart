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
          child: TextFormField(
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
              prefixIcon: Icon(
                Icons.lock,
                size: 20,
              ),
            ),
            controller: passwordController,
          ),
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
}