import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/responsive.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({
    super.key,
    required this.controller,
    this.fullScreen = false,
  });

  final VideoPlayerController controller;
  final bool fullScreen;

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: controller.value.isInitialized
                  ? Chewie(
                      controller: ChewieController(
                        videoPlayerController: controller,
                        autoPlay: true,
                        fullScreenByDefault: widget.fullScreen,
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
      notMobile: const Scaffold(),
    );
  }
}
