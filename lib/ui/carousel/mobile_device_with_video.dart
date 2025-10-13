import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Mobile device frame with video content inside the screen area
class MobileDeviceWithVideo extends StatefulWidget {
  final String videoAssetPath;
  final bool autoPlay;
  final bool looping;
  final bool showControls;
  final Color? frameColor;
  final double width;
  final double height;

  const MobileDeviceWithVideo({
    super.key,
    required this.videoAssetPath,
    this.autoPlay = true,
    this.looping = true,
    this.showControls = false,
    this.frameColor,
    this.width = 317,
    this.height = 565,
  });

  @override
  State<MobileDeviceWithVideo> createState() => _MobileDeviceWithVideoState();
}

class _MobileDeviceWithVideoState extends State<MobileDeviceWithVideo> {
  late VideoPlayerController _videoController;
  bool _isVideoInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _videoController = VideoPlayerController.asset(widget.videoAssetPath);
      await _videoController.initialize();
      
      if (widget.looping) {
        _videoController.setLooping(true);
      }
      
      if (widget.autoPlay) {
        _videoController.play();
      }
      
      setState(() {
        _isVideoInitialized = true;
      });
    } catch (e) {
      debugPrint('Error initializing video: $e');
      setState(() {
        _hasError = true;
      });
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          // Mobile device frame (using SVG for crisp rendering)
          _buildDeviceFrame(),
          
          // Video content positioned inside the screen area
          _buildVideoScreen(),
          
          // Optional controls overlay
          if (widget.showControls && _isVideoInitialized)
            _buildVideoControls(),
        ],
      ),
    );
  }

  Widget _buildDeviceFrame() {
    return Container(
      width: widget.width,
      height: widget.height,
      child: CustomPaint(
        painter: MobileFramePainter(
          frameColor: widget.frameColor ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildVideoScreen() {
    // Screen area dimensions (adjust based on your device frame)
    const screenLeft = 25.0;
    const screenTop = 80.0;
    const screenWidth = 267.0;
    const screenHeight = 425.0;

    return Positioned(
      left: screenLeft,
      top: screenTop,
      width: screenWidth,
      height: screenHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.black,
          child: _buildVideoContent(),
        ),
      ),
    );
  }

  Widget _buildVideoContent() {
    if (_hasError) {
      return _buildErrorWidget();
    }

    if (!_isVideoInitialized) {
      return _buildLoadingWidget();
    }

    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: _videoController.value.size.width,
        height: _videoController.value.size.height,
        child: VideoPlayer(_videoController),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(strokeWidth: 2),
          SizedBox(height: 8),
          Text(
            'Loading video...',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.white, size: 32),
          SizedBox(height: 8),
          Text(
            'Error loading video',
            style: TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildVideoControls() {
    return Positioned(
      left: 25,
      bottom: 100,
      right: 25,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  if (_videoController.value.isPlaying) {
                    _videoController.pause();
                  } else {
                    _videoController.play();
                  }
                });
              },
            ),
            Expanded(
              child: VideoProgressIndicator(
                _videoController,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: Colors.white,
                  bufferedColor: Colors.grey,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.replay, color: Colors.white, size: 20),
              onPressed: () {
                _videoController.seekTo(Duration.zero);
                _videoController.play();
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom painter for mobile device frame
class MobileFramePainter extends CustomPainter {
  final Color frameColor;

  MobileFramePainter({required this.frameColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = frameColor
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = frameColor.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Outer frame
    final outerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(2, 2, size.width - 4, size.height - 4),
      const Radius.circular(45),
    );
    canvas.drawRRect(outerRect, paint);
    canvas.drawRRect(outerRect, strokePaint);

    // Screen area (will be filled with video)
    final screenPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final screenRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(25, 80, 267, 425),
      const Radius.circular(8),
    );
    canvas.drawRRect(screenRect, screenPaint);

    // Top speaker/camera area
    final speakerPaint = Paint()
      ..color = Colors.grey.shade600
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(120, 35, 77, 6),
        const Radius.circular(3),
      ),
      speakerPaint,
    );

    // Camera
    final cameraPaint = Paint()
      ..color = Colors.grey.shade800
      ..style = PaintingStyle.fill;

    canvas.drawCircle(const Offset(140, 60), 8, cameraPaint);
    canvas.drawCircle(const Offset(140, 60), 5, Paint()..color = Colors.black);

    // Home button
    final buttonPaint = Paint()
      ..color = Colors.grey.shade700
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(const Offset(158.5, 525), 20, buttonPaint);
    canvas.drawCircle(
      const Offset(158.5, 525),
      15,
      Paint()
        ..color = Colors.grey.shade600
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    // Side buttons
    final sideButtonPaint = Paint()
      ..color = Colors.grey.shade600
      ..style = PaintingStyle.fill;

    // Volume buttons
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(0, 120, 4, 35),
        const Radius.circular(2),
      ),
      sideButtonPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(0, 170, 4, 35),
        const Radius.circular(2),
      ),
      sideButtonPaint,
    );

    // Power button
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width - 4, 140, 4, 45),
        const Radius.circular(2),
      ),
      sideButtonPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}