import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatelessWidget {
  final List<String> values;  // List of values for the dropdown
  final double width;         // Width of the dropdown container

  CustomDropdownWidget({required this.values, required this.width});

  @override
  Widget build(BuildContext context) {
    // Convert the list of values into a list of DropdownMenuItem<String>
    List<DropdownMenuItem<String>> items = values.map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
      width: width,  // Use the passed width
      decoration: BoxDecoration(
        color: const Color.fromRGBO(53, 53, 53, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: values.isNotEmpty ? values.first : null,  // Default value (first item)
        dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),
        underline: Container(),  // Removes the underline
        style: const TextStyle(color: Colors.white),
        onChanged: (String? value) {
          // Handle the dropdown change here
          print(value);
        },
        items: items,
      ),
    );
  }
}
