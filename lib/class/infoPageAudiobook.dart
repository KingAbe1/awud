import 'dart:convert';
import '../main.dart';
import 'playerPageAudioBook.dart';
import '../pages/searchAudiobook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class infoPageAudiobook extends StatefulWidget {
  final String id;
  final String name;

  infoPageAudiobook({Key? key,required this.id, required this.name}) : super(key: key);

  @override
  State<infoPageAudiobook> createState() => infoPageAudiobookState();
}


class infoPageAudiobookState extends State<infoPageAudiobook> {
  var result;
  List? playlist = [];
  List? episodes;
  var num = 0;
  List? artistName = [];
  List? musicTitle = [];

  Future printValue() async{
    var response = await http.get(Uri.parse('http://${IpAddresse}:8000/audioBook/${widget.id}'));

    if(response.statusCode == 200){

      result = json.decode(response.body);

      if(num != 1){
        for(int i=0;i<result!['Chapters'].length;i++){
          playlist!.add("${result!['Chapters'][i]['file']}");
          artistName!.add("${result!['author_name']}");
          musicTitle!.add("${result!['Chapters'][i]['chapterName']}");
          num = 1;
        }
      }

      print(musicTitle);

      return result;
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
                                          itemCount: result == null ? 0 : 1,
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
                                                          "${result!['title']} - ",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:Alignment.centerLeft,
                                                        child:Text(
                                                          "${result!['Chapters'].length} Chapters",
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
                                                                    itemCount: result == null ? 0: result!['Chapters'].length,
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
                                                                                        // print(artistName);
                                                                                          Navigator.of(context).push(MaterialPageRoute(
                                                                                            builder: (context) => playerPage(value: result!['_id'].toString(),epi: result!['Chapters'][x]['file'].toString(),pl:playlist,image:result!['image'].toString(),title:result!['title'].toString(),artistName: artistName,musicTitle: musicTitle,singleTrackName: result!['Chapters'][index]['chapterName'].toString(),singleArtistName: result!['author_name'].toString()),
                                                                                          ));
                                                                                        // });
                                                                                      },
                                                                                      child: Stack(
                                                                                          alignment: Alignment.center,
                                                                                          children: [
                                                                                            Image.network(
                                                                                              // jsonData![index]['image'],
                                                                                              'http://$IpAddresse:8000/${result!['image']}',
                                                                                              height: 150,
                                                                                              width: 100,
                                                                                              fit: BoxFit.fill,
                                                                                            ),
                                                                                            // Image.asset(
                                                                                            //   "${result![0]['image']}",
                                                                                            //   fit: BoxFit.fill,
                                                                                            // ),
                                                                                            // addToPlaylist(result![0]['Chapters'][x]['chapter_audio']),
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
                                                                                        "EP#${x+1} ${result!['Chapters'][x]['chapterName']}",
                                                                                        style: TextStyle(
                                                                                            fontSize: 17,
                                                                                            fontWeight: FontWeight.bold
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        "${result!['createdAt']}",
                                                                                        style: TextStyle(
                                                                                            fontSize: 15,
                                                                                            color: Colors.black54
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(height: 15),
                                                                                      Text(
                                                                                        "${result!['Chapters'][x]['description2']}",
                                                                                        style: TextStyle(
                                                                                            fontSize: 15,
                                                                                            color: Colors.black54
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(height: 20),
                                                                                      Row(
                                                                                        children: [
                                                                                          Text(
                                                                                            "${result!['Chapters'][x]['chapterLength']} min",
                                                                                          ),
                                                                                          SizedBox(width: 35),
                                                                                          Icon(FeatherIcons.heart,color: Color.fromRGBO(248, 135, 88, 1),),
                                                                                          SizedBox(width: 35),
                                                                                          Icon(FeatherIcons.download,color: Color.fromRGBO(248, 135, 88, 1),)
                                                                                        ],
                                                                                      ),
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
                                      itemCount: result == null ? 0 : 1,
                                      itemBuilder: (BuildContext context,int index){
                                        return Container(
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.bottomCenter,
                                                children: [
                                                  Image.network(
                                                    // jsonData![index]['image'],
                                                    'http://$IpAddresse:8000/${result!['image']}',
                                                    height: 150,
                                                    width: 100,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.only(left: 8,bottom: 5),
                                                    child: Column(
                                                      children: [
                                                        Align(
                                                          alignment:Alignment.centerLeft,
                                                          child: Text(
                                                            result!['title'],
                                                            style: const TextStyle(
                                                                color: Colors.black,
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
                                                              color: Colors.black,
                                                              size: 20,
                                                            ),
                                                            const SizedBox(width: 3),
                                                            Text(
                                                                result!['author_name'],
                                                                style: const TextStyle(
                                                                  color: Colors.black,
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
                                                              color: Colors.black,
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
                                                                      // result!['category'].length
                                                                      itemCount: result == null ? 0: result!['category'].length,
                                                                      itemBuilder: (BuildContext context, int x){
                                                                        return Text(
                                                                            "${result!['category'][x]}, ",
                                                                            style: const TextStyle(
                                                                              color: Colors.black,
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
                                                            result!['audiobook_description'].toString(),
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
                                                          result!['Chapters'].length.toString(),
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
                                                            backgroundImage:
                                                            NetworkImage(
                                                              // jsonData![index]['image'],
                                                              'http://$IpAddresse:8000/${result!['image']}',

                                                            ),
                                                            // AssetImage(
                                                            //     "${result![0]['image']}"
                                                            // ),
                                                          ),
                                                          SizedBox(width: 15),
                                                          Text(
                                                            result!['author_name'].toString(),
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