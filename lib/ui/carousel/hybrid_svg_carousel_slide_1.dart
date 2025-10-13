import 'package:flutter/material.dart';
import 'optimized_carousel_slide_base.dart';
import 'carousel_text.dart';
import 'model_carousel_item_animation.dart';

/// Hybrid carousel slide that uses SVG for UI elements and PNG for photos
class HybridSvgCarouselSlide1 extends OptimizedCarouselSlideBase {
  const HybridSvgCarouselSlide1({super.key, required super.slideDuration});

  @override
  State<HybridSvgCarouselSlide1> createState() => _HybridSvgCarouselSlide1State();
}

class _HybridSvgCarouselSlide1State extends OptimizedCarouselSlideBaseState<HybridSvgCarouselSlide1> {
  
  @override
  List<SlideItemAnimationModel> getSlideItems() {
    return [
      SlideItemAnimationModel(
          id: "abidjan-web",
          entryDuration: 800,
          exitDuration: 500,
          entry: 0,
          exit: 224),
      SlideItemAnimationModel(
          id: "slide_1-layer_1_svg",
          entryDuration: 800,
          exitDuration: 500,
          entry: 14,
          exit: 231),
      SlideItemAnimationModel(
          id: "slide_1-layer_2_svg",
          entryDuration: 800,
          exitDuration: 500,
          entry: 26,
          exit: 238),
      SlideItemAnimationModel(
          id: "slide_1-text",
          entryDuration: 800,
          exitDuration: 500,
          entry: 36,
          exit: 219),
    ];
  }

  @override
  double getAnimationEndValue() => 252.0;

  @override
  Widget buildSlideContent(BuildContext context) {
    return Stack(
      children: [
        // Photo background - keep as JPG for quality
        Positioned(
          left: 449,
          top: 116,
          width: 400,
          height: 400,
          child: createOptimizedAnimatedWidget(
            id: "abidjan-web",
            child: createOptimizedImage(
              assetPath: "assets/images/abidjan-web.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        
        // Layer 1 - now using SVG for better performance and scalability
        Positioned(
          left: 222,
          top: 60,
          width: 760,
          height: 480,
          child: createOptimizedAnimatedWidget(
            id: "slide_1-layer_1_svg",
            child: createOptimizedSvg(
              assetPath: "assets/images/slide_1-layer_1_Test.svg",
              fit: BoxFit.fill,
              // Dynamic color based on theme
              color: Theme.of(context).primaryColor.withOpacity(0.8),
            ),
          ),
        ),
        
        // Layer 2 - SVG with custom styling
        Positioned(
          left: 374,
          top: 148,
          width: 596,
          height: 368,
          child: createOptimizedAnimatedWidget(
            id: "slide_1-layer_2_svg",
            child: createOptimizedSvg(
              assetPath: "assets/images/slide_1-layer_2_Test.svg",
              fit: BoxFit.fill,
              // Accent color for variety
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
            ),
          ),
        ),
        
        // Device frame - now using SVG for crisp rendering
        Positioned(
          left: 441,
          top: 37,
          width: 317,
          height: 565,
          child: createOptimizedSvg(
            assetPath: "assets/images/device_frame.svg",
            fit: BoxFit.fill,
            // Theme-aware device frame color
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        
        // Text content
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            height: 640,
            alignment: Alignment.center,
            child: createOptimizedAnimatedWidget(
              id: "slide_1-text",
              child: slide1Text,
            ),
          ),
        ),
      ],
    );
  }
}