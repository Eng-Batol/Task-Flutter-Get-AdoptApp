void main() {
  // printHellow("Khaled", "12");
  // printHelloNamed(name: "Khaled", age: "12");
  // printHelloNamed(age: "12", name: "Khaled");

  specialPrint("Khlaed", extra: "*");
  positionalOptioal("Khaled", "#");
}

//example of 2 positnal argument ( posintal by defult is requeried )
void printHellow(String name, String age) {
  print("hello $name $age");
}

void printHelloNamed({required String name, required String age}) {
  print("hello $name $age");
}

// named argument
void specialPrint(String text, {required String extra}) {
  print("$extra$text$extra");
}

// potitional named
void positionalOptioal(String text, [String extra = ""]) {
  print("$extra$text$extra");
}
