import 'dart:convert';

import 'package:awud_app/class/audio_fileMusic.dart';
import 'package:awud_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:http/http.dart' as http;

class albumPages extends StatefulWidget {
  final String id;
  final String image;
  final String name;

  albumPages({Key? key,required this.name,required this.id,required this.image}) : super(key: key);

  @override
  _albumPageState createState() => _albumPageState();
}

class _albumPageState extends State<albumPages> {
  List? playlist = [];
  List? images = [];
  List? music;
  var num = 0;
  List? artistName = [];
  List? musicTitle = [];

  Future getMusic() async{
    var response = await http.get(Uri.parse('http://$IpAddresse:8000/music/user/${widget.name}'));

    if(response.statusCode == 200){
      music = json.decode(response.body);

      if(num != 1){
        for(int i=0;i<music!.length;i++){
          playlist!.add(music![i]['path']);
          images!.add(music![i]['image']);
          artistName!.add(music![i]['artist_name']);
          musicTitle!.add(music![i]['title']);
          num = 1;
        }
      }

      return music;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network('http://$IpAddresse:8000${widget.image}'),
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height:20),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: FutureBuilder(
                      future: getMusic(),
                      builder: (context,snapshot){
                        if(snapshot.connectionState == ConnectionState.none && snapshot.hasData == null){
                          return Container(
                            child: Text('No Data'),
                          );
                        }else if(snapshot.connectionState == ConnectionState.waiting){
                          return Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Color.fromRGBO(248, 135, 88, 1),
                                ),
                              )
                          );
                        }else{
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: music == null ? 0 : music!.length,
                              itemBuilder: (BuildContext context,int index){
                                return Container(
                                  margin: EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => MyAppp(id: music![index]['_id'].toString(), current: music![index]['path'].toString(), playlist: playlist, image: images, currentImage: music![index]['image'].toString(),title: music![index]['title'].toString(),artistName: artistName, musicTitle: musicTitle,singleTrackName: music![index]['title'].toString(),singleArtistName: music![index]['artist_name'].toString())
                                          ));
                                        },
                                        child: Row(
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                ClipRRect(
                                                    borderRadius: BorderRadius.circular(5),
                                                    child: Image.network(
                                                      'http://$IpAddresse:8000${music![index]['image']}',
                                                      height: 100,
                                                      width: 100,
                                                      fit: BoxFit.fill,
                                                    )
                                                ),
                                                Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.white,
                                                  size: 50,
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 25),
                                            Column(
                                              children: [
                                                Text(music![index]['title'],style: TextStyle(fontSize: 20),),
                                                SizedBox(height: 5,),
                                                Text(widget.name,style: TextStyle(color: Colors.black54),),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height:20),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        color: Colors.grey,
                                        height: 1,
                                      )
                                    ],
                                  ),
                                );
                              }
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
