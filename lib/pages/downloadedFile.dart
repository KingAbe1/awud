import 'package:awud_app/class/audio_fileDownlaod.dart';
import 'package:flutter/material.dart';

class downloadedFile extends StatefulWidget {
  const downloadedFile({Key? key}) : super(key: key);

  @override
  _downloadedFileState createState() => _downloadedFileState();
}

class _downloadedFileState extends State<downloadedFile> {
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
                      title: Center(
                        child: Text(
                          'Downloaded Music',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  )
                ],
                body: Container(
                    color: Colors.white,
                    child: MyAppp(),
                ),
              ),
            )
        )
    );
  }
}
