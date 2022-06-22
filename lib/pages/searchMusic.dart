import 'package:awud_app/API/music_api.dart';
import 'package:awud_app/class/playerPageMusic.dart';
import 'package:awud_app/main.dart';
import 'package:awud_app/model/musicModel.dart';
import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate{
  List<String> searchResults = [];

  BooksApi _userList = BooksApi();


  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    onPressed: ()=>close(context, null),
    icon: const Icon(Icons.arrow_back),
  );

  @override
  List<Widget> ? buildActions(BuildContext context) => [
    IconButton(
      onPressed: (){
        if(query.isEmpty){
          close(context, null);
        }else{
          query = '';
        }
      },
      icon: const Icon(Icons.clear),
    )
  ];

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<FetchedMusic>>(
        future: _userList.getuserList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // print('No Data');
            return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color.fromRGBO(248, 135, 88, 1),
                  ),
                )
            );
          }
          List<FetchedMusic>? data = snapshot.data;
          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      SizedBox(height: 70),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network('http://$IpAddresse:8000${data?[index].image}')
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: (){
                          late List pl = [data![index].path];
                          late List image = [data![index].image];

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => playerPage(value: (data![index].id).toString(),epi: (data[index].image).toString(),pl: pl,image: image,title: (data[index].title).toString()),
                          ));
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${data?[index].title}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${data?[index].artist_name}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                );
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context){
    return Center(
      child: Text('Search Music'),
    );
  }
}