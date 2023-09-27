import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../utils/duration_foramter.dart';
import '../views/screens/home/widget/controll_box_widget.dart';


class PlayController extends GetxController{

  final player = AudioPlayer();

  bool isPlaying = false;

  String currentPlaying = "";

  int? selectedContainerIndex ;

  playerSong(FileSystemEntity file) async {
    await player.setUrl(file.path);

    player.positionStream.listen((event) {

      Duration  temp = event as Duration;
      DurationMusic.position = temp;
      update();
    });

    if(player.duration != null){
      DurationMusic.duration = player.duration!;
    }



    if(currentPlaying == file){


      if(isPlaying){
        player.pause();
        isPlaying = false;
      }else{
        player.play();
        isPlaying = true;
      }
    }else{
      isPlaying = true;
      player.play();

    }
    currentPlaying = File(file.path).uri.pathSegments.last;

    update();



  }


     sliderMetode(value)  {
    final seekPosition = Duration(seconds: value.toInt());
    player.seek(seekPosition);
  }



}