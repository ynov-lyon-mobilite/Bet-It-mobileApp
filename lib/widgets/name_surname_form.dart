import 'package:flutter/material.dart';

class NameSurnameForm extends StatelessWidget {
  const NameSurnameForm({
    Key? key,
    required this.nameController,
    required this.surnameController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController surnameController;

  @override
  Widget build(BuildContext context) {
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
}