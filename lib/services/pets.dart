import 'package:adopt_app/models/pet.dart';

import "package:dio/dio.dart";

class DioClient {
  final Dio _dio = Dio();
  String _baseUrl = "http://10.0.2.2:5000";

  Future<List<Pet>> getPets() async {
    List<Pet> pets = [];
    try {
      Response response =
          await _dio.get("https://coded-pets-api-crud.eapi.joincoded.com/pets");
      pets = (response.data as List).map((pet) => Pet.fromJson(pet)).toList();
    } on DioError catch (error) {
      print(error);
    }
    return pets;
  }

  Future<Pet> createPet({required Pet pet}) async {
    late Pet retrievedPet;
    // retrievedPet = Pet.fromJson(response.data);
    try {
      FormData data = FormData.fromMap({
        "gender": pet.gender,
        "adoption": pet.isAdopted,
        "image": await MultipartFile.fromFile(
          pet.image, // Assuming pet.image contains the file path
        ),
      });
      Response response = await _dio.post(_baseUrl + '/pet', data: data);
      retrievedPet = Pet.fromJson(response.data);
    } on DioError catch (error) {
      print(error);
    }
    return retrievedPet;
  }

  deletePet({required int petId}) {}

  updatePet({required Pet pet}) {}

  adoptPet({required int petId}) {}
//1. Assign the `late` variable we created to the response, and return that variable.
//2. Don't forget to wrap your call with a `try-catch` block.
}
