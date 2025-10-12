import 'package:flutter/material.dart';

import 'animation_slide_up_down_fade.dart';
import 'carousel_text.dart';
import 'model_carousel_item_animation.dart';

class CarouselSlide1 extends StatefulWidget {
  final int slideDuration;

  const CarouselSlide1({super.key, required this.slideDuration});

  @override
  State<CarouselSlide1> createState() => _CarouselSlide1State();
}

class _CarouselSlide1State extends State<CarouselSlide1>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  List<SlideItemAnimationModel> slideItems = [
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
  final slideItemOffset = const Offset(0, 60);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: widget.slideDuration), vsync: this);
    animation = Tween<double>(begin: 0, end: 252).animate(animationController)
      ..addListener(() {
        setState(() {
          slideItems = getSlideItemAnimationUpdate(animation.value, slideItems);
        });
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1200,
      height: 1200,
      child: Stack(
        children: [
          Positioned(
            left: 449,
            top: 116,
            width: 400,
            height: 400,
            child: WidgetSlideUpDownFadeAnimation(
              duration:
                  getSlideItemAnimationDuration("abidjan-web", slideItems),
              direction:
                  getSlideItemAnimationVisibility("abidjan-web", slideItems),
              offset: slideItemOffset,
              child: Image.asset("assets/images/abidjan-web.jpg",
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            left: 222,
            top: 60,
            width: 760,
            height: 480,
            child: WidgetSlideUpDownFadeAnimation(
              duration: getSlideItemAnimationDuration(
                  "slide_1-layer_1_Test", slideItems),
              direction: getSlideItemAnimationVisibility(
                  "slide_1-layer_1_Test", slideItems),
              offset: slideItemOffset,
              child: Image.asset("assets/images/slide_1-layer_1_Test.png",
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            left: 374,
            top: 148,
            width: 596,
            height: 368,
            child: WidgetSlideUpDownFadeAnimation(
              duration: getSlideItemAnimationDuration(
                  "slide_1-layer_2_Test", slideItems),
              direction: getSlideItemAnimationVisibility(
                  "slide_1-layer_2_Test", slideItems),
              offset: slideItemOffset,
              child: Image.asset("assets/images/slide_1-layer_2_Test.png",
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            left: 441,
            top: 37,
            width: 317,
            height: 565,
            child:
                Image.asset("assets/images/device_frame.png", fit: BoxFit.fill),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 640,
              alignment: Alignment.center,
              child: WidgetSlideUpDownFadeAnimation(
                duration:
                    getSlideItemAnimationDuration("slide_1-text", slideItems),
                direction:
                    getSlideItemAnimationVisibility("slide_1-text", slideItems),
                offset: slideItemOffset,
                child: slide1Text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
