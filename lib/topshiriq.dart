// void main() {
//   String mix = '';
//   List<String> a = ["Banan", "Olma", "Anor"];

//   for (var element in a) {
//     mix += element + '';
//   }
//   print(mix);
// }

// void main() {
//   String mix = '';
//   List<String> a = ["Banan", "Olma", "Anor"];
//   a.forEach(print);
//   print(mix);
// }

void main() {
  String mix = '';
  List<String> a = ["Banan", "Olma", "Anor"];

  for (int i = 0; i < a.length; i++) {
    mix += i.toString();
  }

  print(mix);
}
