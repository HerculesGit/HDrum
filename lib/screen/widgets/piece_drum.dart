import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hdrum/core/constants/constants.dart';

import '../../core/components/buttons/raw_button.dart';
import '../../core/services/playable_cervice.dart';
import '../../models/piece_drum_model.dart';

const animationDelay = 50;

class PieceDrumController extends GetxController {
  var size = 0.0.obs;

  final double initialSize;

  PieceDrumController({required this.initialSize});

  @override
  onInit() {
    size.value = initialSize;
    super.onInit();
  }

  initAnimation() async {
    await zoomIn();

    await zoomOut();
  }

  Future<void> zoomIn() async {
    size.value = initialSize - 20;
    await delay();
  }

  Future<void> zoomOut() async {
    size.value = initialSize;
    await delay();
  }

  Future<void> delay() async {
    await Future.delayed(const Duration(milliseconds: animationDelay));
  }
}

class PieceDrum extends StatelessWidget {
  final String name;
  final double size;

  final PieceDrumModel? pieceDrumModel;

  const PieceDrum(
      {Key? key, required this.name, required this.size, this.pieceDrumModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(PieceDrumController(initialSize: size), tag: name);
    final serviceController = Get.find<PlayableService>();

    serviceController.loadSound(pieceDrumModel!.soundName);

    // Will print error messages to the console.
    final String assetName = '$kDrumSet/${pieceDrumModel!.soundName}.svg';
    final svg = SvgPicture.asset(
      assetName,
      fit: BoxFit.cover,
      height: size,
      width: size,
    );
    return PlayableRawButton(
      onPressed: () {
        pieceDrumModel?.emitSound();
        //serviceController.playSound(pieceDrumModel!.soundName);
        controller.initAnimation();
      },
      child: Obx(
        () {
          double animationSize = controller.size.value;
          return Container(
            decoration: const BoxDecoration(
              //color: Colors.red,
              shape: BoxShape.circle,
            ),
            height: size,
            width: size,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: animationDelay),
                  height: animationSize,
                  width: animationSize,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    //color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  //child: Text(name),
                  child: svg,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
