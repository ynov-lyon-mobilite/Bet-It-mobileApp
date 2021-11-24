import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

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
            child: Column(
              children: [
                const Align(
                  child: Text(
                    "DATE DE NAISSANCE",
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2,
                      fontSize: 11,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                TextFormField(
                  enabled: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Indiquez votre date de naissance";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Date de naissance",
                    hintStyle: TextStyle(color: Colors.grey)
                  ),
                  controller: widget.ddnController,
                ),
              ],
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
            child: Column(
              children: [
                const Align(
                  child: Text(
                    "PAYS DE NAISSANCE",
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2,
                      fontSize: 11,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                TextFormField(
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
                    hintStyle: TextStyle(color: Colors.grey)
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            const Align(
              child: Text(
                "VILLE DE NAISSANCE",
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
                  return "Veuillez remplir votre ville de naissance";
                }
                return null;
              },
              controller: widget.cityController,
              decoration: const InputDecoration(
                hintText: "Ville de naissance",
                hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
          ],
        ),
      ],
    );
  }
}