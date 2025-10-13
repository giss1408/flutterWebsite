import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'hybrid_svg_carousel_slide_1.dart';
import 'optimized_carousel_slide_2.dart'; // Keep slide 2 as-is for comparison
import 'hybrid_svg_carousel_slide_3.dart';
import 'hybrid_svg_carousel_slide_4.dart';
import 'optimized_image_preloader.dart';

/// Hybrid carousel showcasing SVG optimization alongside traditional images
class HybridSvgCarousel extends StatefulWidget {
  static const int slideDuration = 6400;
  static const int slideCount = 4;

  const HybridSvgCarousel({super.key});

  @override
  State<HybridSvgCarousel> createState() => _HybridSvgCarouselState();
}

class _HybridSvgCarouselState extends State<HybridSvgCarousel>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  int currentSlide = 0;
  Widget? currentSlideWidget;
  
  // Enhanced image list with SVG assets
  final List<String> _imagePaths = [
    // Photos (keep as raster)
    "assets/images/abidjan-web.jpg",
    "assets/images/woman-4873600_1280.Layer_Test_1.jpg",
    "assets/images/stock-market-2616931_1280.jpg",
    "assets/images/blackWoman_layer_4_1280.jpg",
    
    // UI elements (converted to SVG)
    "assets/images/device_frame.svg",
    "assets/images/slide_1-layer_1_Test.svg",
    "assets/images/slide_1-layer_2_Test.svg",
    "assets/images/slide_3-layer_2_Test.svg",
    "assets/images/slide_4-layer_2_Test.svg",
    
    // Fallback PNG layers (mixed approach)
    "assets/images/Layer_Test_1.png",
    "assets/images/Layer_Test_2.png",
    "assets/images/slide_3-layer_1_Test.png",
    "assets/images/slide_4-layer_1_Test.png",
    
    // Logo
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
    OptimizedImagePreloader.preloadImages(_imagePaths, context).then((_) {
      final stats = OptimizedImagePreloader.getCacheStats();
      debugPrint('Hybrid carousel loaded: ${stats['preloaded_images']} images, ${stats['preloaded_svgs']} SVGs');
    }).catchError((error) {
      debugPrint('Error preloading hybrid carousel assets: $error');
    });
  }

  void _initializeAnimation() {
    animationController = AnimationController(
      duration: Duration(
        milliseconds: (HybridSvgCarousel.slideDuration * HybridSvgCarousel.slideCount).toInt(),
      ),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: HybridSvgCarousel.slideCount.toDouble(),
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
    if (newSlide != currentSlide && newSlide < HybridSvgCarousel.slideCount) {
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

  // Build slides with hybrid SVG/PNG approach
  void _buildCurrentSlide() {
    switch (currentSlide) {
      case 0:
        currentSlideWidget = HybridSvgCarouselSlide1(
          slideDuration: HybridSvgCarousel.slideDuration,
        );
        break;
      case 1:
        // Keep slide 2 as original for comparison
        currentSlideWidget = OptimizedCarouselSlide2(
          slideDuration: HybridSvgCarousel.slideDuration,
        );
        break;
      case 2:
        currentSlideWidget = HybridSvgCarouselSlide3(
          slideDuration: HybridSvgCarousel.slideDuration,
        );
        break;
      case 3:
        currentSlideWidget = HybridSvgCarouselSlide4(
          slideDuration: HybridSvgCarousel.slideDuration,
        );
        break;
      default:
        currentSlideWidget = HybridSvgCarouselSlide1(
          slideDuration: HybridSvgCarousel.slideDuration,
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
      child: Column(
        children: [
          // Performance indicator
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.speed,
                  size: 16,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 4),
                Text(
                  'SVG Optimized Carousel - Slide ${currentSlide + 1}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          
          // Main carousel
          Expanded(
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
          ),
          
          // Slide indicators
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                HybridSvgCarousel.slideCount,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == currentSlide
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColor.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}