import 'package:flutter/material.dart';
import 'search.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Audiobook extends StatelessWidget {
  const Audiobook({Key? key}) : super(key: key);

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
                            elevation: 0,
                              child: Column(
                              children: [
                                Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/61wH0gzw3FL.jpg",
                                            height: 150,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                ),
                                SizedBox(height: 5),
                                Text("Ethiopian love",
                                style: TextStyle(
                                  fontSize: 16
                                ),
                                ),
                                SizedBox(height: 5),
                                Text("Abiy Ahmed",
                                  style: TextStyle(
                                      fontSize: 15,
                                    color: Colors.black45
                                  ),
                                )
                                ]
                              )
                          ),
                          Card(
                            elevation: 0,
                              child: Column(
                                children: [
                                Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/53713557._SY475_.jpg",
                                            height: 150,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                ),
                                  SizedBox(height: 5),
                                  Text("Ethiopian love",
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text("Abiy Ahmed",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black45
                                    ),
                                  )
                            ]
                              )
                          ),
                          Card(
                            elevation: 0,
                              child: Column(
                                children: [
                                Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/61d3aHOsSuL.jpg",
                                            height: 150,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                ),
                              SizedBox(height: 5),
                              Text("Ethiopian love",
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Abiy Ahmed",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black45
                                ),
                              )
                              ]
                              )

                          ),
                          Card(
                            elevation: 0,
                              child: Column(
                                children: [
                                Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/9781787388116.jpg",
                                            height: 150,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                ),
                              SizedBox(height: 5),
                              Text("Ethiopian love",
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Abiy Ahmed",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black45
                                ),
                              )
                                ]
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20,left: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Philosophy",
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
                            elevation: 0,
                              child: Column(
                                children: [
                                Stack(
                                    alignment:Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          print("recently played");
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: Image.asset("assets/images/9780520224797.jpg",
                                            height: 150,
                                            width: 100,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ]
                                ),
                                  SizedBox(height: 5),
                                  Text("Ethiopian love",
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text("Abiy Ahmed",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black45
                                    ),
                                  )
                      ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/9780520224797.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/9780520224797.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/9780520224797.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/9780520224797.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/9780520224797.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
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
                        "Fiction",
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
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/53713557._SY475_.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/53713557._SY475_.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/53713557._SY475_.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/53713557._SY475_.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/53713557._SY475_.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/53713557._SY475_.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
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
                        "Politics",
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
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/61wH0gzw3FL.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/61wH0gzw3FL.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/61wH0gzw3FL.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/61wH0gzw3FL.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/61wH0gzw3FL.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/61wH0gzw3FL.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
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
                    margin: EdgeInsets.only(top: 20,left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Science and technology",
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
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/61d3aHOsSuL.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/61d3aHOsSuL.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/61d3aHOsSuL.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/61d3aHOsSuL.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/61d3aHOsSuL.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Card(
                              elevation: 0,
                              child: Column(
                                  children: [
                                    Stack(
                                        alignment:Alignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("recently played");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset("assets/images/61d3aHOsSuL.jpg",
                                                height: 150,
                                                width: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        ]
                                    ),
                                    SizedBox(height: 5),
                                    Text("Ethiopian love",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Abiy Ahmed",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45
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
                  )
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