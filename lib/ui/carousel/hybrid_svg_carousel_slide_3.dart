import 'package:flutter/material.dart';
import 'optimized_carousel_slide_base.dart';
import 'carousel_text.dart';
import 'model_carousel_item_animation.dart';

/// Hybrid carousel slide 3 with SVG optimization
class HybridSvgCarouselSlide3 extends OptimizedCarouselSlideBase {
  const HybridSvgCarouselSlide3({super.key, required super.slideDuration});

  @override
  State<HybridSvgCarouselSlide3> createState() => _HybridSvgCarouselSlide3State();
}

class _HybridSvgCarouselSlide3State extends OptimizedCarouselSlideBaseState<HybridSvgCarouselSlide3> {
  
  @override
  List<SlideItemAnimationModel> getSlideItems() {
    return [
      SlideItemAnimationModel(
          id: "stock-market-photo",
          entryDuration: 800,
          exitDuration: 500,
          entry: 0,
          exit: 162),
      SlideItemAnimationModel(
          id: "slide_3-layer_2_svg",
          entryDuration: 800,
          exitDuration: 500,
          entry: 12,
          exit: 169),
      SlideItemAnimationModel(
          id: "slide_3-layer_1_fallback",
          entryDuration: 800,
          exitDuration: 500,
          entry: 23,
          exit: 175),
      SlideItemAnimationModel(
          id: "slide_3-text",
          entryDuration: 800,
          exitDuration: 500,
          entry: 34,
          exit: 157),
    ];
  }

  @override
  double getAnimationEndValue() => 200.0;

  @override
  Widget buildSlideContent(BuildContext context) {
    return Stack(
      children: [
        // Stock market photo - keep as JPG for quality
        Positioned(
          left: 400,
          top: 117,
          width: 420,
          height: 395,
          child: createOptimizedAnimatedWidget(
            id: "stock-market-photo",
            child: createOptimizedImage(
              assetPath: "assets/images/stock-market-2616931_1280.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        
        // Layer 2 - SVG business/finance themed graphics
        Positioned(
          left: 260,
          top: 95,
          width: 801,
          height: 429,
          child: createOptimizedAnimatedWidget(
            id: "slide_3-layer_2_svg",
            child: createOptimizedSvg(
              assetPath: "assets/images/slide_3-layer_2_Test.svg",
              fit: BoxFit.fill,
              // Business theme color
              color: const Color(0xFF2E8B57).withOpacity(0.7), // Sea green for finance
            ),
          ),
        ),
        
        // Layer 1 - fallback to PNG if no SVG available
        Positioned(
          left: 194,
          top: 73,
          width: 906,
          height: 440,
          child: createOptimizedAnimatedWidget(
            id: "slide_3-layer_1_fallback",
            child: createOptimizedImage(
              assetPath: "assets/images/slide_3-layer_1_Test.png",
              fit: BoxFit.fill,
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
              id: "slide_3-text",
              child: slide3Text,
            ),
          ),
        ),
      ],
    );
  }
}