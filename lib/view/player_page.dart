import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../screens/commons/buttons_player.dart';
import '../screens/commons/background_player.dart';
import '../model/musics.dart';

class Player extends StatefulWidget {
  static String tag = 'play-page';
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Music> pro = ModalRoute.of(context).settings.arguments;

    final _playlist = ConcatenatingAudioSource(
      children: [],
    );

    for (int i = 0; i < pro.length; i++) {
      AudioSource x = AudioSource.uri(
        Uri.parse(pro[i.toInt()].url),
        tag: AudioMetadata(
          title: pro[i.toInt()].name,
          artwork:
          pro[i.toInt()].image,
        ),
      );
      _playlist.add(x);
    }
    _audioPlayer.setAudioSource(_playlist).catchError((error) {
    });
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(child: BackgroundPlayer(_audioPlayer)),
              PlayerButtons(_audioPlayer),
            ],
          ),
        ),
      ),
    );
  }
}
class AudioMetadata {
  final String title;
  final String artwork;
  AudioMetadata({this.title, this.artwork});
}

