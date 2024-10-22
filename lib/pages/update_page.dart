import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/pages/update_pet_form.dart';
// import 'package:adopt_app/widgets/update_pet_form.dart'; // Make sure to import the form widget
import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget {
  final Pet pet; // Expecting a Pet argument
  const UpdatePage({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update a Pet"), // Updated title
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
                "Fill those fields to update a pet"), // Adjusted text to match the reference
            UpdatePetForm(
              pet: pet, // Passing pet object to the form
            ),
          ],
        ),
      ),
    );
  }
}
