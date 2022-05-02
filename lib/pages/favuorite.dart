import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Favuorite extends StatelessWidget {
  const Favuorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              "Library",
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
                    children: const [
                      Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            FeatherIcons.search,
                            color: Colors.black,
                            size: 20,
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          FeatherIcons.bell,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          FeatherIcons.settings,
                          color: Colors.black,
                          size: 20,
                        ),
                      )
                    ],
                  )
              )
            ],
            bottom: TabBar(
              labelColor: Color.fromRGBO(248, 135, 88, 1),
              unselectedLabelColor: Colors.black,
              indicatorColor: Color.fromRGBO(248, 135, 88, 1),
              indicatorWeight: 3,
              tabs: [
                Tab(
                    icon: Icon(FeatherIcons.music),
                    text: "Music"
                ),
                Tab(
                    icon: Icon(FeatherIcons.mic),
                    text: "Podcast"
                ),
                Tab(
                    icon: Icon(FeatherIcons.bookOpen),
                    text: "Audiobook"
                ),
                Tab(
                    icon: Icon(FeatherIcons.dollarSign),
                    text: "Purchases"
                )
              ],
            ),
          ),
          body: TabBarView(
              children: [
                ListView(
                  children: [
                    ListTile(
                      onTap: (){
                        print("hello");
                      },
                        leading: Icon(FeatherIcons.download),
                        title: Text('Downlaoded Music'),
                        subtitle: Text("0"),
                    ),
                    ListTile(
                      onTap: (){
                        print("hello");
                      },
                      leading: Icon(FeatherIcons.heart),
                      title: Text('Favourite Music'),
                      subtitle: Text("0"),
                    ),
                    ListTile(
                      onTap: (){
                        print("hello");
                      },
                      leading: Icon(FeatherIcons.play),
                      title: Text('Playlists'),
                      subtitle: Text("0"),
                    ),
                    ListTile(
                      onTap: (){
                        print("hello");
                      },
                      leading: Icon(FeatherIcons.music),
                      title: Text("Albums"),
                      subtitle: Text("0"),
                    ),
                    ListTile(
                      onTap: (){
                        print("hello");
                      },
                      leading: Icon(FeatherIcons.user),
                      title: Text('Artists'),
                      subtitle: Text("0"),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    ListTile(
                      onTap: (){
                        print("hello");
                      },
                      leading: Icon(FeatherIcons.download),
                      title: Text('Downlaoded episodes'),
                      subtitle: Text("0"),
                    ),
                    ListTile(
                      onTap: (){
                        print("hello");
                      },
                      leading: Icon(FeatherIcons.heart),
                      title: Text('Favourite podcast'),
                      subtitle: Text("0"),
                    )
                  ],
                ),
                ListView(
                  children: [
                    ListTile(
                      onTap: (){
                        print("hello");
                      },
                      leading: Icon(FeatherIcons.download),
                      title: Text('Downlaoded Audiobook'),
                      subtitle: Text("0"),
                    ),
                    ListTile(
                      onTap: (){
                        print("hello");
                      },
                      leading: Icon(FeatherIcons.heart),
                      title: Text('Favourite Audiobook'),
                      subtitle: Text("0"),
                    )
                  ],
                ),
                ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        FeatherIcons.dollarSign
                      ),
                      title: Text('Purcashe History'),
                      subtitle: Text("No purchase history"),
                    )
                  ],
                ),
          ]),
        ),
      ),
    );
  }
}
