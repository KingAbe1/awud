import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'search.dart';
import 'package:http/http.dart' as http;
import 'audio_file.dart';


class Podcast extends StatefulWidget {
  const Podcast({Key? key}) : super(key: key);

  @override
  State<Podcast> createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  List? jsonData;
  List? episodes;
  // String value = '';
  Future getPodcast() async{
    var response = await http.get(Uri.parse('http://192.168.1.10:3000/podcasts'));

    if(response.statusCode == 200){
      jsonData = json.decode(response.body);
      return jsonData;
    }
  }

  @override
  void initState() {
    getPodcast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getPodcast();
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
                      title: const Text(
                        "Podcast",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                      actions: [
                        Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Row(
                              children:[
                                Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: GestureDetector(
                                      onTap: (){
                                        showSearch(
                                          context:context,
                                          delegate: MySearchDelegate(),
                                        );
                                      },
                                      child: Icon(
                                        FeatherIcons.search,
                                        color: Color.fromRGBO(248, 135, 88, 1),
                                        size: 20,
                                      ),
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context, '/notification');
                                    },
                                    child: Icon(
                                      FeatherIcons.bell,
                                      color: Color.fromRGBO(248, 135, 88, 1),
                                      size: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context, '/setting');
                                    },
                                    child: Icon(
                                      FeatherIcons.settings,
                                      color: Color.fromRGBO(248, 135, 88, 1),
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            )
                        )
                      ],
                    ),
                  )
                ],
                body: SafeArea(
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 5,right: 5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20,left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Recent',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 153,
                            child: FutureBuilder(
                              future: getPodcast(),
                              builder: (context,snapshot){
                                if(snapshot.connectionState == ConnectionState.none && snapshot.hasData == null){
                                  return Container(
                                    child: Text('No Data'),
                                  );
                                }
                                else if(snapshot.connectionState == ConnectionState.waiting){
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
                                      scrollDirection: Axis.horizontal,
                                      itemCount: jsonData == null ? 0: jsonData!.length,
                                      itemBuilder: (BuildContext context, int index){
                                        return Container(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      // print((json.decode(jsonData![index])).runtimeType);
                                                      Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (context) => infoPage(value: jsonData![index]['_id'].toString(),id: jsonData![index]['_id'].toString(),name: jsonData![index]['podcast_title'].toString()),
                                                      ));
                                                    });
                                                  },
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(5),
                                                      child: Image.asset(
                                                        '${jsonData![index]['image']}',
                                                        height: 100,
                                                        width: 100,
                                                        fit: BoxFit.fill,
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  jsonData![index]['podcast_title'],
                                                  style: TextStyle(
                                                      fontSize: 15
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  jsonData![index]['artist_name'],
                                                  style: TextStyle(
                                                      color: Colors.grey
                                                  ),
                                                ),
                                                SizedBox(width: 110)
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                  );
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20,left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Technology',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 153,
                            child: FutureBuilder(
                              future: getPodcast(),
                              builder: (context,snapshot){
                                if(snapshot.connectionState == ConnectionState.none && snapshot.hasData == null){
                                  return Container(
                                    child: Text('No Data'),
                                  );
                                }
                                else if(snapshot.connectionState == ConnectionState.waiting){
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
                                      scrollDirection: Axis.horizontal,
                                      itemCount: jsonData == null ? 0: jsonData!.length,
                                      itemBuilder: (BuildContext context, int index){
                                        if((jsonData![index]['category']).contains('Technology')){
                                          return Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        print(jsonData![index]['podcast_title']);
                                                      });
                                                    },
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(5),
                                                        child: Image.asset(
                                                          '${jsonData![index]['image']}',
                                                          height: 100,
                                                          width: 100,
                                                          fit: BoxFit.fill,
                                                        )
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    jsonData![index]['podcast_title'],
                                                    style: TextStyle(
                                                        fontSize: 15
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    jsonData![index]['artist_name'],
                                                    style: TextStyle(
                                                        color: Colors.grey
                                                    ),
                                                  ),
                                                  SizedBox(width: 110)
                                                ],
                                              ),
                                            ),
                                          );
                                        }else{
                                          return Container();
                                        }
                                      }
                                  );
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20,left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Entertainment',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 150,
                            child: FutureBuilder(
                              future: getPodcast(),
                              builder: (context,snapshot){
                                if(snapshot.connectionState == ConnectionState.none && snapshot.hasData == null){
                                  return Container(
                                    child: Text('No Data'),
                                  );
                                }
                                else if(snapshot.connectionState == ConnectionState.waiting){
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
                                      scrollDirection: Axis.horizontal,
                                      itemCount: jsonData == null ? 0: jsonData!.length,
                                      itemBuilder: (BuildContext context, int index){
                                        if((jsonData![index]['category']).contains('Entertainment')){
                                          return Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        print(jsonData![index]['podcast_title']);
                                                      });
                                                    },
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(5),
                                                        child: Image.asset(
                                                          '${jsonData![index]['image']}',
                                                          height: 100,
                                                          width: 100,
                                                          fit: BoxFit.fill,
                                                        )
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    jsonData![index]['podcast_title'],
                                                    style: TextStyle(
                                                        fontSize: 15
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    jsonData![index]['artist_name'],
                                                    style: TextStyle(
                                                        color: Colors.grey
                                                    ),
                                                  ),
                                                  SizedBox(width: 110)
                                                ],
                                              ),
                                            ),
                                          );
                                        }else{
                                          return Container();
                                        }
                                      }
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ),
        )
    );
  }
}

class infoPage extends StatefulWidget {
  final String value;
  final String id;
  final String name;

  infoPage({Key? key, required this.value, required this.id, required this.name}) : super(key: key);

  @override
  State<infoPage> createState() => _infoPageState();
}

class _infoPageState extends State<infoPage> {

  List? result;
  List? episodes;
  // String value = '';
  Future printValue() async{
    // print(widget.id);
    var response = await http.get(Uri.parse('http://192.168.1.10:3000/podcasts/${widget.value}'));

    if(response.statusCode == 200){
      result = json.decode(response.body);
      // print(jsonData![0]);
      return result;
    }
  }

  printEpisode(x) async{
    var response = await http.get(Uri.parse('http://192.168.1.10:3000/episodes/${widget.id}/epsiode/'));

    if(response.statusCode == 200){
      episodes = json.decode(response.body);
      // print(episodes);
      return x;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
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
                            title: Text(
                              "${widget.name}",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ),
                            actions: [
                              Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: Row(
                                    children:[
                                      Padding(
                                          padding: EdgeInsets.only(right: 20),
                                          child: GestureDetector(
                                            onTap: (){
                                              showSearch(
                                                context:context,
                                                delegate: MySearchDelegate(),
                                              );
                                            },
                                            child: Icon(
                                              FeatherIcons.search,
                                              color: Color.fromRGBO(248, 135, 88, 1),
                                              size: 20,
                                            ),
                                          )
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.pushNamed(context, '/notification');
                                          },
                                          child: Icon(
                                            FeatherIcons.bell,
                                            color: Color.fromRGBO(248, 135, 88, 1),
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.pushNamed(context, '/setting');
                                          },
                                          child: Icon(
                                            FeatherIcons.settings,
                                            color: Color.fromRGBO(248, 135, 88, 1),
                                            size: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              )
                            ],
                            bottom: const TabBar(
                              labelColor: Color.fromRGBO(248, 135, 88, 1),
                              unselectedLabelColor: Colors.black54,
                              indicatorColor: Color.fromRGBO(248, 135, 88, 1),
                              indicatorWeight: 3,
                              tabs: [
                                Tab(
                                    icon: Icon(FeatherIcons.mic),
                                    text: "Episode"
                                ),
                                Tab(
                                    icon: Icon(FeatherIcons.info),
                                    text: "About"
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                      body: SafeArea(
                        child: TabBarView(
                          children: [
                            Container(
                              child: FutureBuilder(
                                  future: printValue(),
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
                                          itemCount: result == null ? 0 : result!.length,
                                          itemBuilder: (BuildContext context,int index){
                                            return Container(
                                              margin: EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment:Alignment.centerLeft,
                                                        child:Text(
                                                          "${result![index]['podcast_title']} - ",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:Alignment.centerLeft,
                                                        child:Text(
                                                          "${result![0]['episodes'].length} Episodes",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 50)
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: 400,
                                                        child: FutureBuilder(
                                                            future: printValue(),
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
                                                                    scrollDirection: Axis.vertical,
                                                                    itemCount: result == null ? 0: result![0]['episodes'].length,
                                                                    itemBuilder: (BuildContext context, int x){
                                                                      return Container(
                                                                        child: Column(
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                SizedBox(
                                                                                  width:100,
                                                                                  height:100,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(5),
                                                                                    child: GestureDetector(
                                                                                      onTap:(){
                                                                                        setState(() {
                                                                                          // print((json.decode(jsonData![index])).runtimeType);
                                                                                          Navigator.of(context).push(MaterialPageRoute(
                                                                                            builder: (context) => playerPage(value: result![0]['_id'].toString(),epi: result![0]['episodes'][x]['_id'].toString()),
                                                                                          ));
                                                                                        });
                                                                                      },
                                                                                      child: Stack(
                                                                                          alignment: Alignment.center,
                                                                                          children: [
                                                                                            Image.asset(
                                                                                              "${result![0]['image']}",
                                                                                              fit: BoxFit.fill,
                                                                                            ),
                                                                                            FaIcon(
                                                                                              FontAwesomeIcons.play,
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                          ]
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(width: 60),
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      "EP#${x+1} ${result![0]['episodes'][x]['episode_name']}",
                                                                                      style: TextStyle(
                                                                                          fontSize: 17,
                                                                                          fontWeight: FontWeight.bold
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      "${result![0]['episodes'][x]['episode_released_date']}",
                                                                                      style: TextStyle(
                                                                                          fontSize: 15,
                                                                                          color: Colors.black54
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(height: 15),
                                                                                    Text(
                                                                                      "${result![0]['episodes'][x]['episode_description']}",
                                                                                      style: TextStyle(
                                                                                          fontSize: 15,
                                                                                          color: Colors.black54
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(height: 20),
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          "${result![0]['episodes'][x]['episode_length']}",
                                                                                        ),
                                                                                        SizedBox(width: 35),
                                                                                        Icon(FeatherIcons.heart,color: Color.fromRGBO(248, 135, 88, 1),),
                                                                                        SizedBox(width: 35),
                                                                                        Icon(FeatherIcons.download,color: Color.fromRGBO(248, 135, 88, 1),)
                                                                                      ],
                                                                                    )
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            ),
                                                                            SizedBox(height: 20)
                                                                          ],
                                                                        ),
                                                                      );
                                                                    }
                                                                );
                                                              }
                                                            }
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          }
                                      );
                                    }
                                  }
                              ),
                            ),
                            Container(
                              child: FutureBuilder(
                                future: printValue(),
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
                                      itemCount: result == null ? 0 : result!.length,
                                      itemBuilder: (BuildContext context,int index){
                                        return Container(
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.bottomCenter,
                                                children: [
                                                  Image.asset(
                                                    '${result![index]['image']}',
                                                    fit: BoxFit.fill,
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.only(left: 8,bottom: 5),
                                                    child: Column(
                                                      children: [
                                                        Align(
                                                          alignment:Alignment.centerLeft,
                                                          child: Text(
                                                            result![index]['podcast_title'],
                                                            style: const TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              FeatherIcons.user,
                                                              color: Colors.white,
                                                              size: 20,
                                                            ),
                                                            const SizedBox(width: 3),
                                                            Text(
                                                                result![index]['artist_name'],
                                                                style: const TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 16,
                                                                )
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(height: 5),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              FeatherIcons.layers,
                                                              color: Colors.white,
                                                              size: 20,
                                                            ),
                                                            const SizedBox(width: 3),
                                                            SizedBox(
                                                              height: 15,
                                                              child: FutureBuilder(
                                                                future: printValue(),
                                                                builder: (context,snapshot){
                                                                  if(snapshot.connectionState == ConnectionState.none && snapshot.hasData == null){
                                                                    return const Text('No Data');
                                                                  }
                                                                  else if(snapshot.connectionState == ConnectionState.waiting){
                                                                    return const Center(
                                                                      child: CircularProgressIndicator(
                                                                        color: Color.fromRGBO(248, 135, 88, 1),
                                                                      ),
                                                                    );
                                                                  }else{
                                                                    return ListView.builder(
                                                                      shrinkWrap: true,
                                                                      scrollDirection: Axis.horizontal,
                                                                      itemCount: result == null ? 0: result![0]['category'].length,
                                                                      itemBuilder: (BuildContext context, int x){
                                                                        return Text(
                                                                            "${result![0]['category'][x]}, ",
                                                                            style: const TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 16,
                                                                            )
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 3),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 50,
                                                              child: FutureBuilder(
                                                                future: printValue(),
                                                                builder: (context,snapshot){
                                                                  if(snapshot.connectionState == ConnectionState.none && snapshot.hasData == null){
                                                                    return const Text('No Data');
                                                                  }
                                                                  else if(snapshot.connectionState == ConnectionState.waiting){
                                                                    return const Center(
                                                                      child: CircularProgressIndicator(
                                                                        color: Color.fromRGBO(248, 135, 88, 1),
                                                                      ),
                                                                    );
                                                                  }else{
                                                                    return ListView.builder(
                                                                      shrinkWrap: true,
                                                                      scrollDirection: Axis.horizontal,
                                                                      itemCount: result == null ? 0 : result!.length,
                                                                      itemBuilder: (BuildContext context, int i){
                                                                        if(result![index]['rate'] == 0 && result![index]['rate'] < 1.0){
                                                                          return Row(
                                                                            children: const [
                                                                              Text(
                                                                                'Your podcast is not rated',
                                                                                style: TextStyle(
                                                                                    color: Colors.white,
                                                                                    fontSize: 16,
                                                                                    fontWeight: FontWeight.bold
                                                                                ),
                                                                              )
                                                                            ],
                                                                          );
                                                                        }else if(result![index]['rate'] > 1.0 && result![index]['rate'] < 2.0){
                                                                          return Row(
                                                                            children: const [
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Icon(
                                                                                FeatherIcons.star,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Icon(
                                                                                FeatherIcons.star,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Icon(
                                                                                FeatherIcons.star,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Icon(
                                                                                FeatherIcons.star,
                                                                                color: Colors.white,
                                                                              )
                                                                            ],
                                                                          );
                                                                        }else if(result![index]['rate'] >= 2.0 && result![index]['rate'] < 3.0){
                                                                          return Row(
                                                                            children: const [
                                                                              Icon(
                                                                                FeatherIcons.star,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Icon(
                                                                                FeatherIcons.star,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Icon(
                                                                                FeatherIcons.star,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Icon(
                                                                                FeatherIcons.star,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Icon(
                                                                                FeatherIcons.star,
                                                                                color: Colors.white,
                                                                              )
                                                                            ],
                                                                          );
                                                                        }else{
                                                                          return Row(
                                                                            children: const [
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Colors.white,
                                                                              ),
                                                                              Icon(
                                                                                FeatherIcons.star,
                                                                                color: Colors.white,
                                                                              )
                                                                            ],
                                                                          );
                                                                        }
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                            const SizedBox(width: 100),
                                                            SizedBox(
                                                              width:100,
                                                              child: ElevatedButton(
                                                                onPressed: (){
                                                                  print('Hello');
                                                                },
                                                                child: const Text('Follow'),
                                                                style: ElevatedButton.styleFrom(
                                                                    primary: const Color.fromRGBO(248, 135, 88, 1)
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(15),
                                                child: Column(
                                                  children: [
                                                    const Align(
                                                        alignment:Alignment.centerLeft,
                                                        child: Text(
                                                          'Description',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        )
                                                    ),
                                                    SizedBox(height: 5),
                                                    Container(
                                                      margin: EdgeInsets.all(10),
                                                      child: SizedBox(
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            result![0]['podcast_description'].toString(),
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors.black54
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Align(
                                                        alignment:Alignment.centerLeft,
                                                        child: Text('Episodes',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        )
                                                    ),
                                                    SizedBox(height: 5),
                                                    Container(
                                                      margin: EdgeInsets.all(10),
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          result![0]['episodes'].length.toString(),
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Align(
                                                        alignment:Alignment.centerLeft,
                                                        child: Text('Creator',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        )
                                                    ),
                                                    SizedBox(height: 5),
                                                    Container(
                                                      margin: EdgeInsets.all(10),
                                                      child: Row(
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 25,
                                                            backgroundColor: Colors.blue,
                                                            backgroundImage: AssetImage(
                                                                "${result![0]['image']}"
                                                            ),
                                                          ),
                                                          SizedBox(width: 15),
                                                          Text(
                                                            result![0]['artist_name'].toString(),
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors.black54
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                )
            )
        )
    );
  }

}

class playerPage extends StatefulWidget {
  final String value;
  final String epi;

  playerPage({Key? key, required this.value, required this.epi}) : super(key: key);

  @override
  _playerPageState createState() => _playerPageState();
}

class _playerPageState extends State<playerPage> {

  List? result;
  var episode;

  Future printValue() async{
    var response = await http.get(Uri.parse('http://192.168.1.10:3000/podcasts/${widget.value}'));

    if(response.statusCode == 200){
      result = json.decode(response.body);
      return result;
    }
  }

  Future printEpisode() async{
   var response = await Dio().get('http://192.168.1.10:3000/episodes/${widget.value}/epsiode/${widget.epi}');

    if(response.statusCode == 200){
      episode = response.data;
      return episode;
    }else{
      print('Wong input');
    }
  }

  late AudioPlayer advancedPlayer;

  @override
  void initState(){
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
          body: SizedBox(
            height: 700,
            child: FutureBuilder(
              future: printValue(),
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
                      itemCount: result == null ? 0 : result!.length,
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("${result![0]['image']}"),
                                fit: BoxFit.cover,
                                // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken)
                              )
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 5,sigmaX: 5),
                            child: Column(
                              children: [
                                SizedBox(height: 100),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset("${result![0]['image']}",
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                // SizedBox(height: 80),
                                Container(
                                  margin: EdgeInsets.only(left: 80,top: 25),
                                  child: Row(
                                    children: [
                                      Icon(FeatherIcons.thumbsUp,color: Colors.white,),
                                      SizedBox(width: 60),
                                      Icon(FeatherIcons.download,color: Colors.white,),
                                      SizedBox(width: 60),
                                      Icon(FeatherIcons.share2,color: Colors.white,),
                                      SizedBox(width: 60),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 60),
                                Container(
                                  child: FutureBuilder(
                                    future: printEpisode(),
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
                                            scrollDirection: Axis.vertical,
                                          itemCount: result == null ? 0 : result!.length,
                                          itemBuilder: (BuildContext context,int index){
                                            return Container(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    episode['episode_name'].toString(),
                                                    style: TextStyle(
                                                      fontSize:30,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    result![0]['podcast_title'].toString(),
                                                    style: TextStyle(
                                                      fontSize:20,
                                                      // fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height:60),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        AudioFile(advancedPlayer:advancedPlayer,path:"audio/${episode['episode_audio']}")
                                                      ],
                                                    ),
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
                        );
                      }
                  );
                }
              },
            ),
          )
      ),
    );
  }
}

class FetchedPodcast{
  var artist_name,podcast_title,podcast_description,image,category,rate;

  FetchedPodcast(this.artist_name, this.podcast_title, this.podcast_description, this.image,this.category,this.rate);
}