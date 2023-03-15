// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gym_app/Provider/play_video_provider.dart';
import 'package:gym_app/Screens/mobile/home/play_video_full_screen.dart';
import 'package:gym_app/Services/functions.dart';
import 'package:gym_app/Utils/color.dart';
import 'package:gym_app/Widgets/big_text.dart';
import 'package:gym_app/Widgets/image_loader.dart';
import 'package:gym_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_video_progress/smooth_video_progress.dart';
import 'package:video_player/video_player.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class PostCard extends StatefulWidget {
  final String? image, desc, video;
  final int index;
  const PostCard({
    super.key,
    this.image,
    this.desc,
    this.video,
    required this.index,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late VideoPlayerController controller;
  bool isBuffering = true, nextPage = false;

  @override
  void initState() {
    if (widget.video != null) {
      controller = VideoPlayerController.network(
        '$baseUrl${widget.video}',
      )..initialize().then((value) {});
      controller.addListener(() async {
        if (controller.value.position == controller.value.duration) {
          await controller.seekTo(const Duration(seconds: 0));
          Provider.of<PlayVideoProvider>(
            context,
            listen: false,
          ).setPlaying(-1);
        }
        if (controller.value.isBuffering) {
          isBuffering = true;
          setState(() {});
        } else {
          isBuffering = false;
          setState(() {});
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isPlaying =
        Provider.of<PlayVideoProvider>(context).playing == widget.index;
    if (widget.video != null && !isPlaying && controller.value.isPlaying && !nextPage) {
      controller.pause();
    }
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.image != null
              ? Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: AppColor.bgContainerColor.withOpacity(.25),
                      ),
                    ],
                  ),
                  child: ImageLoader(
                    imageUrl: '$baseUrl${widget.image}',
                    fit: BoxFit.cover,
                  ),
                )
              : widget.video != null
                  ? Column(
                      children: [
                        controller.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: controller.value.aspectRatio,
                                child: Stack(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: controller.value.aspectRatio,
                                      child: VideoPlayer(controller),
                                    ),
                                    AspectRatio(
                                      aspectRatio: controller.value.aspectRatio,
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () async {
                                          setState(() {
                                            nextPage = true;
                                          });
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PlayVideo(
                                                controller: controller,
                                              ),
                                            ),
                                          );
                                          setState(() {
                                            nextPage = false;
                                          });
                                        },
                                        child: isBuffering
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : const SizedBox(),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(
                                height: 240,
                                width: 426,
                              ),
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          color: Colors.white.withOpacity(0.1),
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 30,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: Functions().arrangeVideoTime(
                                          controller.value.position.inHours,
                                          controller.value.position.inMinutes,
                                          controller.value.position.inSeconds,
                                        ),
                                        fontSize: 18,
                                        color: AppColor.textColor,
                                      ),
                                      Flexible(
                                        child: SmoothVideoProgress(
                                          controller: controller,
                                          builder: (context, position, duration,
                                                  child) =>
                                              Slider(
                                            thumbColor: Colors.red,
                                            onChangeStart: (_) =>
                                                controller.pause(),
                                            onChangeEnd: (_) =>
                                                controller.play(),
                                            onChanged: (value) =>
                                                controller.seekTo(Duration(
                                                    milliseconds:
                                                        value.toInt())),
                                            value: position.inMilliseconds
                                                .toDouble(),
                                            min: 0,
                                            max: duration.inMilliseconds
                                                .toDouble(),
                                          ),
                                        ),
                                      ),
                                      BigText(
                                        text: Functions().arrangeVideoTime(
                                          controller.value.duration.inHours,
                                          controller.value.duration.inMinutes,
                                          controller.value.duration.inSeconds,
                                        ),
                                        fontSize: 18,
                                        color: AppColor.textColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (controller.value.volume == 0) {
                                        controller.setVolume(1);
                                      } else {
                                        controller.setVolume(0);
                                      }
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      controller.value.volume == 1
                                          ? BootstrapIcons.volume_up_fill
                                          : BootstrapIcons.volume_mute_fill,
                                      color: AppColor.textColor,
                                      size: 20,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          var position =
                                              await controller.position;
                                          var seconds = position!.inSeconds;
                                          await controller.pause();
                                          await controller.seekTo(
                                            Duration(seconds: seconds - 5),
                                          );
                                          controller.play();
                                        },
                                        icon: Icon(
                                          BootstrapIcons.skip_backward_fill,
                                          color: AppColor.textColor,
                                          size: 20,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          if (controller.value.isPlaying) {
                                            controller.pause();
                                            Provider.of<PlayVideoProvider>(
                                              context,
                                              listen: false,
                                            ).setPlaying(-1);
                                          } else {
                                            controller.play();
                                            Provider.of<PlayVideoProvider>(
                                              context,
                                              listen: false,
                                            ).setPlaying(widget.index);
                                          }
                                        },
                                        icon: Icon(
                                          isPlaying
                                              ? BootstrapIcons.pause_fill
                                              : BootstrapIcons.play_fill,
                                          color: AppColor.textColor,
                                          size: 30,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          var position =
                                              await controller.position;
                                          var seconds = position!.inSeconds;
                                          await controller.pause();
                                          await controller.seekTo(
                                            Duration(seconds: seconds + 5),
                                          );
                                          controller.play();
                                        },
                                        icon: Icon(
                                          BootstrapIcons.skip_forward_fill,
                                          color: AppColor.textColor,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      setState(() {
                                        nextPage = true;
                                      });
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlayVideo(
                                            controller: controller,
                                            fullScreen: true,
                                          ),
                                        ),
                                      );
                                      setState(() {
                                        nextPage = false;
                                      });
                                    },
                                    icon: Icon(
                                      BootstrapIcons.fullscreen,
                                      color: AppColor.textColor,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
          const SizedBox(
            height: 10,
          ),
          widget.desc == null
              ? const SizedBox()
              : SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ReadMoreText(
                      widget.desc!,
                      textDirection: Functions().checkLetters(widget.desc!)
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      textAlign: Functions().checkLetters(widget.desc!)
                          ? TextAlign.left
                          : TextAlign.right,
                      style: TextStyle(
                        color: AppColor.textColor,
                      ),
                      trimCollapsedText: 'see more',
                      trimExpandedText: 'see less',
                      trimLength: 50,
                    ),
                  ),
                ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}