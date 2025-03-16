import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:takesavenue/gen/assets.gen.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MiniVideoPlayer extends StatefulWidget {

  const MiniVideoPlayer({
    Key? key,
  }) : super(key: key);

  @override
  State<MiniVideoPlayer> createState() => _MiniVideoPlayerState();
}

class _MiniVideoPlayerState extends State<MiniVideoPlayer> {
  late VideoPlayerController _videoController;
  bool _isLoading = true;
  bool _isFullScreen = false;
  var username = "username";

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _videoController = VideoPlayerController.asset(Assets.vids.test);

    try {
      await _videoController.initialize();
      setState(() => _isLoading = false);
    } catch (e) {
      debugPrint('Error initializing video: $e');
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return WillPopScope(
      onWillPop: () async {
        if (_isFullScreen) {
          _toggleFullScreen();
          return false;
        }
        return true;
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (_videoController.value.isPlaying) {
              _videoController.pause();
            } else {
              _videoController.play();
            }
          });
        },
        onDoubleTap: _toggleFullScreen,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            ),
            // Username Overlay
            Positioned(
              top: 12,
              left: 8,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [
                  //     Colors.black.withOpacity(0.7),
                  //     Colors.transparent,
                  //   ],
                  // ),
                ),
                child: Row(
                  children: [
                    Text(
                      '@${username}',
                      style: const TextStyle(
                        // color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (!_videoController.value.isPlaying)
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                  color: Colors.black,
                ),
                onPressed: _toggleFullScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFullScreen() {
    final chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoPlay: true,
      looping: true,
    );
    // chewieController.enterFullScreen();
    setState(() {
      _isFullScreen = !_isFullScreen;
      if (_isFullScreen) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: Stack(
                  children: [
                    // Video Player
                    Center(
                      child: AspectRatio(
                        aspectRatio: _videoController.value.aspectRatio,
                        child: Chewie(controller: chewieController),
                      ),
                    ),
                    
                    // Username Overlay with Gradient
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(56, 16, 16, 16),
                        decoration: BoxDecoration(
                        ),
                        child: Row(
                          children: [
                            Text(
                              '@${username}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Close Button
                    Positioned(
                      top: 16,
                      left: 16,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() => _isFullScreen = false);
                        },
                      ),
                    ),
                    // if (!_videoController.value.isPlaying)
                    //   Center(
                    //     child: Container(
                    //       decoration: const BoxDecoration(
                    //         color: Colors.black26,
                    //         shape: BoxShape.circle,
                    //       ),
                    //       child: IconButton(
                    //         iconSize: 50,
                    //         icon: const Icon(
                    //           Icons.play_arrow,
                    //           color: Colors.white,
                    //         ),
                    //         onPressed: () {
                    //           setState(() {
                    //             _videoController.play();
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ),
          ),
        ).then((_) => setState(() => _isFullScreen = false));
      }
    });
  }
}
