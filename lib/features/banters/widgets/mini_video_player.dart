import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:takesavenue/gen/assets.gen.dart';
import 'package:video_player/video_player.dart';

class MiniVideoPlayer extends StatefulWidget {
  const MiniVideoPlayer({super.key});

  @override
  State<MiniVideoPlayer> createState() => _MiniVideoPlayerState();
}

class _MiniVideoPlayerState extends State<MiniVideoPlayer> {
  late VideoPlayerController _videoController;
  bool _isLoading = true;
  bool _isFullScreen = false;

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
    setState(() {
      _isFullScreen = !_isFullScreen;
      if (_isFullScreen) {
        Navigator.of(context)
            .push(
              MaterialPageRoute(
                builder:
                    (context) => Scaffold(
                      backgroundColor: Colors.black,
                      body: SafeArea(
                        child: Stack(
                          children: [
                            Center(
                              child: AspectRatio(
                                aspectRatio: _videoController.value.aspectRatio,
                                child: VideoPlayer(_videoController),
                              ),
                            ),
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
                            if (!_videoController.value.isPlaying)
                              Center(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black26,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    iconSize: 50,
                                    icon: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _videoController.play();
                                      });
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                fullscreenDialog: true,
              ),
            )
            .then((_) => setState(() => _isFullScreen = false));
      }
    });
  }
}
