import 'package:flutter/material.dart';
import 'optimized_carousel_slide_base.dart';
import 'carousel_text.dart';
import 'model_carousel_item_animation.dart';

class OptimizedCarouselSlide2 extends OptimizedCarouselSlideBase {
  const OptimizedCarouselSlide2({super.key, required super.slideDuration});

  @override
  State<OptimizedCarouselSlide2> createState() => _OptimizedCarouselSlide2State();
}

class _OptimizedCarouselSlide2State extends OptimizedCarouselSlideBaseState<OptimizedCarouselSlide2> {
  
  @override
  List<SlideItemAnimationModel> getSlideItems() {
    return [
      SlideItemAnimationModel(
          id: 'woman-4873600_1280.Layer_Test_1',
          entryDuration: 800,
          exitDuration: 500,
          entry: 0,
          exit: 164),
      SlideItemAnimationModel(
          id: 'Layer_Test_2',
          entryDuration: 800,
          exitDuration: 500,
          entry: 13,
          exit: 172),
      SlideItemAnimationModel(
          id: 'Layer_Test_1',
          entryDuration: 800,
          exitDuration: 500,
          entry: 17,
          exit: 178),
      SlideItemAnimationModel(
          id: 'slide_2-text',
          entryDuration: 800,
          exitDuration: 500,
          entry: 33,
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
          left: 46,
          top: 106,
          width: 385,
          height: 467,
          child: createOptimizedAnimatedWidget(
            id: 'woman-4873600_1280.Layer_Test_1',
            child: createOptimizedImage(
              assetPath: 'assets/images/woman-4873600_1280.Layer_Test_1.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 400,
          top: 100,
          width: 714,
          height: 298,
          child: createOptimizedAnimatedWidget(
            id: 'Layer_Test_1',
            child: createOptimizedImage(
              assetPath: 'assets/images/Layer_Test_1.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 114,
          top: 105,
          width: 901,
          height: 396,
          child: createOptimizedAnimatedWidget(
            id: 'Layer_Test_2',
            child: createOptimizedImage(
              assetPath: 'assets/images/Layer_Test_2.png',
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
            assetPath: 'assets/images/device_frame.png',
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
              id: 'slide_2-text',
              child: slide2Text,
            ),
          ),
        ),
      ],
    );
  }
}