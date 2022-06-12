import 'dart:convert';
import 'playerPageAudioBook.dart';
import 'package:awud_app/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class infoPagePodcast extends StatefulWidget {
  // final String value;
  final String id;
  final String name;

  infoPagePodcast({Key? key,required this.id, required this.name}) : super(key: key);

  @override
  State<infoPagePodcast> createState() => infoPagePodcastState();
}


class infoPagePodcastState extends State<infoPagePodcast> {

  List? result;
  List? episodes;
  // String value = '';
  Future printValue() async{
    // print(widget.id);
    var response = await http.get(Uri.parse('http://192.168.1.7:5000/audioBook/${widget.id}'));

    if(response.statusCode == 200){
      result = json.decode(response.body);
      // print(jsonData![0]);
      return result;
    }
  }

  printEpisode(x) async{
    var response = await http.get(Uri.parse('http://192.168.1.7:5000/chapters/${widget.id}/epsiode/'));

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
                                    icon: Icon(FeatherIcons.book),
                                    text: "Chapter"
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
                                          shrinkWrap: true,
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
                                                          "${result![index]['audiobook_title']} - ",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:Alignment.centerLeft,
                                                        child:Text(
                                                          "${result![0]['Chapters'].length} Episodes",
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
                                                                  // shrinkWrap: true,
                                                                    scrollDirection: Axis.vertical,
                                                                    itemCount: result == null ? 0: result![0]['Chapters'].length,
                                                                    itemBuilder: (BuildContext context, int x){
                                                                      return Container(
                                                                        child: Column(
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                            builder: (context) => playerPage(value: result![0]['_id'].toString(),epi: result![0]['Chapters'][x]['_id'].toString()),
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
                                                                                Flexible(
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        "EP#${x+1} ${result![0]['Chapters'][x]['chapter_name']}",
                                                                                        style: TextStyle(
                                                                                            fontSize: 17,
                                                                                            fontWeight: FontWeight.bold
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        "${result![0]['Chapters'][x]['chapter_released_date']}",
                                                                                        style: TextStyle(
                                                                                            fontSize: 15,
                                                                                            color: Colors.black54
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(height: 15),
                                                                                      Text(
                                                                                        "${result![0]['Chapters'][x]['chapter_description']}",
                                                                                        style: TextStyle(
                                                                                            fontSize: 15,
                                                                                            color: Colors.black54
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(height: 20),
                                                                                      Row(
                                                                                        children: [
                                                                                          Text(
                                                                                            "${result![0]['Chapters'][x]['chapter_length']}",
                                                                                          ),
                                                                                          SizedBox(width: 35),
                                                                                          Icon(FeatherIcons.heart,color: Color.fromRGBO(248, 135, 88, 1),),
                                                                                          SizedBox(width: 35),
                                                                                          Icon(FeatherIcons.download,color: Color.fromRGBO(248, 135, 88, 1),)
                                                                                        ],
                                                                                      )
                                                                                    ],
                                                                                  ),
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
                                                            result![index]['audiobook_title'],
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
                                                                result![index]['author_name'],
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
                                                                        if(result![i]['rate'] == 0 && result![i]['rate'] < 1.0){
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
                                                                        }else if(result![i]['rate'] > 1.0 && result![i]['rate'] < 2.0){
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
                                                                        }else if(result![i]['rate'] >= 2.0 && result![i]['rate'] < 3.0){
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
                                                                        }else if(result![i]['rate'] >= 3.0 && result![i]['rate'] < 4.0){
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
                                                            result![0]['audiobook_description'].toString(),
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
                                                        child: Text('Chapters',
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
                                                          result![0]['Chapters'].length.toString(),
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
                                                        child: Text('Author',
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
                                                            result![0]['author_name'].toString(),
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