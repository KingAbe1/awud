import 'dart:convert';
import 'package:audio_session/audio_session.dart';
import 'package:awud_app/class/downloadPage.dart';
import 'package:awud_app/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:just_audio/just_audio.dart';
import '../pages/common.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:sliding_sheet/sliding_sheet.dart';


class MyAppp extends StatefulWidget {
  List? playlist;
  String current;
  var id;
  final String image;
  final String title;
  List? artistName;
  List? musicTitle;
  final String singleTrackName;
  final String singleArtistName;

  MyAppp({Key? key,required this.id,required this.current,required this.playlist, required this.image, required this.title, required this.artistName, required this.musicTitle, required this.singleTrackName, required this.singleArtistName}) : super(key: key);

  @override
  MyApppState createState() => MyApppState(curr:current,pl:playlist);
}

class MyApppState extends State<MyAppp> with WidgetsBindingObserver {
  String textFile = 'Empty';
  var fetchedMusic;
  String? path;

  late List? pl;
  late String curr;
  MyApppState({required this.curr,this.pl});
  late AudioPlayer _player;


  List<AudioSource> plls(){
    var list=<AudioSource>[];

    list.add(AudioSource.uri(Uri.parse("http://${IpAddresse}:8000${widget.current}"), tag: AudioMetadata(
      album: widget.singleArtistName,
      title: widget.singleTrackName,
      artwork: "http://$IpAddresse:8000${widget.image}",
    ))
    );

    for (int t=0;t<widget.playlist!.length;t++)
    {
      var url = "http://${IpAddresse}:8000${widget.playlist![t]}";
      list.add(AudioSource.uri(Uri.parse(url), tag: AudioMetadata(
        album: widget.artistName![t],
        title: widget.musicTitle![t + 1],
        artwork: "http://$IpAddresse:8000${widget.image}",
      ),));
    }
    return list;
  }

  late var _playlist = ConcatenatingAudioSource(children:plls());

  @override
  void initState() {
    // print('0000000000000000000000000000000');
    // print(widget.musicTitle);
    int i;
    for(i = 0; i < widget.playlist!.length; i++){
      if((widget.playlist!.contains(widget.current))){
        widget.playlist!.remove(widget.current);
      }
    }

    // print(widget.current);
    // print(widget.playlist);

    super.initState();
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    _player = AudioPlayer();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  Future<void> _init() async {
    // print(widget.playlist);
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });
    try {
      // Preloading audio is not currently supported on Linux.
      await _player.setAudioSource( _playlist,
          preload: kIsWeb || defaultTargetPlatform != TargetPlatform.linux);
    } catch (e) {
      // Catch load errors: 404, invalid url...
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      // _player.stop();
    }
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
              (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    // List? pl= widget.playlist;
    // print(pl);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: StreamBuilder<SequenceState?>(
                  stream: _player.sequenceStateStream,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    if (state?.sequence.isEmpty ?? true) {
                      return const SizedBox();
                    }
                    final metadata = state!.currentSource!.tag as AudioMetadata;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            Center(child: Image.network(metadata.artwork)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 45,top: 25),
                          child: Row(
                            children: [
                              //Icon(FeatherIcons.heart,color: Colors.black,),
                              SizedBox(width: 60),
                              GestureDetector(
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (context) => DownloadingDialog(path:"${path}/${fetchedMusic.path}",file_name: widget.singleTrackName),
                                    );
                                  },
                                  child: Icon(FeatherIcons.download,color: Colors.black,)
                              ),
                              SizedBox(width: 60),
                              GestureDetector(
                                  onTap: (){
                                    Share.share('${widget.title}\n${widget.singleTrackName}', subject: 'Look what I made!');
                                  },
                                  child: Icon(FeatherIcons.share2,color: Colors.black,
                                  )
                              ),
                              SizedBox(width: 60),
                              // GestureDetector(
                              //     onTap: (){
                              //       openAlert();
                              //     },
                              //     child: Icon(FeatherIcons.plus,color: Colors.black,
                              //     )
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        // TextButton(onPressed: () async{
                        //   String response;
                        //   response = await rootBundle.loadString('assets/text/text.txt');
                        //   textFile = response;
                        //   showTest();
                        // }, child: Text('Lyrics',style: TextStyle(fontSize: 20,color: Colors.black))),
                        SizedBox(height: 5),
                        Text(metadata.album,
                            style: Theme.of(context).textTheme.headline6),
                        Text(metadata.title),
                      ],
                    );
                  },
                ),
              ),
              ControlButtons(_player),
              StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;
                  return SeekBar(
                    duration: positionData?.duration ?? Duration.zero,
                    position: positionData?.position ?? Duration.zero,
                    bufferedPosition:
                    positionData?.bufferedPosition ?? Duration.zero,
                    onChangeEnd: (newPosition) {
                      _player.seek(newPosition);
                    },
                  );
                },
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  StreamBuilder<LoopMode>(
                    stream: _player.loopModeStream,
                    builder: (context, snapshot) {
                      final loopMode = snapshot.data ?? LoopMode.off;
                      const icons = [
                        Icon(Icons.repeat, color: Colors.grey),
                        Icon(Icons.repeat, color: Colors.orange),
                        Icon(Icons.repeat_one, color: Colors.orange),
                      ];
                      const cycleModes = [
                        LoopMode.off,
                        LoopMode.all,
                        LoopMode.one,
                      ];
                      final index = cycleModes.indexOf(loopMode);
                      return IconButton(
                        icon: icons[index],
                        onPressed: () {
                          _player.setLoopMode(cycleModes[
                          (cycleModes.indexOf(loopMode) + 1) %
                              cycleModes.length]);
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: Text(
                      "Playlist",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  StreamBuilder<bool>(
                    stream: _player.shuffleModeEnabledStream,
                    builder: (context, snapshot) {
                      final shuffleModeEnabled = snapshot.data ?? false;
                      return IconButton(
                        icon: shuffleModeEnabled
                            ? const Icon(Icons.shuffle, color: Colors.orange)
                            : const Icon(Icons.shuffle, color: Colors.grey),
                        onPressed: () async {
                          final enable = !shuffleModeEnabled;
                          if (enable) {
                            await _player.shuffle();
                          }
                          await _player.setShuffleModeEnabled(enable);
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 240.0,
                child: StreamBuilder<SequenceState?>(
                  stream: _player.sequenceStateStream,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    final sequence = state?.sequence ?? [];
                    return ReorderableListView(
                      onReorder: (int oldIndex, int newIndex) {
                        if (oldIndex < newIndex) newIndex--;
                        _playlist.move(oldIndex, newIndex);
                      },
                      children: [
                        for (var i = 0; i < sequence.length; i++)
                          Dismissible(
                            key: ValueKey(sequence[i]),
                            background: Container(
                              color: Colors.redAccent,
                              alignment: Alignment.centerRight,
                              child: const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.delete, color: Colors.white),
                              ),
                            ),
                            onDismissed: (dismissDirection) {
                              _playlist.removeAt(i);
                            },
                            child: Material(
                              color: i == state!.currentIndex
                                  ? Colors.grey.shade300
                                  : null,
                              child: ListTile(
                                title: Text(sequence[i].tag.title as String),
                                onTap: () {
                                  _player.seek(Duration.zero, index: i);
                                },
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   onPressed: () {
        //     _playlist.add(AudioSource.uri(
        //       Uri.parse("asset:///audio/nature.mp3"),
        //       tag: AudioMetadata(
        //         album: "Public Domain",
        //         title: "Nature Sounds ${++_addedCount}",
        //         artwork:
        //         "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
        //       ),
        //     ));
        //   },
        // ),
      ),
    );
  }
  Future<String?> openAlert() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select a playlist',style: TextStyle(fontSize: 25)),
        content:Column(
          children: [
            Align(alignment: Alignment.centerLeft,child: Text('Cool playlist',style: TextStyle(fontSize: 17))),
            SizedBox(height: 5),
            Align(alignment: Alignment.centerLeft,child: Text('10',style: TextStyle(fontSize: 15,color: Colors.grey)))
          ],
        ),
        actions: [
          TextButton(onPressed: (){
            createPlaylist();
          },
              child: Text('New Playlist',style: TextStyle(fontSize: 18))
          )
        ],
      )
  );
  Future<String?> createPlaylist() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Playlist name'),
        content: TextField(
          // controller: playlistnameController,
          autofocus: true,
          decoration: InputDecoration(
            hintText:'Enter your playlist name',
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            // submit();
          },
              child: Text('CREATE',style: TextStyle(fontSize: 18))
          )
        ],
      )
  );

  Future showTest() => showSlidingBottomSheet(
      context,
      builder: (context) => SlidingSheetDialog(
        snapSpec: SnapSpec(snappings: [0.4, 0.7]),
        builder: buildSheet,
      )
  );

  Widget buildSheet(context, state) => Material(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Center(
            child: Text(textFile,style: TextStyle(fontSize: 18)),
          ),
        )
      ],
    ),
  );
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.0,
              max: 1.0,
              value: player.volume,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            icon: const Icon(Icons.skip_previous),
            onPressed: player.hasPrevious ? player.seekToPrevious : null,
          ),
        ),
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: const CircularProgressIndicator(),
              );
            } else if (playing != true) {
              return IconButton(
                icon: const Icon(Icons.play_arrow),
                iconSize: 64.0,
                onPressed: player.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: const Icon(Icons.pause),
                iconSize: 64.0,
                onPressed: player.pause,
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.replay),
                iconSize: 64.0,
                onPressed: () => player.seek(Duration.zero,
                    index: player.effectiveIndices!.first),
              );
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            icon: const Icon(Icons.skip_next),
            onPressed: player.hasNext ? player.seekToNext : null,
          ),
        ),
        StreamBuilder<double>(
          stream: player.speedStream,
          builder: (context, snapshot) => IconButton(
            icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {
              showSliderDialog(
                context: context,
                title: "Adjust speed",
                divisions: 10,
                min: 0.5,
                max: 2.0,
                value: player.speed,
                stream: player.speedStream,
                onChanged: player.setSpeed,
              );
            },
          ),
        ),
      ],
    );
  }

}

class AudioMetadata {
  final String album;
  final String title;
  final String artwork;

  AudioMetadata({
    required this.album,
    required this.title,
    required this.artwork,
  });
}


// class playl{
//   List? playls;
//   playl(this.playls);
// }