import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'search.dart';

class Podcast extends StatelessWidget {
  const Podcast({Key? key}) : super(key: key);

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
                    children: [
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
                        child: Icon(
                          FeatherIcons.bell,
                          color: Color.fromRGBO(248, 135, 88, 1),
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          FeatherIcons.settings,
                          color: Color.fromRGBO(248, 135, 88, 1),
                          size: 20,
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
                          "Recent",
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
                              child: Stack(
                                  alignment:Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        print("recently played");
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/channels4_profile (1).jpg",
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )
                                  ]
                              ),
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/channels4_profile (1).jpg",
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/channels4_profile (1).jpg",
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/channels4_profile (1).jpg",
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/channels4_profile (1).jpg",
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/channels4_profile (1).jpg",
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Entertainment",
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
                              child: Stack(
                                  alignment:Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        print("recently played");
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/11222386-1607743857708-f01fe92b20c92.jpg",
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )
                                  ]
                              ),
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/11222386-1607743857708-f01fe92b20c92.jpg",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/11222386-1607743857708-f01fe92b20c92.jpg",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/11222386-1607743857708-f01fe92b20c92.jpg",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/11222386-1607743857708-f01fe92b20c92.jpg",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/11222386-1607743857708-f01fe92b20c92.jpg",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Technology",
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
                              child: Stack(
                                  alignment:Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        print("recently played");
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/dWDbCJy7_400x400.jpg",
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )
                                  ]
                              ),
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/dWDbCJy7_400x400.jpg",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/dWDbCJy7_400x400.jpg",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/dWDbCJy7_400x400.jpg",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/dWDbCJy7_400x400.jpg",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/dWDbCJy7_400x400.jpg",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                )
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "All categories",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Card(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        print("recently played");
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/11222386-1607743857708-f01fe92b20c92.jpg",
                                          height: 70,
                                          width: 164,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Text("Entertainment",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        print("recently played");
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/download.jpg",
                                          height: 70,
                                          width: 164,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Text("Art",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Card(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        print("recently played");
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/channels4_profile (1).jpg",
                                          height: 70,
                                          width: 164,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Text("Personal Development",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        print("recently played");
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/dWDbCJy7_400x400.jpg",
                                          height: 70,
                                          width: 164,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Text("College",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
                              print("view all");
                            },
                            child: Text('View all',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16
                            ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "Podcast by duration",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Card(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        print("recently played");
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/Untitled.png",
                                          height: 70,
                                          width: 164,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Text("< 10 min",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        print("recently played");
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/Untitled.png",
                                          height: 70,
                                          width: 164,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Text("= 20 min",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Card(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        print("recently played");
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/Untitled.png",
                                          height: 70,
                                          width: 164,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Text("= 30 min",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        print("recently played");
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset("assets/images/Untitled.png",
                                          height: 70,
                                          width: 164,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Text("> 40 min",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Podcast by language",
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
                        margin: const EdgeInsets.only(top: 10,left: 5),
                        child: Row(
                          children: [
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/emotive-language.png",
                                            height: 70,
                                            width: 164,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      Text("English",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/emotive-language.png",
                                            height: 70,
                                            width: 164,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      Text("Amharic",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/emotive-language.png",
                                            height: 70,
                                            width: 164,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      Text("Welyta",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ]
                                )
                            ),
                            Card(
                                child: Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/emotive-language.png",
                                            height: 70,
                                            width: 164,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      Text("Tigray",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ]
                                )
                            ),
                          ],
                        ),
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
