import 'dart:convert';

import 'package:awud_app/class/audio_fileMusic.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class categoryList extends StatefulWidget {
  final String name;

  categoryList({Key? key, required this.name}) : super(key: key);

  @override
  _categoryListState createState() => _categoryListState();
}

class _categoryListState extends State<categoryList> {
  List? music;
  List? playlist = [];
  List? image = [];
  var count = 0;

  Future getMusic() async{
    var response = await http.get(Uri.parse('http://$IpAddresse:8000/music'));

    if(response.statusCode == 200){
      music = json.decode(response.body);


      for(int i=0;i<music!.length;i++){
        if(music![i]['category'].contains(widget.name)){
          count = count + 1;
        }
      }

      // print(count);

      for(int i=0;i<count;i++){
        if(music![i]['category'].contains(widget.name)){
          playlist!.add(music![i]['path']);
          image!.add(music![i]['image']);
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
      child: NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) =>[
        SliverOverlapAbsorber(
          handle:
          NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                widget.name,
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
          ),
        )
      ],
        body: Container(
          color: Colors.white,
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
                      itemCount: music!.length,
                      itemBuilder: (context, index){
                        if(music![index]['category'].contains(widget.name)){

                          return Container(
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => MyAppp(id: music![index]['_id'].toString(), current: music![index]['path'].toString(), playlist: playlist, image: image, currentImage: music![index]['image'].toString(),title: music![index]['title'].toString())
                                    ));
                                  },
                                  child: ListTile(
                                    leading: Container(
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.network(
                                            'http://$IpAddresse:8000${music![index]['image']}',
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                    ),
                                    title: Text(music![index]['title'],style: TextStyle(color: Colors.black54)),
                                  ),
                                ),
                                SizedBox(height: 10)
                              ],
                            ),
                          );
                        }else{
                          return Container();
                        }
                      }
                  );
              }
            },
          )
        ),
      ),
    )
      )
    );
  }
}
