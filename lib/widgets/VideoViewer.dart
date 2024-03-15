// VideoViewer.dart

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'full_screen_video_player.dart';

class VideoViewer extends StatefulWidget {
  final String path;

  const VideoViewer({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  _VideoViewerState createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
 late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _showControls = false;

  @override
  void initState() {
    super.initState();
    _controller =VideoPlayerController.networkUrl(Uri.parse(widget.path))
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown after the video is initialized
      });
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
    _controller.dispose();
  }

  void _playPause() {
    setState(() {
      _isPlaying ? _controller.pause() : _controller.play();
      _isPlaying = !_isPlaying;
      _showControls = true;
    });
  }

  void _rewind() {
    _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds - 10));
  }

  void _fastForward() {
    _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds + 10));
  }

  void _openFullScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenVideoPlayer(
          controller: _controller,
          playPauseFunction: _playPause,
          rewindFunction: _rewind,
          fastForwardFunction: _fastForward,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showControls = !_showControls;
        });
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio / 1,
                  child: VideoPlayer(_controller),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
          if (_showControls)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: _rewind,
                          icon: Icon(Icons.replay_10, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: _playPause,
                          icon: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 32.0,
                          ),
                        ),
                        IconButton(
                          onPressed: _fastForward,
                          icon: Icon(Icons.forward_10, color: Colors.white),
                        ),
                        IconButton(
                           color: Colors.white,
                          onPressed: _openFullScreen,
                          icon: Icon(Icons.fullscreen),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.0),
                  VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    colors: VideoProgressColors(
                      playedColor: Colors.white,
                      bufferedColor: Colors.white.withOpacity(0.5),
                      backgroundColor: Colors.grey[700]!,
                    ),
                  ),
                  SizedBox(height: 4.0),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
