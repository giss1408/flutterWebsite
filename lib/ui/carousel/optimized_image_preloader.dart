import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Optimized image preloading service that supports both raster and SVG images
class OptimizedImagePreloader {
  static final Map<String, bool> _preloadedImages = {};
  static final Map<String, bool> _preloadedSvgs = {};
  
  /// Preload a single image asset
  static Future<void> preloadImage(String assetPath, BuildContext context) async {
    if (_preloadedImages[assetPath] == true) return;
    
    try {
      if (assetPath.toLowerCase().endsWith('.svg')) {
        // Preload SVG
        await _preloadSvg(assetPath);
      } else {
        // Preload raster image
        await precacheImage(AssetImage(assetPath), context);
        _preloadedImages[assetPath] = true;
      }
    } catch (e) {
      debugPrint('Failed to preload image: $assetPath - $e');
    }
  }
  
  /// Preload multiple images concurrently
  static Future<void> preloadImages(List<String> assetPaths, BuildContext context) async {
    final futures = assetPaths.map((path) => preloadImage(path, context));
    await Future.wait(futures, eagerError: false);
  }
  
  /// Preload SVG specifically
  static Future<void> _preloadSvg(String assetPath) async {
    if (_preloadedSvgs[assetPath] == true) return;
    
    try {
      // Load and cache the SVG
      final loader = SvgAssetLoader(assetPath);
      await svg.cache.putIfAbsent(
        loader.cacheKey(null), 
        () => loader.loadBytes(null),
      );
      _preloadedSvgs[assetPath] = true;
    } catch (e) {
      debugPrint('Failed to preload SVG: $assetPath - $e');
    }
  }
  
  /// Check if an image is preloaded
  static bool isImagePreloaded(String assetPath) {
    if (assetPath.toLowerCase().endsWith('.svg')) {
      return _preloadedSvgs[assetPath] == true;
    }
    return _preloadedImages[assetPath] == true;
  }
  
  /// Clear preload cache
  static void clearCache() {
    _preloadedImages.clear();
    _preloadedSvgs.clear();
  }
  
  /// Get cache statistics
  static Map<String, int> getCacheStats() {
    return {
      'preloaded_images': _preloadedImages.length,
      'preloaded_svgs': _preloadedSvgs.length,
    };
  }
}