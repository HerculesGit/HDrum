// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/widgets.dart';

class Playable {
  final String soundName;

// emitir som

// animacao - mexer | vibrar

  Playable({required this.soundName});

  Future<void> emitSound() async {
    // final fileName = soundName.contains('.mp3') ? soundName : '$soundName.mp3';
    // final assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    // assetsAudioPlayer.open(Audio('assets/sounds/$fileName'));

    print('emitir som: $soundName');
  }
}
