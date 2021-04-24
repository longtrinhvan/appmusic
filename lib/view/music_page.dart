import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../model/music.dart';
import 'home_page.dart';

class MyMusicApp extends StatefulWidget {
  static String tag = 'music-page';

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MyMusicApp> {
  //we will need some variables
  bool playing = false; // at the begining we are not playing any song
  IconData playBtn = Icons.play_arrow; // the main state of the play button icon

  //Now let's start by creating our music player
  //first let's declare some object
  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  //we will create a custom slider

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  //let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  //Now let's initialize our player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //this function will allow you to get the music duration
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    //this function will allow us to move the cursor of the slider while we are playing the song
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    Music pro = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      //let's start by creating the main UI of the app
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 48.0,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  iconSize: 40.0,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                ),
                //Let's add some text title
                SizedBox(
                  height: 20.0,
                ),
                //Let's add the music cover

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Let's start by adding the controller
                        //let's add the time indicator text
                        Expanded(
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(500.0),
                              child: Image.asset(
                                "assets/sounds/image/" + "${pro.image}",
                                width: 306.0,
                                height: 306.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: Text(
                            "${pro.title}",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70.0,
                        ),
                        Container(
                          width: 500.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              slider(),
                              Text(
                                "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.blue,
                              onPressed: () {},
                              icon: Icon(
                                Icons.skip_previous,
                              ),
                            ),
                            IconButton(
                              iconSize: 62.0,
                              color: Colors.blue[800],
                              onPressed: () {
                                //here we will add the functionality of the play button
                                if (!playing) {
                                  //now let's play the song
                                  cache.play("sounds/${pro.path}");
                                  setState(() {
                                    playBtn = Icons.pause;
                                    playing = true;
                                  });
                                } else {
                                  _player.pause();
                                  setState(() {
                                    playBtn = Icons.play_arrow;
                                    playing = false;
                                  });
                                }
                              },
                              icon: Icon(
                                playBtn,
                              ),
                            ),
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.blue,
                              onPressed: () {},
                              icon: Icon(
                                Icons.skip_next,
                              ),
                            ),
                          ],
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
      ),
    );
  }
}
