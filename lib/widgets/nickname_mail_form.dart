import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class NicknameMailForm extends StatelessWidget {
  const NicknameMailForm({
    Key? key,
    required this.nicknameController,
    required this.mailController,
  }) : super(key: key);

  final TextEditingController nicknameController;
  final TextEditingController mailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const Align(
              child: Text(
                "PSEUDO",
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
                  return "Veuillez remplir votre pseudo";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Pseudo",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              controller: nicknameController,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            children: [
              const Align(
                child: Text(
                  "ADRESSE MAIL",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2,
                    fontSize: 11,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value == null || value.isEmpty || !EmailValidator.validate(value)){
                    return "Veuillez vérifier votre adresse mail";
                  }
                  return null;
                },
                controller: mailController,
                decoration: const InputDecoration(
                  hintText: "Adresse mail",
                  hintStyle: TextStyle(color: Colors.grey)
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}