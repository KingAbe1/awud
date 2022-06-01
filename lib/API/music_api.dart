// import 'dart:convert';
// import 'package:awud_app/model/musicModel.dart';
// import 'package:http/http.dart' as http;
//
// class BooksApi {
//   var data = [];
//   List<FetchedMusic> results = [];
//   String urlList = 'http://192.168.43.128:5000/podcast';
//
//   Future<List<FetchedMusic>> getuserList({String? query}) async {
//     var url = Uri.parse(urlList);
//
//     try {
//       // print(query);
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//         data = json.decode(response.body);
//         results = data.map((e) => FetchedMusic.fromJson(e)).toList();
//         if (query!= null){
//           results = results.where((element) => element.podcast_title!.toLowerCase().contains((query.toLowerCase()))).toList();
//           print(results);
//         }
//       } else {
//         print("fetch error");
//       }
//     } on Exception catch (e) {
//       print('error: $e');
//     }
//     return results;
//   }
// }