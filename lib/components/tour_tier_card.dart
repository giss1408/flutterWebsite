import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';
import 'package:flutter_website/models/tour_package.dart';

/// Compact, professional tour tier card for side-by-side comparison
class TourTierCard extends StatefulWidget {
  final TourPackage package;
  final VoidCallback onViewDetails;
  final Function(String)? onWhatsApp;
  final bool isHighlighted;

  const TourTierCard({
    super.key,
    required this.package,
    required this.onViewDetails,
    this.onWhatsApp,
    this.isHighlighted = false,
  });

  @override
  State<TourTierCard> createState() => _TourTierCardState();
}

class _TourTierCardState extends State<TourTierCard>
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

  void _onHover(bool isHovered) {
    setState(() => _isHovered = isHovered);
    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  Color get _tierColor => widget.package.tierColor;
  Color get _tierBg => _tierColor.withAlpha(26);
  Color get _tierBorder => _tierColor.withAlpha(51);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Transform.translate(
        offset: Offset(0, widget.isHighlighted && !isMobile ? -8 : 0),
        child: ScaleTransition(
          scale: Tween<double>(begin: 1.0, end: 1.02).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOut),
          ),
          child: Container(
            height: isMobile ? null : 480,
            decoration: BoxDecoration(
              color: widget.isHighlighted
                  ? _tierColor.withAlpha(8)
                  : ModernColors.backgroundCard,
              borderRadius: BorderRadius.circular(ModernRadius.lg),
              border: Border.all(
                color: _isHovered
                    ? _tierColor
                    : widget.isHighlighted
                        ? _tierBorder
                        : ModernColors.border,
                width: widget.isHighlighted ? 2 : 1,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: _tierColor.withAlpha(38),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      )
                    ]
                  : widget.isHighlighted
                      ? [
                          BoxShadow(
                            color: _tierColor.withAlpha(26),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          )
                        ]
                      : ModernShadows.elevation2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── HEADER: Tier badge ──────────────────────────────
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  decoration: BoxDecoration(
                    color: _tierBg,
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(ModernRadius.lg - 1)),
                  ),
                  child: Row(
                    children: [
                      Icon(widget.package.tierIcon,
                          color: _tierColor, size: 22),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.package.title,
                          style: ModernTypography.headlineSmall.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ── BODY: Compact info ──────────────────────────────
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Price
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: _tierBg,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'FCFA ${widget.package.priceMinFCFA.toStringAsFixed(0)}',
                                style: ModernTypography.titleLarge.copyWith(
                                  color: _tierColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '\$${widget.package.priceMinUSD.toStringAsFixed(0)}',
                                style: ModernTypography.bodySmall.copyWith(
                                  color: ModernColors.textTertiary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Duration chips
                        Wrap(
                          spacing: 8,
                          children: widget.package.durations.map((d) {
                            final isSelected = d == 14;
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? _tierColor : _tierBg,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color:
                                        isSelected ? _tierColor : _tierBorder),
                              ),
                              child: Text(
                                '$d jours',
                                style: ModernTypography.bodySmall.copyWith(
                                  color: isSelected ? Colors.white : _tierColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 14),

                        // Short description
                        Text(
                          widget.package.description,
                          style: ModernTypography.bodyMedium.copyWith(
                            color: ModernColors.textSecondary,
                            fontSize: 13,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),

                        // Key highlights (compact tags)
                        Text(
                          'Points forts',
                          style: ModernTypography.bodySmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ModernColors.textPrimary,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...widget.package.highlights.take(3).map((h) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              children: [
                                Icon(Icons.check_circle,
                                    color: _tierColor, size: 14),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(h,
                                      style: ModernTypography.bodySmall
                                          .copyWith(fontSize: 12)),
                                ),
                              ],
                            ),
                          );
                        }),

                        const Spacer(),

                        // ── CTA Buttons ──────────────────────────────
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: widget.onViewDetails,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _tierColor,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(ModernRadius.sm),
                              ),
                            ),
                            child: Text(
                              'Voir le parcours',
                              style: ModernTypography.labelLarge.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              widget.onWhatsApp?.call(
                                'Je suis intéressé par ${widget.package.title}. Pouvez-vous me proposer un devis?',
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: _tierColor,
                              side:
                                  BorderSide(color: _tierBorder, width: 1.5),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(ModernRadius.sm),
                              ),
                            ),
                            child: Text(
                              'WhatsApp',
                              style: ModernTypography.labelLarge.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
