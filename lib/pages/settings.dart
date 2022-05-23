
import 'package:awud_app/pages/theme.dart';
import 'package:awud_app/widget/ChangeThemeButtonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(),
      builder: (context,_){
        final themeProvider = Provider.of<ThemeProvider>(context);
        // print(themeProvider.themeMode);
        return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
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
                              color: Theme.of(context).primaryColor,
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
                                  ChangeThemeButtonWidget(),
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
      },
    );
  }
}