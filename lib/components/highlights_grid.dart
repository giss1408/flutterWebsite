import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';

/// Highlight card for tourism features
class HighlightCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String? imageUrl;

  const HighlightCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.imageUrl,
  });

  @override
  State<HighlightCard> createState() => _HighlightCardState();
}

class _HighlightCardState extends State<HighlightCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 1.03).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ModernColors.backgroundCard,
            borderRadius: BorderRadius.circular(ModernRadius.lg),
            border: Border.all(
              color: _isHovered ? widget.color : ModernColors.border,
              width: _isHovered ? 2 : 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.color.withAlpha(51), // 20%
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    )
                  ]
                : ModernShadows.elevation2,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image or Icon
                if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(ModernRadius.md),
                    child: Image.asset(
                      widget.imageUrl!,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildIconContainer();
                      },
                    ),
                  )
                else
                  _buildIconContainer(),
                const SizedBox(height: 16),
                // Title
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: ModernTypography.headlineSmall.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                // Description
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: ModernTypography.bodyMedium.copyWith(
                    color: ModernColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconContainer() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: widget.color.withAlpha(26), // 10%
        borderRadius: BorderRadius.circular(ModernRadius.md),
      ),
      child: Icon(
        widget.icon,
        color: widget.color,
        size: 32,
      ),
    );
  }
}

/// Grid display of tourism highlights
class HighlightsGrid extends StatelessWidget {
  const HighlightsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final crossAxisCount = isMobile ? 1 : 3;

    final highlights = [
      {
        'title': 'Cultural Experiences',
        'description': 'Immerse yourself in vibrant local traditions, arts, and heritage sites across Côte d\'Ivoire',
        'icon': Icons.palette,
        'color': Color(0xFF7C3AED), // Purple
        'image': 'images/highlights/highlight_cultural.jpg',
      },
      {
        'title': 'Wildlife & Nature',
        'description': 'Explore protected forests, national parks, and diverse wildlife including rare species',
        'icon': Icons.forest,
        'color': Color(0xFF00B369), // Green
        'image': 'images/highlights/highlight_wildlife.jpg',
      },
      {
        'title': 'Beach Relaxation',
        'description': 'Unwind on pristine sandy beaches with crystal-clear waters and ocean breezes',
        'icon': Icons.beach_access,
        'color': Color(0xFF00D9FF), // Teal
        'image': 'images/highlights/highlight_beach.jpg',
      },
      {
        'title': 'Culinary Delights',
        'description': 'Taste authentic Ivorian cuisine and discover local flavors through market tours and cooking classes',
        'icon': Icons.restaurant,
        'color': Color(0xFFFF6B35), // Orange
        'image': 'images/highlights/highlight_cuisine.jpg',
      },
      {
        'title': 'Adventure Activities',
        'description': 'Experience hiking, water sports, safari tours, and thrilling outdoor adventures',
        'icon': Icons.landscape,
        'color': Color(0xFFFFB700), // Gold
        'image': 'images/highlights/highlight_adventure.jpg',
      },
      {
        'title': 'Photography Spots',
        'description': 'Capture stunning landscapes, sunsets, and candid moments perfect for any photographer',
        'icon': Icons.photo_camera,
        'color': Color(0xFF1389FD), // Blue
        'image': 'images/highlights/highlight_photography.jpg',
      },
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: highlights.length,
      itemBuilder: (context, index) {
        final highlight = highlights[index];
        return HighlightCard(
          title: highlight['title'].toString(),
          description: highlight['description'].toString(),
          icon: highlight['icon'] as IconData,
          color: highlight['color'] as Color,
          imageUrl: highlight['image'] as String?,
        );
      },
    );
  }
}
