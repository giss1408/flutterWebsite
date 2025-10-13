import 'dart:io';

/// Utility class to analyze current images and provide SVG conversion recommendations
class SvgConversionAnalyzer {
  
  /// Analyze images in the assets folder and recommend SVG conversions
  static Map<String, String> analyzeForSvgConversion(List<String> imagePaths) {
    final recommendations = <String, String>{};
    
    for (final path in imagePaths) {
      final recommendation = _getConversionRecommendation(path);
      if (recommendation.isNotEmpty) {
        recommendations[path] = recommendation;
      }
    }
    
    return recommendations;
  }
  
  /// Get specific recommendation for an image
  static String _getConversionRecommendation(String imagePath) {
    final fileName = imagePath.split('/').last.toLowerCase();
    final extension = fileName.split('.').last;
    
    // Already SVG
    if (extension == 'svg') {
      return 'Already optimized as SVG';
    }
    
    // Icons and simple graphics - high priority for SVG conversion
    if (_isIcon(fileName)) {
      return 'HIGH PRIORITY: Convert to SVG - Icons benefit greatly from vector format';
    }
    
    // Logos and brand elements
    if (_isLogo(fileName)) {
      return 'HIGH PRIORITY: Convert to SVG - Logos need crisp rendering at all sizes';
    }
    
    // UI elements and shapes
    if (_isUIElement(fileName)) {
      return 'MEDIUM PRIORITY: Convert to SVG - UI elements scale better as vectors';
    }
    
    // Complex images with gradients or effects
    if (_isComplexImage(fileName)) {
      return 'LOW PRIORITY: Consider keeping as raster - Complex images may be better as PNG/JPG';
    }
    
    // Photos and realistic images
    if (_isPhoto(fileName)) {
      return 'NOT RECOMMENDED: Keep as raster - Photos should remain as JPG/PNG';
    }
    
    return 'EVALUATE: Assess complexity and usage to determine best format';
  }
  
  static bool _isIcon(String fileName) {
    return fileName.contains('icon') || 
           fileName.contains('arrow') ||
           fileName.contains('button') ||
           fileName.endsWith('_icon.png');
  }
  
  static bool _isLogo(String fileName) {
    return fileName.contains('logo') || 
           fileName.contains('brand') ||
           fileName.contains('symbol');
  }
  
  static bool _isUIElement(String fileName) {
    return fileName.contains('frame') ||
           fileName.contains('border') ||
           fileName.contains('shape') ||
           fileName.contains('layer') && _isSimpleLayer(fileName);
  }
  
  static bool _isSimpleLayer(String fileName) {
    // Simple layers without complex imagery
    return !fileName.contains('photo') && 
           !fileName.contains('image') &&
           !fileName.contains('background');
  }
  
  static bool _isComplexImage(String fileName) {
    return fileName.contains('gradient') ||
           fileName.contains('shadow') ||
           fileName.contains('effect') ||
           fileName.contains('composite');
  }
  
  static bool _isPhoto(String fileName) {
    return fileName.contains('photo') ||
           fileName.contains('woman') ||
           fileName.contains('man') ||
           fileName.contains('person') ||
           fileName.contains('stock-market') ||
           fileName.contains('blackwoman') ||
           fileName.contains('abidjan');
  }
  
  /// Generate a detailed report
  static String generateConversionReport(List<String> imagePaths) {
    final recommendations = analyzeForSvgConversion(imagePaths);
    final buffer = StringBuffer();
    
    buffer.writeln('# SVG Conversion Analysis Report');
    buffer.writeln('');
    buffer.writeln('## Summary');
    
    int highPriority = 0;
    int mediumPriority = 0;
    int lowPriority = 0;
    int notRecommended = 0;
    int alreadySvg = 0;
    
    for (final recommendation in recommendations.values) {
      if (recommendation.startsWith('HIGH PRIORITY')) highPriority++;
      else if (recommendation.startsWith('MEDIUM PRIORITY')) mediumPriority++;
      else if (recommendation.startsWith('LOW PRIORITY')) lowPriority++;
      else if (recommendation.startsWith('NOT RECOMMENDED')) notRecommended++;
      else if (recommendation.startsWith('Already optimized')) alreadySvg++;
    }
    
    buffer.writeln('- High Priority Conversions: $highPriority');
    buffer.writeln('- Medium Priority Conversions: $mediumPriority');
    buffer.writeln('- Low Priority Conversions: $lowPriority');
    buffer.writeln('- Not Recommended: $notRecommended');
    buffer.writeln('- Already SVG: $alreadySvg');
    buffer.writeln('');
    
    buffer.writeln('## Detailed Recommendations');
    buffer.writeln('');
    
    for (final entry in recommendations.entries) {
      buffer.writeln('### ${entry.key}');
      buffer.writeln('**Recommendation:** ${entry.value}');
      buffer.writeln('');
    }
    
    buffer.writeln('## Benefits of SVG Conversion');
    buffer.writeln('');
    buffer.writeln('1. **Scalability**: Crisp rendering at any size');
    buffer.writeln('2. **File Size**: Often smaller than equivalent raster images');
    buffer.writeln('3. **Performance**: Better browser rendering and caching');
    buffer.writeln('4. **Customization**: Easy color and style modifications');
    buffer.writeln('5. **Accessibility**: Better screen reader support');
    
    return buffer.toString();
  }
}