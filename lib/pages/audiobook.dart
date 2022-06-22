import 'package:awud_app/class/infoPageAudiobook.dart';
import 'package:awud_app/pages/categoryAudiobookList.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'settings.dart';
import 'notifications.dart';
import 'searchAudiobook.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';

class Audiobook extends StatefulWidget {
  const Audiobook({Key? key}) : super(key: key);

  @override
  State<Audiobook> createState() => _AudiobookState();
}

class _AudiobookState extends State<Audiobook> {

  List? jsonData;
  List? episodes;

  // String value = '';
  Future getPodcast() async {
    var response = await http.get(
        Uri.parse('http://$IpAddresse:8000/audioBook'));

    if (response.statusCode == 200) {
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/notification': (context) => Notifications(),
          '/setting': (context) => HomeScreen()
        },
        home: Scaffold(
          body: SafeArea(
            child: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) =>
                [
                  SliverOverlapAbsorber(
                    handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverAppBar(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      title: const Text(
                        "Audiobook",
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
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: GestureDetector(
                                      onTap: () {
                                        showSearch(
                                            context: context,
                                            delegate: MySearchDelegate()
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
                                    onTap: () {
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
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 5),
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
                            height: 200,
                            child: FutureBuilder(
                              future: getPodcast(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.none &&
                                    snapshot.hasData == null) {
                                  return Container(
                                    child: Text('No Data'),
                                  );
                                }
                                else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container(
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Color.fromRGBO(
                                              248, 135, 88, 1),
                                        ),
                                      )
                                  );
                                } else {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: jsonData == null
                                          ? 0
                                          : jsonData!.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return Container(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      // print((json.decode(jsonData![index])).runtimeType);
                                                      Navigator.of(context)
                                                          .push(
                                                          MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                infoPageAudiobook(
                                                                    id: jsonData![index]['_id']
                                                                        .toString(),
                                                                    name: jsonData![index]['title']
                                                                        .toString()),
                                                          ));
                                                    });
                                                  },
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius
                                                          .circular(5),
                                                      child: Image.network(
                                                        'http://$IpAddresse:8000/${jsonData![index]['image']}',
                                                        height: 150,
                                                        width: 100,
                                                        fit: BoxFit.fitWidth,
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  jsonData![index]['title'],
                                                  style: TextStyle(
                                                      fontSize: 15
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  jsonData![index]['author_name'],
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
                            margin: EdgeInsets.only(top: 20, left: 5),
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
                            height: 200,
                            child: FutureBuilder(
                              future: getPodcast(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.none &&
                                    snapshot.hasData == null) {
                                  return Container(
                                    child: Text('No Data'),
                                  );
                                }
                                else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container(
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Color.fromRGBO(
                                              248, 135, 88, 1),
                                        ),
                                      )
                                  );
                                } else {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: jsonData == null
                                          ? 0
                                          : jsonData!.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        if ((jsonData![index]['category'])
                                            .contains('Technology')) {
                                          return Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        // print((json.decode(jsonData![index])).runtimeType);
                                                        Navigator.of(context)
                                                            .push(
                                                            MaterialPageRoute(
                                                              builder: (
                                                                  context) =>
                                                                  infoPageAudiobook(
                                                                      id: jsonData![index]['_id']
                                                                          .toString(),
                                                                      name: jsonData![index]['title']
                                                                          .toString()),
                                                            ));
                                                      });
                                                    },
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius
                                                            .circular(5),
                                                        child: Image.asset(
                                                          '${jsonData![index]['image']}',
                                                          height: 150,
                                                          width: 100,
                                                          fit: BoxFit.fill,
                                                        )
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    jsonData![index]['title'],
                                                    style: TextStyle(
                                                        fontSize: 15
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    jsonData![index]['author_name'],
                                                    style: TextStyle(
                                                        color: Colors.grey
                                                    ),
                                                  ),
                                                  SizedBox(width: 110)
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }
                                  );
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Fiction',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 200,
                            child: FutureBuilder(
                              future: getPodcast(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.none &&
                                    snapshot.hasData == null) {
                                  return Container(
                                    child: Text('No Data'),
                                  );
                                }
                                else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container(
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Color.fromRGBO(
                                              248, 135, 88, 1),
                                        ),
                                      )
                                  );
                                } else {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: jsonData == null
                                          ? 0
                                          : jsonData!.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        if ((jsonData![index]['category'])
                                            .contains('Fiction')) {
                                          return Container(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        // print((json.decode(jsonData![index])).runtimeType);
                                                        Navigator.of(context)
                                                            .push(
                                                            MaterialPageRoute(
                                                              builder: (
                                                                  context) =>
                                                                  infoPageAudiobook(
                                                                      id: jsonData![index]['_id']
                                                                          .toString(),
                                                                      name: jsonData![index]['title']
                                                                          .toString()),
                                                            ));
                                                      });
                                                    },
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius
                                                            .circular(5),
                                                        child: Image.network(
                                                          'http://$IpAddresse:8000/${jsonData![index]['image']}',
                                                          height: 150,
                                                          width: 100,
                                                          fit: BoxFit.fill,
                                                        )
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    jsonData![index]['title'],
                                                    style: TextStyle(
                                                        fontSize: 15
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    jsonData![index]['author_name'],
                                                    style: TextStyle(
                                                        color: Colors.grey
                                                    ),
                                                  ),
                                                  SizedBox(width: 110)
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
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
                              child: Text('Category',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        displayCategoryPage("Comedy");
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color.fromRGBO(248, 135, 88, 1),
                                            style: BorderStyle.solid,
                                          ),
                                          color: Color.fromRGBO(248, 135, 88, 1),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Center(child: Text('Comedy',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        displayCategoryPage("Philosophy");
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color.fromRGBO(248, 135, 88, 1),
                                            style: BorderStyle.solid,
                                          ),
                                          color: Color.fromRGBO(248, 135, 88, 1),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Center(child: Text('Philosophy',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        displayCategoryPage("Fitness");
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color.fromRGBO(248, 135, 88, 1),
                                            style: BorderStyle.solid,
                                          ),
                                          color: Color.fromRGBO(248, 135, 88, 1),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Center(child: Text('Fitness',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        displayCategoryPage("Religion");
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color.fromRGBO(248, 135, 88, 1),
                                            style: BorderStyle.solid,
                                          ),
                                          color: Color.fromRGBO(248, 135, 88, 1),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Center(child: Text('Religion',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
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

  void displayCategoryPage(String s) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => categoryAudiobookList(name:s.toString())));
  }
}