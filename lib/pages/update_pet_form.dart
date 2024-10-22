import 'package:adopt_app/models/pet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UpdatePetForm extends StatefulWidget {
  final Pet pet; // Expecting a Pet argument

  UpdatePetForm({required this.pet});

  @override
  UpdatePetFormState createState() {
    return UpdatePetFormState();
  }
}

class UpdatePetFormState extends State<UpdatePetForm> {
  final _formKey = GlobalKey<FormState>();
  var _image;
  String _gender = "";
  bool _isAdopted = false; // Assuming you have an adoption status field
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Pet pet = widget.pet;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            initialValue: widget.pet.gender, // Pre-fill with existing pet data
            decoration: const InputDecoration(
              hintText: 'Pet Gender',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please fill out this field";
              }
              return null;
            },
            onSaved: (value) {
              _gender = value!;
            },
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _image = File(image!.path);
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(color: Colors.blue[200]),
                  child: _image != null
                      ? Image.file(
                          _image,
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.fitHeight,
                        )
                      : Container(
                          decoration: BoxDecoration(color: Colors.blue[200]),
                          width: 200,
                          height: 200,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Image"),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              },
              child: const Text("Update Pet"),
            ),
          )
        ],
      ),
    );
  }
}
