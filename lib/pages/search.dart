import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
              "Search",
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
                            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new Search())),
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
                            print("recently played");
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
                            print("recently played");
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
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      TextField(
                        onTap: (){
                          print("pp");
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0)
                            ),
                          ),
                          prefixIcon: Icon(
                              FeatherIcons.search,
                            // color: Color.fromRGBO(248, 135, 88, 1),
                          ),
                          hintText: "Artist, podcast & audiobook",
                          hintStyle: TextStyle(
                            // color: Color.fromRGBO(248, 135, 88, 1),
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
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              width: 166,
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
                                              width: 166,
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
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              width: 166,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text("Rock",
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
                                              width: 166,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text("Alternative",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              width: 166,
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
                                              width: 166,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text("Rap",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Container(
                          margin:EdgeInsets.only(left: 5),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("All podcast categories",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                          )
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
                                      alignment: Alignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            print("recently played");
                                          },
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.asset("assets/images/37723595.jpg",
                                              width: 166,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text("Entertainment",
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
                                              width: 166,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text("Technology",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              width: 166,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text("Art",
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
                                              width: 166,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text("Personal Development",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              width: 166,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text("College",
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
                                              width: 166,
                                              height: 80,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text("Rap",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Container(
                                margin:EdgeInsets.only(left: 5),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("All audiobook categories",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                )
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
                                            alignment: Alignment.center,
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  print("recently played");
                                                },
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(5),
                                                  child: Image.asset("assets/images/37723595.jpg",
                                                    width: 166,
                                                    height: 80,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Text("Philosopy",
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
                                                    width: 166,
                                                    height: 80,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Text("Fiction",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                    width: 166,
                                                    height: 80,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Text("Politics",
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
                                                    width: 166,
                                                    height: 80,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Text("Technology",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ),
      ),
    )
      )
    );
  }
}
