import 'package:flutter/material.dart';

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
                        backgroundColor: Colors.transparent,
                        title: Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                  body: SafeArea(
                    child: Container(
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
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Dark Mode',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
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
// import 'package:awud_app/class/language.dart';
// import 'package:awud_app/localization/language_constants.dart';
// import 'package:awud_app/main.dart';
// import 'package:flutter/material.dart';
//
// class SettingsPage extends StatefulWidget {
//   SettingsPage({Key? key}) : super(key: key);
//
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }
//
// class _SettingsPageState extends State<SettingsPage> {
//   void _changeLanguage(Language language) async {
//     Locale _locale = await setLocale(language.languageCode);
//     navBar.setLocale(context, _locale);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(getTranslated(context, 'settings')!),
//       ),
//       body: Container(
//         child: Center(
//             child: DropdownButton<Language>(
//               iconSize: 30,
//               hint: Text(getTranslated(context, 'change_language')!),
//               onChanged: (Language? language) {
//                 _changeLanguage(language!);
//               },
//               items: Language.languageList()
//                   .map<DropdownMenuItem<Language>>(
//                     (e) => DropdownMenuItem<Language>(
//                   value: e,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       Text(
//                         e.flag,
//                         style: TextStyle(fontSize: 30),
//                       ),
//                       Text(e.name)
//                     ],
//                   ),
//                 ),
//               )
//                   .toList(),
//             )),
//       ),
//     );
//   }
//}