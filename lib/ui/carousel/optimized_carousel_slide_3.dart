import 'package:flutter/material.dart';
import 'optimized_carousel_slide_base.dart';
import 'carousel_text.dart';
import 'model_carousel_item_animation.dart';

class OptimizedCarouselSlide3 extends OptimizedCarouselSlideBase {
  const OptimizedCarouselSlide3({super.key, required super.slideDuration});

  @override
  State<OptimizedCarouselSlide3> createState() => _OptimizedCarouselSlide3State();
}

class _OptimizedCarouselSlide3State extends OptimizedCarouselSlideBaseState<OptimizedCarouselSlide3> {
  
  @override
  List<SlideItemAnimationModel> getSlideItems() {
    return [
      SlideItemAnimationModel(
          id: "stock-market-2616931_1280",
          entryDuration: 800,
          exitDuration: 500,
          entry: 0,
          exit: 162),
      SlideItemAnimationModel(
          id: "slide_3-layer_2_Test",
          entryDuration: 800,
          exitDuration: 500,
          entry: 12,
          exit: 169),
      SlideItemAnimationModel(
          id: "slide_3-layer_1_Test",
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
        Positioned(
          left: 400,
          top: 117,
          width: 420,
          height: 395,
          child: createOptimizedAnimatedWidget(
            id: "stock-market-2616931_1280",
            child: createOptimizedImage(
              assetPath: "assets/images/stock-market-2616931_1280.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 260,
          top: 95,
          width: 801,
          height: 429,
          child: createOptimizedAnimatedWidget(
            id: "slide_3-layer_2_Test",
            child: createOptimizedImage(
              assetPath: "assets/images/slide_3-layer_2_Test.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 194,
          top: 73,
          width: 906,
          height: 440,
          child: createOptimizedAnimatedWidget(
            id: "slide_3-layer_1_Test",
            child: createOptimizedImage(
              assetPath: "assets/images/slide_3-layer_1_Test.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 441,
          top: 37,
          width: 317,
          height: 565,
          child: createOptimizedImage(
            assetPath: "assets/images/device_frame.png",
            fit: BoxFit.fill,
          ),
        ),
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