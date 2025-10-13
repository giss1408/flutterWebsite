import 'package:flutter/material.dart';
import 'optimized_carousel_slide_base.dart';
import 'carousel_text.dart';
import 'model_carousel_item_animation.dart';

/// Hybrid carousel slide 4 with mobile/tech SVG optimization
class HybridSvgCarouselSlide4 extends OptimizedCarouselSlideBase {
  const HybridSvgCarouselSlide4({super.key, required super.slideDuration});

  @override
  State<HybridSvgCarouselSlide4> createState() => _HybridSvgCarouselSlide4State();
}

class _HybridSvgCarouselSlide4State extends OptimizedCarouselSlideBaseState<HybridSvgCarouselSlide4> {
  
  @override
  List<SlideItemAnimationModel> getSlideItems() {
    return [
      SlideItemAnimationModel(
          id: "portrait-photo",
          entryDuration: 800,
          exitDuration: 500,
          entry: 0,
          exit: 166),
      SlideItemAnimationModel(
          id: "slide_4-layer_1_fallback",
          entryDuration: 800,
          exitDuration: 500,
          entry: 14,
          exit: 176),
      SlideItemAnimationModel(
          id: "slide_4-layer_2_svg",
          entryDuration: 800,
          exitDuration: 500,
          entry: 25,
          exit: 171),
      SlideItemAnimationModel(
          id: "slide_4-text",
          entryDuration: 800,
          exitDuration: 500,
          entry: 37,
          exit: 159),
    ];
  }

  @override
  double getAnimationEndValue() => 200.0;

  @override
  Widget buildSlideContent(BuildContext context) {
    return Stack(
      children: [
        // Portrait photo - keep as JPG for quality
        Positioned(
          left: 345,
          top: 52,
          width: 345,
          height: 480,
          child: createOptimizedAnimatedWidget(
            id: "portrait-photo",
            child: createOptimizedImage(
              assetPath: "assets/images/blackWoman_layer_4_1280.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        
        // Layer 1 - fallback to PNG
        Positioned(
          left: 202,
          top: 108,
          width: 735,
          height: 428,
          child: createOptimizedAnimatedWidget(
            id: "slide_4-layer_1_fallback",
            child: createOptimizedImage(
              assetPath: "assets/images/slide_4-layer_1_Test.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        
        // Layer 2 - SVG mobile/tech elements
        Positioned(
          left: 187,
          top: 80,
          width: 901,
          height: 474,
          child: createOptimizedAnimatedWidget(
            id: "slide_4-layer_2_svg",
            child: createOptimizedSvg(
              assetPath: "assets/images/slide_4-layer_2_Test.svg",
              fit: BoxFit.fill,
              // Tech theme colors
              color: const Color(0xFF4A90E2).withOpacity(0.8), // Tech blue
            ),
          ),
        ),
        
        // Device frame - SVG for crisp rendering
        Positioned(
          left: 441,
          top: 37,
          width: 317,
          height: 565,
          child: createOptimizedSvg(
            assetPath: "assets/images/device_frame.svg",
            fit: BoxFit.fill,
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
              id: "slide_4-text",
              child: slide4Text,
            ),
          ),
        ),
      ],
    );
  }
}