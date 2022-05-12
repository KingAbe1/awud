import 'package:awud_app/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Music extends StatelessWidget {
  const Music({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/notification': (context) => Notification(),
          '/setting': (context) => Setting(),
          '/music_page': (context) => MusicPage()
        },
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
                    "Music",
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
              margin: const EdgeInsets.only(left: 5,right: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Recently Played",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Card(
                                child: GestureDetector(
                                  onTap: (){
                                    print("hello");
                                  },
                                  child: Stack(
                                      alignment:Alignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/channels4_profile (2).jpg",
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        // InkWell(
                                        //   child: const FaIcon(
                                        //     FontAwesomeIcons.play,
                                        //     color: Colors.white,
                                        //   ),
                                        //   onTap: (){
                                        //     print("recently played");
                                        //   },
                                        // )
                                      ]
                                  ),
                                ),
                              ),
                            Card(
                              child: GestureDetector(
                                onTap: (){
                                  print("hello");
                                },
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/channels4_profile (2).jpg",
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      // InkWell(
                                      //   child: const FaIcon(
                                      //     FontAwesomeIcons.play,
                                      //     color: Colors.white,
                                      //   ),
                                      //   onTap: (){
                                      //     print("recently played");
                                      //   },
                                      // )
                                    ]
                                ),
                              ),
                            ),
                            Card(
                              child: GestureDetector(
                                onTap: (){
                                  print("hello");
                                },
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/channels4_profile (2).jpg",
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      // InkWell(
                                      //   child: const FaIcon(
                                      //     FontAwesomeIcons.play,
                                      //     color: Colors.white,
                                      //   ),
                                      //   onTap: (){
                                      //     print("recently played");
                                      //   },
                                      // )
                                    ]
                                ),
                              ),
                            ),
                            Card(
                              child: GestureDetector(
                                onTap: (){
                                  print("hello");
                                },
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/channels4_profile (2).jpg",
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      // InkWell(
                                      //   child: const FaIcon(
                                      //     FontAwesomeIcons.play,
                                      //     color: Colors.white,
                                      //   ),
                                      //   onTap: (){
                                      //     print("recently played");
                                      //   },
                                      // )
                                    ]
                                ),
                              ),
                            ),
                            Card(
                              child: GestureDetector(
                                onTap: (){
                                  print("hello");
                                },
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/channels4_profile (2).jpg",
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      // InkWell(
                                      //   child: const FaIcon(
                                      //     FontAwesomeIcons.play,
                                      //     color: Colors.white,
                                      //   ),
                                      //   onTap: (){
                                      //     print("recently played");
                                      //   },
                                      // )
                                    ]
                                ),
                              ),
                            ),
                            Card(
                              child: GestureDetector(
                                onTap: (){
                                  print("hello");
                                },
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/channels4_profile (2).jpg",
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      // InkWell(
                                      //   child: const FaIcon(
                                      //     FontAwesomeIcons.play,
                                      //     color: Colors.white,
                                      //   ),
                                      //   onTap: (){
                                      //     print("recently played");
                                      //   },
                                      // )
                                    ]
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Container(
                            margin:EdgeInsets.only(left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: const Text("Music you'll love",
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
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Card(
                                          child: Stack(
                                              alignment:Alignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(5),
                                                  child: Image.asset("assets/images/telahun.jpg",
                                                    height: 165,
                                                    width: 165,
                                                    fit: BoxFit.fitWidth,
                                                  )
                                                ),InkWell(
                                                  child: const FaIcon(
                                                    FontAwesomeIcons.play,
                                                    color: Colors.white,
                                                  ),
                                                  onTap: (){
                                                    print("recently played");
                                                  },
                                                )
                                              ]
                                          )
                                      ),
                                      Card(
                                          child: Stack(
                                              alignment:Alignment.center,
                                              children: [
                                                ClipRRect(
                                                    borderRadius: BorderRadius.circular(5),
                                                    child: Image.asset("assets/images/telahun.jpg",
                                                      height: 165,
                                                      width: 165,
                                                      fit: BoxFit.fitWidth,
                                                    )
                                                ),InkWell(
                                                  child: const FaIcon(
                                                    FontAwesomeIcons.play,
                                                    color: Colors.white,
                                                  ),
                                                  onTap: (){
                                                    print("recently played");
                                                  },
                                                )
                                              ]
                                          )
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Card(
                                          child: Stack(
                                              alignment:Alignment.center,
                                              children: [
                                                ClipRRect(
                                                    borderRadius: BorderRadius.circular(5),
                                                    child: Image.asset("assets/images/telahun.jpg",
                                                      height: 165,
                                                      width: 165,
                                                      fit: BoxFit.fitWidth,
                                                    )
                                                ),InkWell(
                                                  child: const FaIcon(
                                                    FontAwesomeIcons.play,
                                                    color: Colors.white,
                                                  ),
                                                  onTap: (){
                                                    print("recently played");
                                                  },
                                                )
                                              ]
                                          )
                                      ),
                                      Card(
                                          child: Stack(
                                              alignment:Alignment.center,
                                              children: [
                                                ClipRRect(
                                                    borderRadius: BorderRadius.circular(5),
                                                    child: Image.asset("assets/images/telahun.jpg",
                                                      height: 165,
                                                      width: 165,
                                                      fit: BoxFit.fitWidth,
                                                    )
                                                ),InkWell(
                                                  child: const FaIcon(
                                                    FontAwesomeIcons.play,
                                                    color: Colors.white,
                                                  ),
                                                  onTap: (){
                                                    print("recently played");
                                                  },
                                                )
                                              ]
                                          )
                                      ),
                                    ],
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Container(
                              margin:EdgeInsets.only(left: 5),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("You might love",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  )
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          print('HI');
                                        },
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage('assets/images/lij_michael.jpg'),
                                          radius: 70,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text("Lij Michael",
                                        style: TextStyle(
                                            fontSize: 15
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          print('HI');
                                        },
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage('assets/images/lij_michael.jpg'),
                                          radius: 70,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text("Lij Michael",
                                          style: TextStyle(
                                              fontSize: 15
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          print('HI');
                                        },
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage('assets/images/lij_michael.jpg'),
                                          radius: 70,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text("Lij Michael",
                                          style: TextStyle(
                                              fontSize: 15
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          print('HI');
                                        },
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage('assets/images/lij_michael.jpg'),
                                          radius: 70,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text("Lij Michael",
                                          style: TextStyle(
                                              fontSize: 15
                                          )
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Container(
                              margin:EdgeInsets.only(left: 5),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("All categories",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                              )
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Card(
                                    child: GestureDetector(
                                      onTap: (){
                                      print('Hello');
                                      },
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.asset("assets/images/istockphoto-1197828995-612x612.jpg",
                                              width: 200,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Text("New Release",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: GestureDetector(
                                      onTap: (){
                                        print('Hello');
                                      },
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.asset("assets/images/istockphoto-1197828995-612x612.jpg",
                                              width: 200,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Text("Charts",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: GestureDetector(
                                      onTap: (){
                                        print('Hello');
                                      },
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.asset("assets/images/istockphoto-1197828995-612x612.jpg",
                                              width: 200,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Text("Essentials",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                    ),
                                    onPressed: () { },
                                    child: Text('Show all',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("New Release for you",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  )
                              )
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  Card(
                                      elevation: 0,
                                      child: Column(
                                        children: [
                                          Stack(
                                              alignment:Alignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(5),
                                                  child: Image.asset("assets/images/teddy.jpg",
                                                    height: 150,
                                                    width: 150,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                                InkWell(
                                                  child: const FaIcon(
                                                    FontAwesomeIcons.play,
                                                    color: Colors.white,
                                                  ),
                                                  onTap: (){
                                                    print("recently played");
                                                  },
                                                )
                                              ]
                                          ),
                                          SizedBox(height: 10),
                                          Text("Ethiopia",
                                            style: TextStyle(
                                                fontSize: 16
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text("Teddy Afro",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                  Card(
                                      elevation: 0,
                                      child: Column(
                                        children: [
                                          Stack(
                                              alignment:Alignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(5),
                                                  child: Image.asset("assets/images/teddy.jpg",
                                                    height: 150,
                                                    width: 150,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                                InkWell(
                                                  child: const FaIcon(
                                                    FontAwesomeIcons.play,
                                                    color: Colors.white,
                                                  ),
                                                  onTap: (){
                                                    print("recently played");
                                                  },
                                                )
                                              ]
                                          ),
                                          SizedBox(height: 10),
                                          Text("Ethiopia",
                                            style: TextStyle(
                                                fontSize: 16
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text("Teddy Afro",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                  Card(
                                      elevation: 0,
                                      child: Column(
                                        children: [
                                          Stack(
                                              alignment:Alignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(5),
                                                  child: Image.asset("assets/images/teddy.jpg",
                                                    height: 150,
                                                    width: 150,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                                InkWell(
                                                  child: const FaIcon(
                                                    FontAwesomeIcons.play,
                                                    color: Colors.white,
                                                  ),
                                                  onTap: (){
                                                    print("recently played");
                                                  },
                                                )
                                              ]
                                          ),
                                          SizedBox(height: 10),
                                          Text("Ethiopia",
                                            style: TextStyle(
                                                fontSize: 16
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text("Teddy Afro",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15
                                            ),
                                          )
                                        ],
                                      )

                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Container(
                              margin:EdgeInsets.only(left: 5),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Geners",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                              )
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Card(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            print("recently played");
                                          },
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.asset("assets/images/37723595.jpg",
                                              width: 200,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text("R&B",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Card(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            print("recently played");
                                          },
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.asset("assets/images/37723595.jpg",
                                              width: 200,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text("French Music",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Card(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            print("recently played");
                                          },
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.asset("assets/images/37723595.jpg",
                                              width: 200,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text("Pop",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                    ),
                                    onPressed: () { },
                                    child: Text('Show all',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
        ),
    )
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