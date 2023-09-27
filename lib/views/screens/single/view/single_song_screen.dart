
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player_app/controller/play_controller.dart';

import '../../home/widget/controll_box_widget.dart';




class SingelScreen extends StatelessWidget {
  const SingelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playing = Get.find<PlayController>();
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height  - 160,

                  decoration: BoxDecoration(
                      color: Colors.black,
                      gradient: LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: [

                            Colors.black,
                            Color(0xff252525),
                            Color(0xff252525),
                            Color(0xff1E1E1E),
                            Color(0xff1E1E1E),
                          ])
                  ),
                ),
                Lottie.asset('assets/anim/anim.json')
              ],
            ),
            ControllMusicBox()
          ],
        )
    );
  }
}