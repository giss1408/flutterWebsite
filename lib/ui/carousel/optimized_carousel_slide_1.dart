import 'package:flutter/material.dart';
import 'optimized_carousel_slide_base.dart';
import 'carousel_text.dart';
import 'model_carousel_item_animation.dart';

class OptimizedCarouselSlide1 extends OptimizedCarouselSlideBase {
  const OptimizedCarouselSlide1({super.key, required super.slideDuration});

  @override
  State<OptimizedCarouselSlide1> createState() => _OptimizedCarouselSlide1State();
}

class _OptimizedCarouselSlide1State extends OptimizedCarouselSlideBaseState<OptimizedCarouselSlide1> {
  
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
          id: "slide_1-layer_1_Test",
          entryDuration: 800,
          exitDuration: 500,
          entry: 14,
          exit: 231),
      SlideItemAnimationModel(
          id: "slide_1-layer_2_Test",
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
        Positioned(
          left: 222,
          top: 60,
          width: 760,
          height: 480,
          child: createOptimizedAnimatedWidget(
            id: "slide_1-layer_1_Test",
            child: createOptimizedImage(
              assetPath: "assets/images/slide_1-layer_1_Test.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 374,
          top: 148,
          width: 596,
          height: 368,
          child: createOptimizedAnimatedWidget(
            id: "slide_1-layer_2_Test",
            child: createOptimizedImage(
              assetPath: "assets/images/slide_1-layer_2_Test.png",
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
              id: "slide_1-text",
              child: slide1Text,
            ),
          ),
        ),
      ],
    );
  }
}