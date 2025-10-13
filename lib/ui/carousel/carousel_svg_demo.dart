import 'package:flutter/material.dart';
import 'hybrid_svg_carousel.dart';
import 'optimized_carousel.dart';
import 'svg_optimization_demo.dart';

/// Demo page showcasing the SVG-optimized carousel implementations
class CarouselSvgDemo extends StatefulWidget {
  const CarouselSvgDemo({super.key});

  @override
  State<CarouselSvgDemo> createState() => _CarouselSvgDemoState();
}

class _CarouselSvgDemoState extends State<CarouselSvgDemo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
    // Run SVG optimization analysis
    demonstrateSvgOptimization();
    SvgPerformanceMetrics.printPerformanceComparison();
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel SVG Optimization Demo'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Hybrid SVG'),
            Tab(text: 'Original'),
            Tab(text: 'Comparison'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Hybrid SVG-optimized carousel
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.green.shade50,
                child: const Row(
                  children: [
                    Icon(Icons.eco, color: Colors.green),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'SVG Optimized: UI elements use vector graphics for better performance',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: HybridSvgCarousel()),
            ],
          ),
          
          // Original carousel for comparison
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.orange.shade50,
                child: const Row(
                  children: [
                    Icon(Icons.image, color: Colors.orange),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Original: All elements use raster images (PNG/JPG)',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: OptimizedCarousel()),
            ],
          ),
          
          // Performance comparison
          _buildComparisonView(),
        ],
      ),
    );
  }

  Widget _buildComparisonView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildComparisonCard(
            'File Size Comparison',
            Icons.storage,
            Colors.blue,
            [
              'Device Frame PNG: 37 KB → SVG: ~5 KB (86% reduction)',
              'Layer Elements: 15-44 KB → SVG: ~3-8 KB (70-85% reduction)',
              'Total UI Elements: ~150 KB → ~30 KB (80% reduction)',
            ],
          ),
          
          const SizedBox(height: 16),
          
          _buildComparisonCard(
            'Performance Benefits',
            Icons.speed,
            Colors.green,
            [
              '✓ Crisp rendering at any screen size/DPI',
              '✓ Faster loading due to smaller file sizes',
              '✓ Better browser caching and compression',
              '✓ Scalable without quality loss',
              '✓ Theme-aware color customization',
            ],
          ),
          
          const SizedBox(height: 16),
          
          _buildComparisonCard(
            'Implementation Strategy',
            Icons.integration_instructions,
            Colors.purple,
            [
              '🖼️ Photos: Keep as JPG/PNG for quality',
              '🎨 UI Elements: Convert to SVG for performance',
              '📱 Device Frames: SVG with theme colors',
              '📊 Charts/Graphics: SVG for scalability',
              '🔄 Hybrid Approach: Best of both worlds',
            ],
          ),
          
          const SizedBox(height: 16),
          
          _buildRecommendationsCard(),
        ],
      ),
    );
  }

  Widget _buildComparisonCard(
    String title,
    IconData icon,
    Color color,
    List<String> items,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                item,
                style: const TextStyle(fontSize: 14),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationsCard() {
    return Card(
      elevation: 2,
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.lightbulb, color: Colors.amber),
                SizedBox(width: 8),
                Text(
                  'Next Steps & Recommendations',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            const Text(
              'High Priority Conversions:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Text('• Device frames and UI overlays'),
            const Text('• Simple geometric layer elements'),
            const Text('• Icons and brand elements'),
            
            const SizedBox(height: 8),
            
            const Text(
              'Keep as Raster Images:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Text('• Photographs and portraits'),
            const Text('• Complex backgrounds with gradients'),
            const Text('• Stock images and realistic content'),
            
            const SizedBox(height: 8),
            
            const Text(
              'Implementation Tips:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Text('• Use createOptimizedSvg() for vector graphics'),
            const Text('• Apply theme colors for consistency'),
            const Text('• Test on various screen sizes'),
            const Text('• Monitor loading performance'),
          ],
        ),
      ),
    );
  }
}