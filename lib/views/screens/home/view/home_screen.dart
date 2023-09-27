import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/controller/song_controller.dart';
import 'package:music_player_app/views/constants/colors_app.dart';
import 'package:music_player_app/views/screens/single/view/single_song_screen.dart';

import '../../../../controller/play_controller.dart';
import '../../../../utils/duration_foramter.dart';
import '../widget/controll_box_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.sizeOf(context).height;
    var widthScreen = MediaQuery.sizeOf(context).width;
    SongController getSongController = Get.put(SongController());
    PlayController playController = Get.put(PlayController());

    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: GetBuilder<SongController>(
        builder: (controller){
          return Column(
            //alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: playController.isPlaying ?  heightScreen -160: heightScreen,
                child: ListView.builder(
                    itemCount: controller.songList.length,
                    itemBuilder: (context , index){
                      return InkWell(
                        onTap: (){

                       setState(() {
                         playController.selectedContainerIndex = index;



                       });
                       playController.playerSong(controller.songList[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child:  Container(




                            height: 85,
                            decoration: BoxDecoration(
                                color:    playController.selectedContainerIndex == index ? AppColors.kLightPrimaryColor : AppColors.kLightSecondaryColor,
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: Center(
                              child: ListTile(
                                trailing: Container(
                                  height: 30,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      color: Color(0xff252525).withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child:  Center(child: Text(
                                       "${Random().nextInt(1)} : ${Random().nextInt(90)}" ,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white
                                  ),)),
                                ),
                               leading: controller.songDtale(controller.songList[index]),

                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
              if (playController.currentPlaying.isNotEmpty)
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SingelScreen()));
                    },
                    child: ControllMusicBox())
              else
                Container(

                ),


            ],
          );
        },
      ),
    );
  }
}
