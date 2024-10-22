import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  String? _petImage;
  String? _petGender;
  bool _isAdopted = false;
  XFile? _image;
  int? _petId;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add a New Form for the Pet")),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Pet Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name for the pet';
                    }
                    return null; // Valid input
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Pet Age'), // Corrected label
                  validator: (value) {
                    if (value!.isEmpty) {
                      // the ! is to refert its not empty
                      return 'Please enter the age for the pet';
                    }
                    return null; // Valid input
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Pet gender'), // Corrected label
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the breed for the pet';
                    }
                    return null; // Valid input
                  },
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (image != null) {
                          setState(() {
                            _image = File(image!.path) as XFile?;
                          });
                        }
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(color: Colors.blue[200]),
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(color: Colors.blue[200]),
                          child: _image != null
                              ? Image.file(
                                  _image as File,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.fitHeight,
                                )
                              : Container(
                                  decoration:
                                      BoxDecoration(color: Colors.blue[200]),
                                  width: 200,
                                  height: 200,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Image"),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save(); // Save form data
                      // Provider.of<PetsProvider>(context, listen: false)
                      //     .createPet(Pet(

                      //   gender:
                      //       _petGender!, // Assuming you have a variable for gender

                      //   image:
                      //       _petImage!,
                      //       name: '', // Assuming _petImage holds the pet image URL or path
                      //   // Add other necessary fields here
                      // ));

                      GoRouter.of(context)
                          .pop(); // Navigate back after successful creation
                    } else {
                      print("Form is not valid ");
                    }
                  },
                  child: const Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
