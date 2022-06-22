import 'dart:convert';

import 'package:awud_app/class/infoPage.dart';
import 'package:awud_app/class/infoPageAudiobook.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class categoryAudiobookList extends StatefulWidget {
  final String name;

  categoryAudiobookList({Key? key, required this.name}) : super(key: key);

  @override
  _categoryPodcastListState createState() => _categoryPodcastListState();
}

class _categoryPodcastListState extends State<categoryAudiobookList> {

  List? podcast;
  List? playlist = [];
  List? image = [];
  var count = 0;

  Future getPodcast() async{
    var response = await http.get(Uri.parse('http://$IpAddresse:8000/audioBook'));

    if(response.statusCode == 200){
      podcast = json.decode(response.body);


      for(int i=0;i<podcast!.length;i++){
        if(podcast![i]['category'].contains(widget.name)){
          count = count + 1;
        }
      }

      print(count);

      for(int i=0;i<count;i++){
        if(podcast![i]['category'].contains(widget.name)){
          playlist!.add(podcast![i]['path']);
          image!.add(podcast![i]['image']);
        }
      }

      return podcast;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:  SafeArea(
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
                  future: getPodcast(),
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
                          itemCount: podcast!.length,
                          itemBuilder: (context, index){
                            if(podcast![index]['category'].contains(widget.name)){

                              return Container(
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => infoPageAudiobook(id: podcast![index]['_id'].toString(),name: podcast![index]['title'].toString()),
                                        ));
                                      },
                                      child: ListTile(
                                        leading: Container(
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.network(
                                                'http://$IpAddresse:8000/${podcast![index]['image']}',
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              )
                                          ),
                                        ),
                                        title: Text(podcast![index]['title'],style: TextStyle(color: Colors.black54)),
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
        ),
      ),
    );
  }
}
