import 'package:flutter/material.dart';
import 'optimized_carousel_slide_base.dart';
import 'carousel_text.dart';
import 'model_carousel_item_animation.dart';

/// Example carousel slide optimized for SVG usage
/// This demonstrates how to use SVG images in the carousel for better performance
class SvgOptimizedCarouselSlide extends OptimizedCarouselSlideBase {
  const SvgOptimizedCarouselSlide({super.key, required super.slideDuration});

  @override
  State<SvgOptimizedCarouselSlide> createState() => _SvgOptimizedCarouselSlideState();
}

class _SvgOptimizedCarouselSlideState extends OptimizedCarouselSlideBaseState<SvgOptimizedCarouselSlide> {
  
  @override
  List<SlideItemAnimationModel> getSlideItems() {
    return [
      SlideItemAnimationModel(
          id: "svg-logo",
          entryDuration: 800,
          exitDuration: 500,
          entry: 0,
          exit: 224),
      SlideItemAnimationModel(
          id: "svg-icon-1",
          entryDuration: 800,
          exitDuration: 500,
          entry: 14,
          exit: 231),
      SlideItemAnimationModel(
          id: "svg-icon-2",
          entryDuration: 800,
          exitDuration: 500,
          entry: 26,
          exit: 238),
      SlideItemAnimationModel(
          id: "slide-text",
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
        // Central logo using SVG for crisp rendering
        Positioned(
          left: 500,
          top: 200,
          width: 200,
          height: 200,
          child: createOptimizedAnimatedWidget(
            id: "svg-logo",
            child: createOptimizedSvg(
              assetPath: "assets/images/logo.svg",
              fit: BoxFit.contain,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        
        // SVG icons with different colors demonstrating customization
        Positioned(
          left: 300,
          top: 150,
          width: 100,
          height: 100,
          child: createOptimizedAnimatedWidget(
            id: "svg-icon-1",
            child: createOptimizedSvg(
              assetPath: "assets/images/logo.svg",
              fit: BoxFit.contain,
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
          ),
        ),
        
        Positioned(
          left: 800,
          top: 150,
          width: 100,
          height: 100,
          child: createOptimizedAnimatedWidget(
            id: "svg-icon-2",
            child: createOptimizedSvg(
              assetPath: "assets/images/logo.svg",
              fit: BoxFit.contain,
              color: Colors.green,
              width: 100,
              height: 100,
            ),
          ),
        ),
        
        // Background pattern using repeated SVG (demonstration)
        ...List.generate(5, (index) => 
          Positioned(
            left: 100.0 + (index * 200.0),
            top: 500,
            width: 50,
            height: 50,
            child: Opacity(
              opacity: 0.1,
              child: createOptimizedSvg(
                assetPath: "assets/images/logo.svg",
                fit: BoxFit.contain,
                color: Colors.grey,
                addRepaintBoundary: false, // Skip repaint boundary for background elements
              ),
            ),
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
              id: "slide-text",
              child: const Text(
                'SVG Optimized Carousel',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}