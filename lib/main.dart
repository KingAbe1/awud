import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import "package:awud_app/pages/music.dart";
import "package:awud_app/pages/podcast.dart";
import "package:awud_app/pages/audiobook.dart";
import "package:awud_app/pages/favuorite.dart";
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(navBar());
}

class navBar extends StatefulWidget {
  @override
  _navBarState createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  int _index = 0;

  final screens = [
    const Music(),
    const Podcast(),
    const Audiobook(),
    const Favuorite()
  ];

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: PageView.builder(
            itemCount: 4,
            controller: controller,
              onPageChanged: (page){
              setState(() {
                _index = page;
              });
              },
              itemBuilder: (context,position){
                return Container(
                    child: screens[_index],
                );
              }
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(5),
            child: GNav(
              gap: 8,
              activeColor: Colors.white,
              // backgroundColor: Colors.white,
              tabBackgroundColor: const Color.fromRGBO(248, 135, 88, 1),
              // tabBackgroundColor: const Color.fromRGBO(253, 157, 92, 1),
              // tabBackgroundColor: const Color.fromRGBO(234, 92, 78, 1),
              padding: const EdgeInsets.all(10),
              tabs: const [
                GButton(
                  icon: FeatherIcons.music,
                  text: "Music",
                ),
                GButton(
                    icon:FeatherIcons.mic,
                    text: "Podcast"
                ),
                GButton(
                    icon:FeatherIcons.bookOpen,
                    text: "Audiobook"
                ),
                GButton(
                    icon: FeatherIcons.archive,
                    text: "Library"
                ),
              ],
              selectedIndex: _index,
              onTabChange: (index){
                setState(() {
                  _index = index;
                });
                controller.jumpToPage(index);
              },
            ),
          ),
        )
    );
  }
}