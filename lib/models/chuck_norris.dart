import 'dart:convert';

class ChuckNorris {
  String fact;
  String id;
  String createdAt;
  String category;
  ChuckNorris(
      {required this.fact,
      required this.id,
      required this.createdAt,
      required this.category});

  @override
  String toString() => 'ID: $id, Creato il: $createdAt, Category: $category, Fact: $fact';

  factory ChuckNorris.fromJson(String jsonString) => ChuckNorris.fromMap(json.decode(jsonString));

  factory ChuckNorris.fromMap(Map<String, dynamic> map) => ChuckNorris(
    fact: map["value"],
    id: map["id"],
    createdAt: map["created_at"],
    category: map["categories"].toString()
  );
}
