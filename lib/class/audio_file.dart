// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
//
// class Player extends StatefulWidget {
//   final String path;
//   // final AudioPlayer advancedPlayer;
//
//   const Player({Key? key,required this.path}) : super(key: key);
//
//   @override
//   _PlayerState createState() => _PlayerState();
// }
//
// class _PlayerState extends State<Player> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'global.dart';
// void main() => runApp(MyApp());

late AudioPlayer _audioPlayer;

class MyAp extends StatefulWidget {
  final String path;
  final List? playlist;

  const MyAp({Key? key, required this.path, required this.playlist}) : super(key: key);

  @override
  _MyApState createState() => _MyApState();
}

// use GetIt or Provider rather than a global variable in a real project
PageManager? _pageManager;

class _MyApState extends State<MyAp> {
  @override
  void initState() {
    super.initState();
    _pageManager = PageManager(widget.playlist);
  }

  @override
  void dispose() {
    _pageManager!.dispose();
    super.dispose();
  }

  void previous(){
    setState(() {
      globalVar().index - 1;
    });
  }

  void next(){
    setState(() {
      globalVar().index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // String dropdownValue = '1.0x';
    return  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

            //  CurrentSongTitle(),
            //  Playlist(),
             // AddRemoveSongButtons(),
              AudioProgressBar(),
              AudioControlButtons(),
            ],
          ),
    );
  }
}

// class CurrentSongTitle extends StatelessWidget {
//   const CurrentSongTitle({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<String>(
//       valueListenable: _pageManager.currentSongTitleNotifier,
//       builder: (_, title, __) {
//         return Padding(
//           padding: const EdgeInsets.only(top: 8.0),
//           child: Text(title, style: TextStyle(fontSize: 40)),
//         );
//       },
//     );
//   }
// }
//
// class Playlist extends StatelessWidget {
//   const Playlist({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ValueListenableBuilder<List<String>>(
//         valueListenable: _pageManager.playlistNotifier,
//         builder: (context, playlistTitles, _) {
//           return ListView.builder(
//             itemCount: playlistTitles.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text('${playlistTitles[index]}'),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class AddRemoveSongButtons extends StatelessWidget {
//   const AddRemoveSongButtons({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FloatingActionButton(
//             onPressed: _pageManager.addSong,
//             child: Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             onPressed: _pageManager.removeSong,
//             child: Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: _pageManager!.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: _pageManager!.seek,
        );
      },
    );
  }
}

class AudioControlButtons extends StatelessWidget {
  const AudioControlButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RepeatButton(),
          PreviousSongButton(),
          PlayButton(),
          NextSongButton(),
          ShuffleButton(),
        ],
      ),
    );
  }
}

// Widget _repeatButton(BuildContext context, LoopMode loopMode) {
//   final icons = [
//     Icon(Icons.repeat),
//     Icon(Icons.repeat, color: Theme.of(context).accentColor),
//     Icon(Icons.repeat_one, color: Theme.of(context).accentColor),
//   ];
//   const cycleModes = [
//     LoopMode.off,
//     LoopMode.all,
//     LoopMode.one,
//   ];
//   final index = cycleModes.indexOf(loopMode);
//   return IconButton(
//     icon: icons[index],
//     onPressed: () {
//       _audioPlayer.setLoopMode(
//           cycleModes[(cycleModes.indexOf(loopMode) + 1) % cycleModes.length]);
//     },
//   );
// }

class RepeatButton extends StatelessWidget {
  const RepeatButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<RepeatState>(
      valueListenable: _pageManager!.repeatButtonNotifier,
      builder: (context, value, child) {
        Icon icon;
        switch (value) {
          case RepeatState.off:
            icon = Icon(Icons.repeat, color: Colors.grey);
            break;
          case RepeatState.repeatSong:
            icon = Icon(Icons.repeat_one);
            break;
          case RepeatState.repeatPlaylist:
            icon = Icon(Icons.repeat);
            break;
        }
        return IconButton(
          icon: icon,
          onPressed: _pageManager!.onRepeatButtonPressed,
        );
      },
    );
  }
}


// Widget _previousButton() {
//   return IconButton(
//     icon: Icon(Icons.skip_previous),
//     onPressed: _audioPlayer.hasPrevious ? _audioPlayer.seekToPrevious : null,
//   );
// }
class PreviousSongButton extends StatelessWidget {
  const PreviousSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _pageManager!.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(
          icon: Icon(Icons.skip_previous),
          onPressed: _pageManager!.onPreviousSongButtonPressed,
        );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ButtonState>(
      valueListenable: _pageManager!.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: EdgeInsets.all(8.0),
              width: 32.0,
              height: 32.0,
              child: CircularProgressIndicator(),
            );
          case ButtonState.paused:
            return IconButton(
              icon: Icon(Icons.play_arrow),
              iconSize: 32.0,
              onPressed: _pageManager!.play,
            );
          case ButtonState.playing:
            return IconButton(
              icon: Icon(Icons.pause),
              iconSize: 32.0,
              onPressed: _pageManager!.pause,
            );
        }
      },
    );
  }
}

Widget _nextButton() {
  return IconButton(
    icon: Icon(Icons.skip_next),
    onPressed: _audioPlayer.hasNext ? _audioPlayer.seekToNext : null,
  );
}

class NextSongButton extends StatelessWidget {
  const NextSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _pageManager!.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          icon: Icon(Icons.skip_next),
          onPressed: (isLast) ? null : _pageManager!.onNextSongButtonPressed,
        );
      },
    );
  }
}

class ShuffleButton extends StatelessWidget {
  const ShuffleButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _pageManager!.isShuffleModeEnabledNotifier,
      builder: (context, isEnabled, child) {
        return IconButton(
          icon: (isEnabled)
              ? Icon(Icons.shuffle)
              : Icon(Icons.shuffle, color: Colors.grey),
          onPressed: _pageManager!.onShuffleButtonPressed,
        );
      },
    );
  }
}

class PlayButtonNotifier extends ValueNotifier<ButtonState> {
  PlayButtonNotifier() : super(_initialValue);
  static const _initialValue = ButtonState.paused;
}

enum ButtonState { playing, paused, loading}


class ProgressNotifier extends ValueNotifier<ProgressBarState> {
  ProgressNotifier() : super(_initialValue);
  static const _initialValue = ProgressBarState(
    current: Duration.zero,
    buffered: Duration.zero,
    total: Duration.zero,
  );

}

class ProgressBarState {
  const ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}



class RepeatButtonNotifier extends ValueNotifier<RepeatState> {
  RepeatButtonNotifier() : super(_initialValue);
  static const _initialValue = RepeatState.off;

  void nextState() {
    final next = (value.index + 1) % RepeatState.values.length;
    value = RepeatState.values[next];
  }
}

enum RepeatState {
  off,
  repeatSong,
  repeatPlaylist,
}

class PageManager{

  final currentSongTitleNotifier = ValueNotifier<String>('');
  final playlistNotifier = ValueNotifier<List<String>>([]);
  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);

  PageManager(path) {
    _init(path);
  }

  void _init(List pt) async {
    _audioPlayer = AudioPlayer();
    _setInitialPlaylist(pt);
    _listenForChangesInPlayerState();
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();
    _listenForChangesInSequenceState();
  }

  // TODO: set playlist
  void _setInitialPlaylist(List url) async {
    await _audioPlayer.setAsset(url.elementAt(globalVar().index));
  }

  void _listenForChangesInPlayerState() {
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });
  }

  void _listenForChangesInPlayerPosition() {
    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInBufferedPosition() {
    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInTotalDuration() {
    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void _listenForChangesInSequenceState() {
    // TODO
  }

  void play() async {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void dispose() {
    _audioPlayer.dispose();
  }

  void onRepeatButtonPressed() {
    repeatButtonNotifier.nextState();
    switch (repeatButtonNotifier.value) {
      case RepeatState.off:
        _audioPlayer.setLoopMode(LoopMode.off);
        break;
      case RepeatState.repeatSong:
        _audioPlayer.setLoopMode(LoopMode.one);
        break;
      case RepeatState.repeatPlaylist:
        _audioPlayer.setLoopMode(LoopMode.all);
    }

    // _audioPlayer.setLoopMode();
    //_audioPlayer.loopMode;
    // const cycleModes = [
    //   LoopMode.off,
    //   LoopMode.all,
    //   LoopMode.one,
    // ];
    // _audioPlayer.setLoopMode(
    //     cycleModes[(cycleModes.indexOf(loopMode) + 1) % cycleModes.length]);
  }

  void onPreviousSongButtonPressed() {
    if(globalVar().index != 0){
     _MyApState().previous();
    }
    // _audioPlayer.seekToPrevious();
    // _audioPlayer.hasPrevious ? _audioPlayer.seekToPrevious : print('no previous');
  }

  void onNextSongButtonPressed() {
    _audioPlayer.seekToNext();
    // _audioPlayer.hasNext ? _audioPlayer.seekToNext : null;
  }
// Widget _shuffleButton(BuildContext context, bool isEnabled) {
//   return IconButton(
//     icon: isEnabled
//         ? Icon(Icons.shuffle, color: Theme.of(context).accentColor)
//         : Icon(Icons.shuffle),
//     onPressed: () async {
//       final enable = !isEnabled;
//       if (enable) {
//         await _audioPlayer.shuffle();
//       }
//       await _audioPlayer.setShuffleModeEnabled(enable);
//     },
//   );
// }
  void onShuffleButtonPressed() async {
    final enable = !_audioPlayer.shuffleModeEnabled;
    if (enable) {
      await _audioPlayer.shuffle();
    }
    await _audioPlayer.setShuffleModeEnabled(enable);
  }

  void addSong() {
    // _audioPlayer.speed;
     AudioPlayer audioPlayers = AudioPlayer();
    // audioPlayers.setPlaybackRate(playbackRate: 1.0);
    // TODO
  }

  void removeSong() {
    // TODO
  }
  
}