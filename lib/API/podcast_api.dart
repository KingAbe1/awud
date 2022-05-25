import 'dart:convert';
import 'package:awud_app/pages/podcast.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  var data = [];
  List<FetchedPodcast> results = [];
  String urlList = 'http://192.168.43.59:3000/podcasts';

  Future<List<FetchedPodcast>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);

    try {
      // print(query);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => FetchedPodcast.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.podcast_title!.toLowerCase().contains((query.toLowerCase()))).toList();
          print(results);
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}