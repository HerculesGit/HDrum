import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/components/buttons/raw_button.dart';

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

  const PieceDrum({
    Key? key,
    required this.name,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(PieceDrumController(initialSize: size), tag: name);

    return PlayableRawButton(
      onPressed: () {
        controller.initAnimation();
      },
      child: Obx(
        () {
          double animationSize = controller.size.value;
          return Container(
            decoration: const BoxDecoration(
              color: Colors.red,
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
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Text(name),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
