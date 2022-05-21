import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  final String path;
  const AudioFile({Key? key, required this.advancedPlayer, required this.path}) : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {

  static AudioCache player = AudioCache();
  Duration _duration = new Duration();
  Duration _position = new Duration();

  // final String path = path;
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;

  @override
  void initState(){
    super.initState();

    this.widget.advancedPlayer.onDurationChanged.listen((d) {setState(() {
      _duration = d;
    });});

    this.widget.advancedPlayer.onAudioPositionChanged.listen((p) {setState(() {
      _position = p;
    });});
    
    // this.widget.advancedPlayer.pla
    
  }

  Widget btnStart(){
    return GestureDetector(
      onTap: (){
        print('here');
        final player = AudioCache();
        player.play(widget.path);
      },
      child: const FaIcon(
        FontAwesomeIcons.play
      ),
    );
  }

  Widget loadAsset(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        btnStart()
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

              ],
            ),
          ),
          loadAsset()
        ],
      ),
    );
  }
}
