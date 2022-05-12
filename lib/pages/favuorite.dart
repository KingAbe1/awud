import 'package:flutter/material.dart';
import 'package:awud_app/pages/search.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Favuorite extends StatelessWidget {
  const Favuorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/notification': (context) => Notification(),
        '/setting': (context) => Setting(),
        '/music_page': (context) => MusicPage()
      },
      home: DefaultTabController(
        length: 4,
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
            bottom: TabBar(
              labelColor: Color.fromRGBO(248, 135, 88, 1),
              unselectedLabelColor: Colors.black54,
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
      )
    ],
            body: SafeArea(
              child: TabBarView(
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
        ),
      ),
                ),
    );
  }
}



class Notification extends StatefulWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                        "Notifications",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
                  )
                ],
                body: SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    color: Colors.white,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      "assets/images/telahun.jpg",
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  children: [
                                    Text(
                                      'Emaya Ethiopia',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Tilahun Gessesse',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '8 HOURS AGO - NEW SINGLE',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              color: Colors.black12,
                              height: 1,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      "assets/images/telahun.jpg",
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  children: [
                                    Text(
                                      'Emaya Ethiopia',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Tilahun Gessesse',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '8 HOURS AGO - NEW SINGLE',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              color: Colors.black12,
                              height: 1,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      "assets/images/telahun.jpg",
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  children: [
                                    Text(
                                      'Emaya Ethiopia',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Tilahun Gessesse',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '8 HOURS AGO - NEW SINGLE',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              color: Colors.black12,
                              height: 1,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      "assets/images/telahun.jpg",
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  children: [
                                    Text(
                                      'Emaya Ethiopia',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Tilahun Gessesse',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '8 HOURS AGO - NEW SINGLE',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              color: Colors.black12,
                              height: 1,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      "assets/images/telahun.jpg",
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  children: [
                                    Text(
                                      'Emaya Ethiopia',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Tilahun Gessesse',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '8 HOURS AGO - NEW SINGLE',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              color: Colors.black12,
                              height: 1,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      "assets/images/telahun.jpg",
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  children: [
                                    Text(
                                      'Emaya Ethiopia',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Tilahun Gessesse',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '8 HOURS AGO - NEW SINGLE',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              color: Colors.black12,
                              height: 1,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
        )
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

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
                      title: const Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
                  )
                ],
                body: SafeArea(
                  child: Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 5,right: 5),
                    child: ListView(
                      children: [
                        Container(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/128-1280406_view-user-icon-png-user-circle-icon-png.png'),
                              radius: 30,
                            ),
                            SizedBox(width: 10),
                            Column(
                              children: [
                                Text(
                                  'abellegesse151',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Awud Free',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10),
                          color: Colors.black12,
                          height: 1,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
        )
    );
  }
}

class MusicPage extends StatelessWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

      ),
    );
  }
}