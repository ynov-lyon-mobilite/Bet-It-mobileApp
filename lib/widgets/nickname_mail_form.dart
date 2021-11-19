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
              if(value == null || value.isEmpty || !EmailValidator.validate(value)){
                return "Veuillez vérifier votre adresse mail";
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
}