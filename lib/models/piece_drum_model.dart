import 'package:assets_audio_player/assets_audio_player.dart';

import '../core/constants/constants.dart';

class PieceDrumModel {
  final String soundName;

  PieceDrumModel({required this.soundName});

  Future<void> emitSound() async {
    const extension = '.wav';
    final fileName =
        soundName.contains(extension) ? soundName : '$soundName$extension';
    // final assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    // assetsAudioPlayer.open(Audio('assets/sounds/$fileName'));

    AssetsAudioPlayer.newPlayer().open(Audio('$kSounds/$fileName'));

    print('emitir som: $soundName');
  }
}
