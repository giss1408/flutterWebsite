import 'package:flutter/material.dart';
import 'optimized_carousel_slide_base.dart';
import 'carousel_text.dart';
import 'model_carousel_item_animation.dart';

class OptimizedCarouselSlide4 extends OptimizedCarouselSlideBase {
  const OptimizedCarouselSlide4({super.key, required super.slideDuration});

  @override
  State<OptimizedCarouselSlide4> createState() => _OptimizedCarouselSlide4State();
}

class _OptimizedCarouselSlide4State extends OptimizedCarouselSlideBaseState<OptimizedCarouselSlide4> {
  
  @override
  List<SlideItemAnimationModel> getSlideItems() {
    return [
      SlideItemAnimationModel(
          id: "blackWoman_layer_4_1280",
          entryDuration: 800,
          exitDuration: 500,
          entry: 0,
          exit: 166),
      SlideItemAnimationModel(
          id: "slide_4-layer_1_Test",
          entryDuration: 800,
          exitDuration: 500,
          entry: 14,
          exit: 176),
      SlideItemAnimationModel(
          id: "slide_4-layer_2_Test",
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
        Positioned(
          left: 345,
          top: 52,
          width: 345,
          height: 480,
          child: createOptimizedAnimatedWidget(
            id: "blackWoman_layer_4_1280",
            child: createOptimizedImage(
              assetPath: "assets/images/blackWoman_layer_4_1280.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 202,
          top: 108,
          width: 735,
          height: 428,
          child: createOptimizedAnimatedWidget(
            id: "slide_4-layer_1_Test",
            child: createOptimizedImage(
              assetPath: "assets/images/slide_4-layer_1_Test.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 187,
          top: 80,
          width: 901,
          height: 474,
          child: createOptimizedAnimatedWidget(
            id: "slide_4-layer_2_Test",
            child: createOptimizedImage(
              assetPath: "assets/images/slide_4-layer_2_Test.png",
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
              id: "slide_4-text",
              child: slide4Text,
            ),
          ),
        ),
      ],
    );
  }
}