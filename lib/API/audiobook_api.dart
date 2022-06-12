import 'dart:convert';
import 'package:awud_app/model/audiobookModel.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  var data = [];
  List<FetchedAudiobook> results = [];
  String urlList = 'http://192.168.1.7:5000/audiobook';

  Future<List<FetchedAudiobook>> getPodcastList({String? query}) async {
    var url = Uri.parse(urlList);

    try {
      // print(query);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => FetchedAudiobook.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.audiobook_title!.toLowerCase().contains((query.toLowerCase()))).toList();
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