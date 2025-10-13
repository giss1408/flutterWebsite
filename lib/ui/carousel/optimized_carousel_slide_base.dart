import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'model_carousel_item_animation.dart';
import 'animation_slide_up_down_fade.dart';

/// Abstract base class for optimized carousel slides
/// Provides common animation controller logic and slide item management
abstract class OptimizedCarouselSlideBase extends StatefulWidget {
  final int slideDuration;

  const OptimizedCarouselSlideBase({super.key, required this.slideDuration});
}

/// Base state class with optimized animation handling
abstract class OptimizedCarouselSlideBaseState<T extends OptimizedCarouselSlideBase> 
    extends State<T> with SingleTickerProviderStateMixin {
  
  late AnimationController animationController;
  late Animation<double> animation;
  List<SlideItemAnimationModel> slideItems = [];
  bool _isAnimating = false;
  
  // Abstract methods to be implemented by concrete slides
  List<SlideItemAnimationModel> getSlideItems();
  double getAnimationEndValue();
  Widget buildSlideContent(BuildContext context);
  
  // Common slide item offset
  final slideItemOffset = const Offset(0, 60);
  
  @override
  void initState() {
    super.initState();
    slideItems = getSlideItems();
    _initializeAnimation();
  }
  
  void _initializeAnimation() {
    animationController = AnimationController(
      duration: Duration(milliseconds: widget.slideDuration),
      vsync: this,
    );
    
    animation = Tween<double>(
      begin: 0,
      end: getAnimationEndValue(),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
    
    // Use addListener with frame scheduling for better performance
    animation.addListener(_onAnimationUpdate);
    animationController.forward();
  }
  
  void _onAnimationUpdate() {
    if (!_isAnimating) {
      _isAnimating = true;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            slideItems = getSlideItemAnimationUpdate(animation.value, slideItems);
          });
        }
        _isAnimating = false;
      });
    }
  }
  
  @override
  void dispose() {
    animation.removeListener(_onAnimationUpdate);
    animationController.dispose();
    super.dispose();
  }
  
  /// Helper method to create optimized animated widgets
  Widget createOptimizedAnimatedWidget({
    required String id,
    required Widget child,
    Offset? customOffset,
  }) {
    return RepaintBoundary(
      child: WidgetSlideUpDownFadeAnimation(
        duration: getSlideItemAnimationDuration(id, slideItems),
        direction: getSlideItemAnimationVisibility(id, slideItems),
        offset: customOffset ?? slideItemOffset,
        child: child,
      ),
    );
  }
  
  /// Helper method to create optimized image widgets with SVG support
  Widget createOptimizedImage({
    required String assetPath,
    required BoxFit fit,
    bool addRepaintBoundary = true,
    Color? svgColor,
    double? width,
    double? height,
  }) {
    Widget imageWidget;
    
    // Check if the asset is an SVG file
    if (assetPath.toLowerCase().endsWith('.svg')) {
      imageWidget = SvgPicture.asset(
        assetPath,
        fit: fit,
        width: width,
        height: height,
        colorFilter: svgColor != null 
            ? ColorFilter.mode(svgColor, BlendMode.srcIn)
            : null,
        // Optimize SVG rendering
        placeholderBuilder: (BuildContext context) => Container(
          color: Colors.grey.withOpacity(0.1),
          child: const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        semanticsLabel: assetPath.split('/').last.split('.').first,
      );
    } else {
      imageWidget = Image.asset(
        assetPath,
        fit: fit,
        width: width,
        height: height,
        // Add semantic label for accessibility
        semanticLabel: assetPath.split('/').last.split('.').first,
        // Optimize image loading
        filterQuality: FilterQuality.medium,
        isAntiAlias: true,
        // Add error handling
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.withOpacity(0.3),
            child: const Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
          );
        },
      );
    }
    
    return addRepaintBoundary 
        ? RepaintBoundary(child: imageWidget)
        : imageWidget;
  }
  
  /// Helper method to create optimized SVG widgets specifically
  Widget createOptimizedSvg({
    required String assetPath,
    required BoxFit fit,
    Color? color,
    double? width,
    double? height,
    bool addRepaintBoundary = true,
  }) {
    final svgWidget = SvgPicture.asset(
      assetPath,
      fit: fit,
      width: width,
      height: height,
      colorFilter: color != null 
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
      // Cache the SVG for better performance
      placeholderBuilder: (BuildContext context) => Container(
        width: width,
        height: height,
        color: Colors.transparent,
      ),
      semanticsLabel: assetPath.split('/').last.split('.').first,
    );
    
    return addRepaintBoundary 
        ? RepaintBoundary(child: svgWidget)
        : svgWidget;
  }
  
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate responsive dimensions based on screen size
          final screenWidth = MediaQuery.of(context).size.width;
          final screenHeight = MediaQuery.of(context).size.height;
          
          // Base dimensions
          const baseWidth = 1200.0;
          const baseHeight = 640.0;
          
          // Calculate scale factor while maintaining aspect ratio
          final scaleX = screenWidth / baseWidth;
          final scaleY = screenHeight / baseHeight;
          final scale = (scaleX < scaleY ? scaleX : scaleY).clamp(0.3, 1.2);
          
          // Calculate actual dimensions
          final actualWidth = baseWidth * scale;
          final actualHeight = baseHeight * scale;
          
          return Container(
            width: actualWidth,
            height: actualHeight,
            child: Transform.scale(
              scale: scale,
              child: SizedBox(
                width: baseWidth,
                height: baseHeight,
                child: buildSlideContent(context),
              ),
            ),
          );
        },
      ),
    );
  }
}