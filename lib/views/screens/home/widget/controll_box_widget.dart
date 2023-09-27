import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/controller/play_controller.dart';

import '../../../../utils/duration_foramter.dart';



class ControllMusicBox extends StatefulWidget {
  const ControllMusicBox({super.key});

  @override
  State<ControllMusicBox> createState() => _ControllMusicBoxState();
}

class _ControllMusicBoxState extends State<ControllMusicBox> {
  @override
  Widget build(BuildContext context) {
    final  playController =  Get.find<PlayController>();
    return GetBuilder<PlayController>(
      builder: (controller){
        return Container(
            height: 160,
            color: Color(0xff1E1E1E),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(playController.currentPlaying.substring(0 ,playController.currentPlaying.length -4  ) , style: TextStyle(
                      color: Colors.white
                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 13 , left: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Text(DurationMusic.formtTime(DurationMusic.position) ,
                        style: TextStyle(
                            color: Colors.white
                        ),),
                      Expanded(
                        child: Container(
                          width: 400,

                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xff8d8e98),
                              activeTrackColor: Color(0xff4E4FEB),
                              thumbColor: Colors.white,

                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7 ,),
                              overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                              trackHeight: 1,
                            ),
                            child: Slider(
                              min: 0,
                              max: DurationMusic.duration.inSeconds.toDouble(),
                              value: DurationMusic.position.inSeconds.toDouble(),



                              onChanged: (value) async {
                                await playController.sliderMetode(value);
                              },

                            ),
                          ),
                        ),
                      ),
                      Text(DurationMusic.formtTime(DurationMusic.duration),
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.repeat_rounded , color: Colors.white,),
                    Container(
                      height: 55,
                      width: 55,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff363636),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff363636).withOpacity(.6),
                                blurRadius: 25,
                                offset:Offset(0, 6)
                            )
                          ]
                      ),
                      child: IconButton(
                          onPressed: (){

                          },
                          icon: Icon(Icons.skip_next_rounded , size: 30 , color: Colors.white,)

                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xff4E4FEB),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff4E4FEB).withOpacity(.6),
                                blurRadius: 25,
                                offset:Offset(0, 6)
                            )
                          ]
                      ),
                      child: IconButton(
                          onPressed: (){
                            if( playController.isPlaying){
                              playController.player.pause();
                              playController.isPlaying = false;
                            }else{
                              playController.player.play();
                              playController.isPlaying = true;
                            }
                          },
                          icon: playController.isPlaying ?Icon(Icons.pause , size: 40 , color: Colors.white,): Icon(Icons.play_arrow ,  size: 40 , color: Colors.white)

                      ),
                    ),
                    Container(
                      height: 55,
                      width: 55,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff363636),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff363636).withOpacity(.6),
                                blurRadius: 25,
                                offset:Offset(0, 6)
                            )
                          ]
                      ),
                      child: IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.skip_previous_rounded , size: 30 , color: Colors.white,),

                      ),
                    ),
                    Icon(Icons.multiple_stop_outlined , color: Colors.white,),
                  ],
                ),
              ],
            )
        );
      },
    );
  }
}
