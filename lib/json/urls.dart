import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import '../keys.dart';

part 'urls.g.dart';

@JsonSerializable()
class ElementList {
  final Urls urls;

  ElementList(this.urls);
  // List<Element> urls;
  // ElementList({required this.urls});
  //
  factory ElementList.fromJson (Map<String, dynamic> json) => _$ElementListFromJson(json);

  Map<String, dynamic> toJson() => _$ElementListToJson(this);
}


@JsonSerializable()
class Urls {
  final String full;
  final String regular;


  Urls({required this.full, required this.regular});

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}




  Future<List<ElementList>> getElementList() async {
    final uri = Uri.parse(
        'https://api.unsplash.com/photos?page=1&client_id=$unsplashApiKey');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final q = json.decode(response.body);
      List<ElementList> posts = List<ElementList>.from(q.map((model)=> ElementList.fromJson(model)));
      return posts;
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }

