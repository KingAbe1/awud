import 'dart:ui';
import 'package:awud_app/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import "package:awud_app/pages/music.dart";
import "package:awud_app/pages/podcast.dart";
import "package:awud_app/pages/audiobook.dart";
import "package:awud_app/pages/library.dart";
import 'package:google_nav_bar/google_nav_bar.dart';


var IpAddresse = "192.168.43.127";

void main() async{
  num verify = 0;
  if(verify == 0){
    runApp(login());
  }else{
    runApp(navBar());
  }
}

class navBar extends StatefulWidget {
  const navBar({Key? key}) : super(key: key);
  @override
  _navBarState createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  int _index = 0;
  int verifyer = 0;

  final screens = [
    // const login(),
    const Music(),
    const Podcast(),
    const Audiobook(),
    const Favuorite()
  ];


  PageController controller = PageController();
  // late Locale _locale;
  // setLocale(Locale locale) {
  //   setState(() {
  //     _locale = locale;
  //   });
  // }
  // @override
  // void didChangeDependencies() {
  //   getLocale().then((locale) {
  //     setState(() {
  //       this._locale = locale;
  //     });
  //   });
  //   super.didChangeDependencies();
  // }
  // @override
  // void init(){
  //   super.initState();
  //   // didChangeDependencies() {
  //   //   getLocale().then((locale) {
  //   //     setState(() {
  //   //       this._locale = locale;
  //   //     });
  //   //   });
  //   //   super.didChangeDependencies();
  //   // }
  //   getLocale().then((locale) {
  //     setState(() {
  //       _locale = locale;
  //     });
  //   });
  //    }
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          // locale: _locale,
          // supportedLocales: [
          //   Locale("en", "US"),
          //   Locale("am", "ET"),
          //   Locale("om", "ET"),
          //   Locale("ti", "ET")
          // ],
          // localizationsDelegates: [
          //   DemoLocalization.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          // localeResolutionCallback: (locale, supportedLocales) {
          //   for (var supportedLocale in supportedLocales) {
          //     if (supportedLocale.languageCode == locale!.languageCode &&
          //         supportedLocale.countryCode == locale.countryCode) {
          //       return supportedLocale;
          //     }
          //   }
          //   return supportedLocales.first;
          // },

          home: Scaffold(
            body: PageView.builder(
                itemCount: 5,
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
                tabs:  [
                  GButton(
                    icon: FeatherIcons.music,
                   // text: getTranslated(context, 'mu')!,
                    text: 'Music',
                  ),
                  GButton(
                      icon:FeatherIcons.mic,
                     // text: getTranslated(context, 'pod')!
                    text: 'Podcast',
                  ),
                  GButton(
                      icon:FeatherIcons.bookOpen,
                      //text: getTranslated(context, 'aud')!
                    text: 'Audiobook',
                  ),
                  GButton(
                      icon: FeatherIcons.archive,
                     // text: getTranslated(context, 'lib')!
                    text: 'Library',
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