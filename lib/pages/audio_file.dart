import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Player extends StatefulWidget {
  final String path;
  const Player({Key? key, required this.path}) : super(key: key);
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Set a sequence of audio sources that will be played by the audio player.
    _audioPlayer.setAsset(widget.path)
        .catchError((error) {
      // catch load errors: 404, invalid url ...
      print("An error occured $error");
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Widget _playerButton(PlayerState playerState) {

    // 1
    final processingState = playerState.processingState;
    if (processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {

      // 2
      return Container(
        margin: EdgeInsets.all(8.0),
        width: 64.0,
        height: 64.0,
        child: CircularProgressIndicator(),
      );
    } else if (_audioPlayer.playing != true) {

      // 3
      return IconButton(
        icon: Icon(Icons.play_arrow),
        iconSize: 30.0,
        onPressed: _audioPlayer.play,
      );
    } else if (processingState != ProcessingState.completed) {

      // 4
      return IconButton(
        icon: Icon(Icons.pause),
        iconSize: 30.0,
        onPressed: _audioPlayer.pause,
      );
    } else {

      // 5
      return IconButton(
        icon: Icon(Icons.replay),
        iconSize: 30.0,
        onPressed: () => _audioPlayer.seek(Duration.zero,
            index: _audioPlayer.effectiveIndices!.first),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        child: Row(
          children: [
            StreamBuilder<PlayerState>(
              stream: _audioPlayer.playerStateStream,
              builder: (context, snapshot) {
                final playerState = snapshot.data;
                return _playerButton(playerState!);
              },
            ),
          ],
        ),
      ),
    );
  }
}