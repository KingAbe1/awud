import 'dart:convert';
import 'package:awud_app/class/audio_fileMusic.dart';
import 'package:awud_app/class/infoPageMusic.dart';
import 'package:awud_app/class/playerPageMusic.dart';
import 'package:awud_app/model/skeleton.dart';
import 'package:awud_app/pages/artistPage.dart';
import 'package:awud_app/pages/category.dart';
import 'package:awud_app/pages/searchMusic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shimmer/shimmer.dart';
import '../main.dart';
import 'albumPage.dart';
import 'albumPage.dart';
import 'notifications.dart';
import 'settings.dart';
import 'package:http/http.dart' as http;

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  List? music;
  List? album;
  List? newMusic;
  List? artist;
  List? playlist = [];
  List? image = [];
  List? artistName = [];
  List? musicTitle = [];
  // String? singleTrackName;

  Future getPodcast() async{
    var response = await http.get(Uri.parse('http://$IpAddresse:8000/music/'));

    if(response.statusCode == 200){
      music = json.decode(response.body);

      for(int i=0;i<music!.length;i++){
        playlist!.add("${music![i]['path']}");
        image!.add("${music![i]['image']}");
        artistName!.add("${music![i]['artist_name']}");
        musicTitle!.add("${music![i]['title']}");
        // singleTrackName =
      }

      return music;
    }
  }

  Future getAlbum() async{
    var response = await http.get(Uri.parse('http://$IpAddresse:8000/album/'));

    if(response.statusCode == 200){
      album = json.decode(response.body);
      return album;
    }
  }

  Future getArtist() async{
    var response = await http.get(Uri.parse('http://$IpAddresse:8000/music/user'));

    if(response.statusCode == 200){
      artist = json.decode(response.body);
      return artist;
    }
  }

  Future getNewMusic() async{
    var response = await http.get(Uri.parse('http://$IpAddresse:8000/music/user/?new=new'));

    if(response.statusCode == 200){
      newMusic = json.decode(response.body);

        for(int i=0;i<newMusic!.length;i++){
          playlist!.add("${newMusic![i]['path']}");
          image!.add(newMusic![i]['image']);
          artistName!.add("${newMusic![i]['artist_name']}");
          musicTitle!.add("${newMusic![i]['title']}");
        }

      return newMusic;
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
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light
          ),
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
                      title: Text(
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
                            margin: const EdgeInsets.only(top: 20,left: 5),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Musics',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
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
                                      child: Column(
                                        children: [
                                          Row(
                                           children: [
                                             Column(
                                               children: const [
                                                 Skelton(
                                                   height: 100,
                                                   width: 100,
                                                 ),
                                                 SizedBox(width: 110),
                                                 SizedBox(height: 10),
                                                 Skelton(width: 90),
                                                 SizedBox(height: 10),
                                                 Skelton(width: 90),
                                               ],
                                             ),
                                             Column(
                                               children: const [
                                                 Skelton(
                                                   height: 100,
                                                   width: 100,
                                                 ),
                                                 SizedBox(width: 110),
                                                 SizedBox(height: 10),
                                                 Skelton(width: 90),
                                                 SizedBox(height: 10),
                                                 Skelton(width: 90),
                                               ],
                                             ),
                                             Column(
                                               children: const [
                                                 Skelton(
                                                   height: 100,
                                                   width: 100,
                                                 ),
                                                 SizedBox(width: 110),
                                                 SizedBox(height: 10),
                                                 Skelton(width: 90),
                                                 SizedBox(height: 10),
                                                 Skelton(width: 90),
                                               ],
                                             )
                                           ],
                                          )
                                        ],
                                      ),
                                  );
                                }else{
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: music == null ? 0: music!.length,
                                      itemBuilder: (BuildContext context, int index){
                                        return Container(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (context) => MyAppp(id: music![index]['_id'].toString(), current: music![index]['path'].toString(), playlist: playlist, image: image,currentImage: music![index]['image'].toString(),title: music![index]['title'].toString(),artistName: artistName,musicTitle:musicTitle,singleTrackName: music![index]['title'].toString(),singleArtistName: music![index]['artist_name'].toString())
                                                    ));
                                                  },
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(5),
                                                      child: Image.network(
                                                        'http://$IpAddresse:8000${music![index]['image']}',
                                                        height: 100,
                                                        width: 100,
                                                        fit: BoxFit.fill,
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  music![index]['title'],
                                                  style: const TextStyle(
                                                      fontSize: 15
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  music![index]['artist_name'],
                                                  style: const TextStyle(
                                                      color: Colors.grey
                                                  ),
                                                ),
                                                const SizedBox(width: 110)
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
                            margin: const EdgeInsets.only(top: 20,left: 5),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Artist',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          Container(
                              height: 140,
                              margin: const EdgeInsets.only(top: 10),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    FutureBuilder(
                                      future: getArtist(),
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
                                              scrollDirection: Axis.horizontal,
                                              itemCount: artist == null ? 0: artist!.length,
                                              itemBuilder: (BuildContext context, int x){
                                                return Container(
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap:(){
                                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => albumPage(name: artist![x]['artist_name'].toString(),image: artist![x]['image'].toString())));
                                                        },
                                                        child: ClipOval(
                                                          child: SizedBox.fromSize(
                                                            size: const Size.fromRadius(70), // Image radius
                                                            child: Image.network("http://$IpAddresse:8000${artist![x]['image']}", fit: BoxFit.cover),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 20)
                                                    ],
                                                  ),
                                                );
                                              }
                                          );
                                        }
                                      },
                                    )
                                  ],
                                ),
                              )
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20,left: 5),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Album',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10,left: 15),
                            height: 160,
                            child: FutureBuilder(
                              future: getAlbum(),
                              builder: (context,snapshot){
                                if(snapshot.connectionState == ConnectionState.none && snapshot.hasData == null){
                                  return Container(
                                    child: const Text('No Data'),
                                  );
                                }
                                else if(snapshot.connectionState == ConnectionState.waiting){
                                  return Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: const [
                                                Skelton(
                                                  height: 100,
                                                  width: 100,
                                                ),
                                                SizedBox(width: 110),
                                                SizedBox(height: 10),
                                                Skelton(width: 90),
                                                SizedBox(height: 10),
                                                Skelton(width: 90),
                                              ],
                                            ),
                                            Column(
                                              children: const[
                                                Skelton(
                                                  height: 100,
                                                  width: 100,
                                                ),
                                                SizedBox(width: 110),
                                                SizedBox(height: 10),
                                                Skelton(width: 90),
                                                SizedBox(height: 10),
                                                Skelton(width: 90),
                                              ],
                                            ),
                                            Column(
                                              children: const[
                                                Skelton(
                                                  height: 100,
                                                  width: 100,
                                                ),
                                                SizedBox(width: 110),
                                                SizedBox(height: 10),
                                                Skelton(width: 90),
                                                SizedBox(height: 10),
                                                Skelton(width: 90),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }else{
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: album == null ? 0: album!.length,
                                      itemBuilder: (BuildContext context, int index){
                                        return Container(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context) => albumPages(name:album![index]['artist_name'].toString(),id: album![index]['_id'].toString(),image: album![index]['image'].toString()),
                                                    ));
                                                  },
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(5),
                                                      child: Image.network(
                                                        'http://$IpAddresse:8000${album![index]['image']}',
                                                        height: 100,
                                                        width: 100,
                                                        fit: BoxFit.fill,
                                                      )
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  album![index]['album_title'],
                                                  style: const TextStyle(
                                                      fontSize: 15
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  album![index]['artist_name'],
                                                  style: const TextStyle(
                                                      color: Colors.grey
                                                  ),
                                                ),
                                                const SizedBox(width: 110)
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
                            margin: const EdgeInsets.only(top: 20,left: 5),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('New Release Music',
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
                              future: getNewMusic(),
                              builder: (context,snapshot){
                                if(snapshot.connectionState == ConnectionState.none && snapshot.hasData == null){
                                  return Container(
                                    child: Text('No Data'),
                                  );
                                }
                                else if(snapshot.connectionState == ConnectionState.waiting){
                                  return Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Skelton(
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                  SizedBox(width: 110),
                                                  SizedBox(height: 10),
                                                  Skelton(width: 90),
                                                  SizedBox(height: 10),
                                                  Skelton(width: 90),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Skelton(
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                  SizedBox(width: 110),
                                                  SizedBox(height: 10),
                                                  Skelton(width: 90),
                                                  SizedBox(height: 10),
                                                  Skelton(width: 90),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Skelton(
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                  SizedBox(width: 110),
                                                  SizedBox(height: 10),
                                                  Skelton(width: 90),
                                                  SizedBox(height: 10),
                                                  Skelton(width: 90),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                  );
                                }else{
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: newMusic == null ? 0: newMusic!.length,
                                      itemBuilder: (BuildContext context, int index){
                                        return Container(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    // print(image);
                                                    // print(newMusic![index]['image']);
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (context) => MyAppp(id: newMusic![index]['_id'].toString(), current: newMusic![index]['path'].toString(), playlist: playlist, image: image, currentImage: newMusic![index]['image'].toString(), title: newMusic![index]['title'].toString(),artistName: artistName,musicTitle: musicTitle,singleTrackName: newMusic![index]['title'].toString(),singleArtistName: newMusic![index]['artist_name'].toString())
                                                    ));
                                                  },
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(5),
                                                      child: Image.network(
                                                        'http://$IpAddresse:8000${newMusic![index]['image']}',
                                                        height: 100,
                                                        width: 100,
                                                        fit: BoxFit.fill,
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  newMusic![index]['title'],
                                                  style: TextStyle(
                                                      fontSize: 15
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  newMusic![index]['artist_name'],
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
                                        displayCategoryPage("Tezeta");
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
                                        child: Center(child: Text('Tezeta',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        displayCategoryPage("Bati");
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
                                        child: Center(child: Text('Bati',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),),
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
                                        displayCategoryPage("Ambassel");
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
                                        child: Center(child: Text('Ambassel',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        displayCategoryPage("Zemenawi");
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
                                        child: Center(child: Text('Zemenawi',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),),
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

  void displayCategoryPage(String categoryName) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => categoryList(name: categoryName.toString()),));
  }
}