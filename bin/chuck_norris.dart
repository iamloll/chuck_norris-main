import 'dart:io';
import 'dart:math';
import 'package:chuck_norris/chuck_norris_facts.dart' as chuck_norris;
import 'package:dotenv/dotenv.dart';

void main(List<String> arguments) async {
  final dotenv = DotEnv()..load();
  final categories = dotenv["categories"]!.split(",");
  final category = categories[Random().nextInt(categories.length)];
  final query = stdin.readLineSync() ?? "";
  final data = query.isEmpty ? await chuck_norris.getRandomJokeFromCategory(category) : await chuck_norris.searchJokes(query);

  final file = File("facts.txt").openWrite();
    if (data != null) {
    file.write(data);
  }
  await file.close();
}
