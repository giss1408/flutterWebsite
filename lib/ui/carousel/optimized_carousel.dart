import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'optimized_carousel_slide_1.dart';
import 'optimized_carousel_slide_2.dart';
import 'optimized_carousel_slide_3.dart';
import 'optimized_carousel_slide_4.dart';
import 'optimized_image_preloader.dart';

class OptimizedCarousel extends StatefulWidget {
  static const int slideDuration = 6400;
  static const int slideCount = 4;

  const OptimizedCarousel({super.key});

  @override
  State<OptimizedCarousel> createState() => _OptimizedCarouselState();
}

class _OptimizedCarouselState extends State<OptimizedCarousel>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  int currentSlide = 0;
  Widget? currentSlideWidget;
  
  // Preload images and SVGs for better performance
  final List<String> _imagePaths = [
    "assets/images/abidjan-web.jpg",
    "assets/images/slide_1-layer_1_Test.png",
    "assets/images/slide_1-layer_2_Test.png",
    "assets/images/device_frame.png",
    "assets/images/woman-4873600_1280.Layer_Test_1.jpg",
    "assets/images/Layer_Test_1.png",
    "assets/images/Layer_Test_2.png",
    "assets/images/stock-market-2616931_1280.jpg",
    "assets/images/slide_3-layer_2_Test.png",
    "assets/images/slide_3-layer_1_Test.png",
    "assets/images/blackWoman_layer_4_1280.jpg",
    "assets/images/slide_4-layer_1_Test.png",
    "assets/images/slide_4-layer_2_Test.png",
    // Add SVG assets here when available
    "assets/images/logo.svg",
  ];

  @override
  void initState() {
    super.initState();
    _preloadImages();
    _initializeAnimation();
    _buildCurrentSlide();
  }

  void _preloadImages() {
    // Use the optimized image preloader for better performance
    OptimizedImagePreloader.preloadImages(_imagePaths, context).then((_) {
      debugPrint('Carousel images preloaded: ${OptimizedImagePreloader.getCacheStats()}');
    }).catchError((error) {
      debugPrint('Error preloading carousel images: $error');
    });
  }

  void _initializeAnimation() {
    animationController = AnimationController(
      duration: Duration(
        milliseconds: (OptimizedCarousel.slideDuration * OptimizedCarousel.slideCount).toInt(),
      ),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: OptimizedCarousel.slideCount.toDouble(),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ));

    animation.addListener(_onAnimationUpdate);
    animation.addStatusListener(_onAnimationStatus);
    
    animationController.forward();
  }

  void _onAnimationUpdate() {
    final newSlide = animation.value.floor();
    if (newSlide != currentSlide && newSlide < OptimizedCarousel.slideCount) {
      setState(() {
        currentSlide = newSlide;
        _buildCurrentSlide();
      });
    }
  }

  void _onAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _restart();
    }
  }

  void _restart() {
    animationController.reset();
    animationController.forward();
  }

  // Lazy loading: only build the current slide widget
  void _buildCurrentSlide() {
    switch (currentSlide) {
      case 0:
        currentSlideWidget = OptimizedCarouselSlide1(
          slideDuration: OptimizedCarousel.slideDuration,
        );
        break;
      case 1:
        currentSlideWidget = OptimizedCarouselSlide2(
          slideDuration: OptimizedCarousel.slideDuration,
        );
        break;
      case 2:
        currentSlideWidget = OptimizedCarouselSlide3(
          slideDuration: OptimizedCarousel.slideDuration,
        );
        break;
      case 3:
        currentSlideWidget = OptimizedCarouselSlide4(
          slideDuration: OptimizedCarousel.slideDuration,
        );
        break;
      default:
        currentSlideWidget = OptimizedCarouselSlide1(
          slideDuration: OptimizedCarousel.slideDuration,
        );
    }
  }

  @override
  void dispose() {
    animation.removeListener(_onAnimationUpdate);
    animation.removeStatusListener(_onAnimationStatus);
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: currentSlideWidget ?? const SizedBox.shrink(),
      ),
    );
  }
}