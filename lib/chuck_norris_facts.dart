import "dart:convert";
import "package:http/http.dart" as http;
import "models/chuck_norris.dart";

Future<String> getJsonString(String url) async {
  final response = await http.get(Uri.parse(url));
  return response.body;
}

Future<ChuckNorris> getRandomJokeFromCategory(String category) async {
  final url = Uri.https("api.chucknorris.io", "/jokes/random", {"category": category});

  final jsonString = await getJsonString(url.toString());
  return ChuckNorris.fromJson(jsonString);
}


Future<List<ChuckNorris>> searchJokes(String query) async {
  final response = await http.get(Uri.parse('https://api.chucknorris.io/jokes/search?query=$query'));
  final json = jsonDecode(response.body);
  return (json['result'] as List).map((e) => ChuckNorris.fromJson(e)).toList();
}
