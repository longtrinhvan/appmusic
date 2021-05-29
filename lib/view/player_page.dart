import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:rxdart/rxdart.dart';
import '../screens/commons/buttons_player.dart';
import '../model/musics.dart';
import 'home_page.dart';

class Player extends StatefulWidget {
  static String tag = 'play-page';
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  Stream<DurationState> _durationState;
  var _labelLocation = TimeLabelLocation.sides;
  var _labelType = TimeLabelType.totalTime;
  AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        _audioPlayer.positionStream,
        _audioPlayer.playbackEventStream,
        (position, playbackEvent) => DurationState(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));
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
          artwork: pro[i.toInt()].image,
        ),
      );
      _playlist.add(x);
    }
    _audioPlayer.setAudioSource(_playlist).catchError((error) {});
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<SequenceState>(
                    stream: _audioPlayer.sequenceStateStream,
                    builder: (context, snapshot) {
                      final state = snapshot.data;
                      final sequence = state?.sequence ?? [];
                      int i = state.currentIndex;
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                                Center(
                                  child: Row(
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.only(left: 20),
                                        iconSize: 30.0,
                                        color: Colors.white,
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed(HomePage.tag);
                                        },
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                         // Icons.arrow_drop_down,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Text(
                                        sequence[i].tag.title,
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(500.0),
                                              child: Image.network(
                                                sequence[i].tag.artwork,
                                                width: 316.0,
                                                height: 316.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                        Center(
                                          child: Text(
                                            "Tác giả: Trịnh Đình Quang",
                                            style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "Ca sĩ: Cao Thái Sơn",
                                            style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 100.0,
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
              ),
              _progressBar(),
              SizedBox(
                height: 50.0,
              ),
              PlayerButtons(_audioPlayer),
              SizedBox(
                height: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<DurationState> _progressBar() {
    return StreamBuilder<DurationState>(
      stream: _durationState,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progressBarColor: Colors.blue[900],
          baseBarColor: Colors.blue[400],
          barHeight: 3.0,
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: (duration) {
            _audioPlayer.seek(duration);
          },
          timeLabelLocation: _labelLocation,
          timeLabelType: _labelType,
        );
      },
    );
  }
}

class AudioMetadata {
  final String title;
  final String artwork;
  AudioMetadata({this.title, this.artwork});
}

class DurationState {
  const DurationState({
    this.progress,
    this.buffered,
    this.total,
  });
  final Duration progress;
  final Duration buffered;
  final Duration total;
}
