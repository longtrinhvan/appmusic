import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:rxdart/rxdart.dart';
import '../screens/commons/buttons_player.dart';
import '../screens/commons/background_player.dart';
import '../model/musics.dart';

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
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(child: BackgroundPlayer(_audioPlayer)),
              _progressBar(),
              PlayerButtons(_audioPlayer),
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
