import 'dart:convert';
import 'package:exercise_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List infoVideo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _dispose = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose(){
    _dispose = true;
    _videoPlayerController?.pause();
    _videoPlayerController?.dispose();
    _videoPlayerController = null;
    super.dispose();
  }

  _initData() async{
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("json/videoinfo.json");
    infoVideo = jsonDecode(catalogJson);
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: !_playArea? BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.gradientFirst.withOpacity(0.9),
              AppColor.gradientSecond
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight
          )
        )
        : BoxDecoration(
          color: AppColor.gradientSecond
        ),
        child: Column(
          children: [
            !_playArea ? Container(
              padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColor.secondPageIconColor,
                        ),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: AppColor.secondPageIconColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Text(
                    "Săn chắc chân",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.secondPageTitleColor,
                    ),
                  ),
                  Text(
                    "và Cơ mông",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColor.secondPageTitleColor,
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              AppColor.secondPageContainerGradient1stColor,
                              AppColor.secondPageContainerGradient2ndColor
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight
                          ),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: AppColor.secondPageIconColor,
                            ),
                            const SizedBox(width: 5,),
                            Text(
                              "60 phút",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 180,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                AppColor.secondPageContainerGradient1stColor,
                                AppColor.secondPageContainerGradient2ndColor
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                          ),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.handyman_outlined,
                              size: 20,
                              color: AppColor.secondPageIconColor,
                            ),
                            const SizedBox(width: 5,),
                            Text(
                              "Dây kháng lực, Tạ",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
            : Container(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    padding: EdgeInsets.only(top: 70, left: 30, right: 30),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: AppColor.secondPageIconColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: AppColor.secondPageIconColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  _playVideo(context),
                  _controlVideo(context),
                ],
              ),
            ),
            Expanded(child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                )
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      Text(
                        "Chuỗi 1: Chân săn chắc",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.circuitsColor,
                        ),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.loop,
                        size: 20,
                        color: AppColor.loopColor,
                      ),
                      const SizedBox(width: 5,),
                      Text(
                        "3 lần",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.setsColor,
                        ),
                      ),
                      const SizedBox(width: 20,)
                    ],
                  ),
                  Expanded(
                    child: _listView(),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  _item_ListView(int index){
    return Container(
      height: 135,
      width: 200,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(infoVideo[index]["thumbnail"]),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    infoVideo[index]["title"],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    infoVideo[index]["time"],
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18,),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ),
              Row(
                children: [
                  for(int i = 0; i<70; i++)
                    i.isEven ?
                    Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.blueAccent
                      ),
                    ) :
                    Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white
                      ),
                    )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  var _onUpdateTime;
  void _onControllerUpdate() async{
    if(_dispose){
      return;
    }
    final now = DateTime.now().millisecondsSinceEpoch;
    if(_onUpdateTime > now){
      return;
    }
    _onUpdateTime = now + 500;
    final controller = _videoPlayerController;
    if(controller != null){
      print("Controller is null!");
      return;
    }
    if(!controller!.value.isInitialized){
      print("Controller can not be initialized!");
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;
  }

  _onTapVideo(int index){
    final videoController = VideoPlayerController.network(infoVideo[index]["videoUrl"]);
    final oldController = videoController;
    _videoPlayerController = videoController;
    if(oldController != null){
      oldController.removeListener(_onControllerUpdate);
      oldController.pause();

    }
    setState((){

    });
    videoController..initialize().then((_){
      //oldController.dispose();
      _isPlayingIndex = index;
      _videoPlayerController?.addListener(_onControllerUpdate);
      videoController.play();
      setState((){

      });
    });
  }

  _listView(){
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      itemCount: infoVideo.length,
      itemBuilder: (_ , int index){
        return GestureDetector(
          onTap: (){
            _onTapVideo(index);
            setState((){
              if(!_playArea){
                _playArea = true;
                _isPlaying = true;
              }
            });
          },
          child: _item_ListView(index),
        );
      },);
  }

  _playVideo(BuildContext context){
    final controller = _videoPlayerController;
    if(controller != null && controller.value.isInitialized){
      return AspectRatio(
        aspectRatio: 16/9,
        child: VideoPlayer(controller),
      );
    }
    else{
      return AspectRatio(
        aspectRatio: 16/9,
        child: Center(
          child: Text(
            "Vui lòng đợi...",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );
    }
  }

  Widget _controlVideo(BuildContext context){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async{
              final index = _isPlayingIndex -1;
              if(index >= 0 && infoVideo.length >= 0){
                _onTapVideo(index);
              }
              else{
                Get.snackbar("Video", "Không còn video nào trước đó");
              }
            },
            icon: Icon(
              Icons.fast_rewind,
              size: 36,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 20,),
          IconButton(
            onPressed: () async{
              if(_isPlaying){
                setState(() {
                  _isPlaying = false;
                });
                _videoPlayerController?.pause();
              }
              else{
                setState(() {
                  _isPlaying = true;
                });
                _videoPlayerController?.play();
              }
            },
            icon: _isPlaying ?
              Icon(
              Icons.pause,
              size: 36,
              color: Colors.white,
              ) :
              Icon(
                Icons.play_arrow,
                size: 36,
                color: Colors.white,
              ),
          ),
          SizedBox(width: 20,),
          IconButton(
            onPressed: () async{
              final index = _isPlayingIndex +1;
              if(index <= infoVideo.length - 1){
                _onTapVideo(index);
              }
              else{
                Get.snackbar("Video", "Không còn video nào sau đó");
              }
            },
            icon: Icon(
              Icons.fast_forward,
              size: 36,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
