void main() {
  var khaled = Human.male(name: "Khaled", age: 12);
  var batol = Human.male(name: "Batol", age: 12);

  Human.kingdom = "Human";

  print(Human.kingdom); // mammel
}

class Human {
  // proerties (variables)
  String name;
  int age;
  String gender;

  static String kingdom = "mammel";

  // Human({required this.age, required this.name});
  Human.male({required this.age, required this.name}) : gender = "male";
  Human.female({required this.age, required this.name}) : gender = "female";

  // constructor

  // methods (functions)
}
