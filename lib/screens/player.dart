/*
 * File: player.dart
 * Project: Flutter music player
 * Created Date: Wednesday February 17th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../domain/audio_metadata.dart';
import '../screens/commons/buttons_player.dart';
import '../screens/commons/background_player.dart';
import '../model/musics.dart';
/// An audio player.
///
/// At the bottom of the page there is [PlayerButtons], while the rest of the
/// page is filled with a [PLaylist] widget.
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
    Music pro = ModalRoute.of(context).settings.arguments;
    _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse(
                "${pro.url}"),
            tag: AudioMetadata(
              title: "${pro.name}",
              artwork:
              "https://upload.wikimedia.org/wikipedia/en/3/3a/Diablo_Coverart.png",
            ),
          ),
        ],
      ),
    ) .catchError((error) {
      // catch load errors: 404, invalid url ...
      print("An error occured $error");
    });
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(child: BackgroundPlayer(pro.name)),
              PlayerButtons(_audioPlayer),
            ],
          ),
        ),
      ),
    );
  }
}
