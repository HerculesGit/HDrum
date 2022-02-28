import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class PlayableService extends GetxController {
  List<AssetsAudioPlayer> players = [];
  List<Audio> audios = [];
  List<String> fileNames = [];

  loadSound(String soundName) {
    if (!fileNames.contains(soundName)) {
      const extension = '.wav';
      final fileName =
          soundName.contains(extension) ? soundName : '$soundName$extension';

      fileNames.add(soundName);
      players.add(AssetsAudioPlayer.newPlayer());
      audios.add(Audio('$kSounds/$fileName'));
    }
  }

  Future<void> playSound(String soundName) async {
    final index = fileNames.indexOf(soundName);
    players[index].open(audios[index]);
  }
}
