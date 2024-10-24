import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@JsonSerializable()
class Pet {
  int? id;
  String name;
  String image;
  int age;
  bool adopted;
  String gender;

  Pet({
    this.id,
    required this.name,
    required this.image,
    this.adopted = false,
    required this.age,
    required this.gender,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  get isAdopted => null;
  Map<String, dynamic> toJson() => _$PetToJson(this);
}

// Provider
// void createPet(Pet pet) async {
//   Pet newPet = await PetsServices().createPet(pet: pet);
//   pet.insert(0, newPet);
//   notifyListeners();
// }
