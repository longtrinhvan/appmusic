/*
 * File: background_player.dart
 * Project: Flutter music player
 * Created Date: Thursday February 18th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */
import 'package:just_audio/just_audio.dart';
import 'package:appmusic/view/home_page.dart';
import 'package:flutter/material.dart';

/// A list of tiles showing all the audio sources added to the audio player.
///
/// Audio sources are displayed with a `ListTile` with a leading image (the
/// artwork), and the title of the audio source.
class BackgroundPlayer extends StatelessWidget {
  const BackgroundPlayer(this._audioPlayer, {Key key}) : super(key: key);

  final AudioPlayer _audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //let's start by creating the main UI of the app
      body: StreamBuilder<SequenceState>(
          stream: _audioPlayer.sequenceStateStream,
          builder: (context, snapshot) {
            final state = snapshot.data;
            final sequence = state?.sequence ?? [];
            int i = state.currentIndex;
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 28.0,
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: EdgeInsets.only(left: 20),
                        iconSize: 40.0,
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pushNamed(HomePage.tag);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(500.0),
                                    child: Image.network(
                                      sequence[i].tag.artwork,
                                      width: 306.0,
                                      height: 306.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              Center(
                                child: Text(
                                  sequence[i].tag.title,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100.0,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
