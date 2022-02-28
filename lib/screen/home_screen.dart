import 'package:flutter/material.dart';
import 'package:hdrum/models/piece_drum_model.dart';

import 'widgets/piece_drum.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,

      //color: Colors.red,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 15,
            child: buildPieceOfDrum(context, 'crash', 120, 'crash'),
          ),
          //buildPieceOfDrum(context, 'crash', 120),

          // bass
          Positioned(
            right: media.width * 0.25 - 10,
            bottom: 15,
            child: buildPieceOfDrum(
                context, 'bass1', media.width * 0.25, 'bass_drum'),
          ),
          Positioned(
            left: media.width * 0.25 - 10,
            bottom: 15,
            child: buildPieceOfDrum(
                context, 'bass2', media.width * 0.25, 'bass_drum'),
          ),

          // snare drum
          Positioned(
            left: media.width / 2 - 70,
            bottom: media.width * 0.15,
            child: buildPieceOfDrum(context, 'snareDrum', 130, 'snare_drum'),
          ),

          // Tom-tom
          Positioned(
            left: media.width / 3 - 50,
            bottom: media.width * 0.25,
            child: buildPieceOfDrum(context, 'Tom-tom1', 110, 'tom_1'),
          ),

          // Tom-tom
          Positioned(
            left: media.width / 2 - 55,
            bottom: media.width * 0.28,
            child: buildPieceOfDrum(context, 'Tom-tom2', 120, 'tom_2'),
          ),

          // Tom-tom
          Positioned(
            left: media.width / 1.5 - 55,
            bottom: media.width * 0.22,
            child: buildPieceOfDrum(context, 'Tom-tom3', 130, 'tom_3'),
          ),

          Positioned(
            left: 120 + 20,
            top: 15,
            child: buildPieceOfDrum(context, 'splash', 90, 'crash'),
          ),

          //
          Positioned(
            right: 120 + 20,
            top: 15,
            child: buildPieceOfDrum(context, 'crash2', 90, 'crash'),
          ),

          Positioned(
            right: 80,
            bottom: 150,
            child: buildPieceOfDrum(context, 'ride', 120, 'ride'),
          ),
        ],
      ),
    );
  }

  Widget buildPieceOfDrum(
      BuildContext context, String name, double size, String soundName) {
    return PieceDrum(
      name: name,
      size: size,
      pieceDrumModel: PieceDrumModel(soundName: soundName),
    );
  }
}
