import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';


class SongController extends  GetxController{


  List<FileSystemEntity> songList = [];


  getSongList() async {
    await Permission.manageExternalStorage.request();
    await Permission.storage.request();
    Directory directory = Directory('/storage/emulated/0/Download');
    String mp3path = directory.toString();
    List<FileSystemEntity>  _files;
    _files = directory.listSync(recursive: true , followLinks: false);
    for(FileSystemEntity entity in _files){
      String path = entity.path;
      if(path.endsWith('.mp3')) songList.add(entity);
    }

    update();

  }

  songDtale(FileSystemEntity file){
    String songname = File(file.path).uri.pathSegments.last;
    return  Text(songname.substring(0 , songname.length - 4) , style: TextStyle(

        fontSize: 14,
        color: Colors.white
    ),
    );

  }





  @override
  void onInit() {
    super.onInit();
    getSongList();

  }

}