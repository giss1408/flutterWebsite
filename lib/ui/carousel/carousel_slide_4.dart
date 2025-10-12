import 'package:flutter/material.dart';
import 'package:flutter_website/ui/carousel/carousel_text.dart';
import 'package:flutter_website/ui/carousel/model_carousel_item_animation.dart';

import 'animation_slide_up_down_fade.dart';

class CarouselSlide4 extends StatefulWidget {
  final int slideDuration;

  const CarouselSlide4({super.key, required this.slideDuration});

  @override
  State<CarouselSlide4> createState() => _CarouselSlide4State();
}

class _CarouselSlide4State extends State<CarouselSlide4>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  List<SlideItemAnimationModel> slideItems = [
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
    animation = Tween<double>(begin: 0, end: 200).animate(animationController)
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
      height: 640,
      child: Stack(
        children: [
          Positioned(
            left: 345,
            top: 52,
            width: 345,
            height: 480,
            child: WidgetSlideUpDownFadeAnimation(
              duration: getSlideItemAnimationDuration(
                  "blackWoman_layer_4_1280", slideItems),
              direction: getSlideItemAnimationVisibility(
                  "blackWoman_layer_4_1280", slideItems),
              offset: slideItemOffset,
              child: Image.asset("assets/images/blackWoman_layer_4_1280.jpg",
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            left: 202,
            top: 108,
            width: 735,
            height: 428,
            child: WidgetSlideUpDownFadeAnimation(
              duration: getSlideItemAnimationDuration(
                  "slide_4-layer_1_Test", slideItems),
              direction: getSlideItemAnimationVisibility(
                  "slide_4-layer_1_Test", slideItems),
              offset: slideItemOffset,
              child: Image.asset("assets/images/slide_4-layer_1_Test.png",
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            left: 187,
            top: 80,
            width: 901,
            height: 474,
            child: WidgetSlideUpDownFadeAnimation(
              duration: getSlideItemAnimationDuration(
                  "slide_4-layer_2_Test", slideItems),
              direction: getSlideItemAnimationVisibility(
                  "slide_4-layer_2_Test", slideItems),
              offset: slideItemOffset,
              child: Image.asset("assets/images/slide_4-layer_2_Test.png",
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
                    getSlideItemAnimationDuration("slide_4-text", slideItems),
                direction:
                    getSlideItemAnimationVisibility("slide_4-text", slideItems),
                offset: slideItemOffset,
                child: slide4Text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
