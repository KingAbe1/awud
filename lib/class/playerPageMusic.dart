import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import '../main.dart';
import 'audio_fileSearchMusic.dart';

class playerPage extends StatefulWidget {
  final String value;
  final String epi;
  List? pl;
  List? image;
  final String title;

  playerPage({Key? key, required this.value, required this.epi, required this.pl, required this.image, required this.title}) : super(key: key);

  @override
  _playerPageState createState() => _playerPageState();
}

class _playerPageState extends State<playerPage> {
  late AudioPlayer advancedPlayer;
  List? result;
  var episode;

  Future printValue() async{
    var response = await http.get(Uri.parse('http://${IpAddresse}:8000/audioBook/${widget.value}'));

    if(response.statusCode == 200){
      result = json.decode(response.body);
      return result;
    }
  }

  // Future printEpisode() async{
  //
  //   var response = await Dio().get('http://${IpAddresse}:8000/chapter/${widget.value}/chapter/${widget.epi}');
  //
  //   if(response.statusCode == 200){
  //     episode = response.data;
  //     print(episode);
  //     return episode;
  //   }else{
  //     print('Wong input');
  //   }
  // }

  @override
  void initState(){
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: MyAppp(id:widget.value,current:widget.pl![0].toString(),playlist:widget.pl,image:widget.image, currentImage: widget.epi.toString(),title: widget.title)
        )
    );
  }
}