import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';
import 'package:flutter_website/models/tour_package.dart';

/// Collapsible itinerary section display
class ItinerarySection extends StatefulWidget {
  final List<ItineraryDay> itinerary;
  final int defaultDuration;
  final Color tierColor;

  const ItinerarySection({
    super.key,
    required this.itinerary,
    required this.defaultDuration,
    required this.tierColor,
  });

  @override
  State<ItinerarySection> createState() => _ItinerarySectionState();
}

class _ItinerarySectionState extends State<ItinerarySection> {
  int _expandedDay = -1; // -1 means none expanded
  late int _selectedDuration;

  @override
  void initState() {
    super.initState();
    _selectedDuration = widget.defaultDuration;
  }

  @override
  Widget build(BuildContext context) {
    final filteredItinerary = widget.itinerary
        .take(_selectedDuration)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Duration tabs
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final duration in [10, 14, 21])
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: FilterChip(
                      label: Text('$duration Days'),
                      selected: _selectedDuration == duration,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedDuration = duration;
                            _expandedDay = -1; // Reset expanded day
                          });
                        }
                      },
                      backgroundColor: ModernColors.backgroundCard,
                      selectedColor: widget.tierColor.withAlpha(77), // 30% opacity
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ModernRadius.md),
                        side: BorderSide(
                          color: _selectedDuration == duration
                              ? widget.tierColor
                              : ModernColors.border,
                          width: 1.5,
                        ),
                      ),
                      labelStyle: ModernTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: _selectedDuration == duration
                            ? widget.tierColor
                            : ModernColors.textSecondary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

        // Timeline
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredItinerary.length,
          itemBuilder: (context, index) {
            final day = filteredItinerary[index];
            final isExpanded = _expandedDay == index;
            final isLastDay = index == filteredItinerary.length - 1;

            return _ItineraryDayTile(
              day: day,
              isExpanded: isExpanded,
              isLastDay: isLastDay,
              tierColor: widget.tierColor,
              onTap: () {
                setState(() {
                  _expandedDay = isExpanded ? -1 : index;
                });
              },
            );
          },
        ),
      ],
    );
  }
}

/// Individual day tile in itinerary
class _ItineraryDayTile extends StatelessWidget {
  final ItineraryDay day;
  final bool isExpanded;
  final bool isLastDay;
  final Color tierColor;
  final VoidCallback onTap;

  const _ItineraryDayTile({
    required this.day,
    required this.isExpanded,
    required this.isLastDay,
    required this.tierColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final mealSymbols = day.meals.split(',');
    final hasMeals = day.meals.isNotEmpty && day.meals != 'N/A';

    return Column(
      children: [
        // Connecting line + day node
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline
              Column(
                children: [
                  // Day circle
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: tierColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${day.dayNumber}',
                        style: ModernTypography.bodySmall.copyWith(
                          color: ModernColors.textWhite,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  // Connecting line
                  if (!isLastDay)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: tierColor.withAlpha(102), // 40% opacity
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 20),
              // Day content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isExpanded
                            ? tierColor.withAlpha(26) // 10% opacity
                            : ModernColors.backgroundCard,
                        borderRadius: BorderRadius.circular(ModernRadius.md),
                        border: Border.all(
                          color: isExpanded
                              ? tierColor.withAlpha(77) // 30% opacity
                              : ModernColors.border,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        day.title,
                                        style:
                                            ModernTypography.bodyLarge.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      if (day.accommodation.isNotEmpty &&
                                          day.accommodation != 'N/A')
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.apartment,
                                                size: 14,
                                                color: ModernColors
                                                    .textTertiary,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                day.accommodation,
                                                style: ModernTypography
                                                    .bodySmall
                                                    .copyWith(
                                                  color: ModernColors
                                                      .textTertiary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  isExpanded
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  color: tierColor,
                                ),
                              ],
                            ),

                            // Meals indicator
                            if (hasMeals)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Wrap(
                                  spacing: 4,
                                  children: mealSymbols.map((meal) {
                                    IconData mealIcon;
                                    String mealName;
                                    switch (meal.trim()) {
                                      case 'B':
                                        mealIcon = Icons.emoji_food_beverage;
                                        mealName = 'Breakfast';
                                        break;
                                      case 'L':
                                        mealIcon = Icons.lunch_dining;
                                        mealName = 'Lunch';
                                        break;
                                      case 'D':
                                        mealIcon = Icons.dinner_dining;
                                        mealName = 'Dinner';
                                        break;
                                      default:
                                        mealIcon = Icons.fastfood;
                                        mealName = meal;
                                    }
                                    return Tooltip(
                                      message: mealName,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: tierColor.withAlpha(26),
                                          borderRadius: BorderRadius.circular(
                                            ModernRadius.sm,
                                          ),
                                        ),
                                        child: Icon(
                                          mealIcon,
                                          size: 16,
                                          color: tierColor,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),

                            // Expanded details
                            if (isExpanded) ...[
                              const SizedBox(height: 12),
                              const Divider(height: 1),
                              const SizedBox(height: 12),
                              // Description
                              Text(
                                day.description,
                                style: ModernTypography.bodyMedium.copyWith(
                                  color: ModernColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Activities
                              Text(
                                'Activities & Highlights',
                                style: ModernTypography.bodySmall.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: day.activities.map((activity) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: tierColor.withAlpha(41), // 16%
                                      borderRadius: BorderRadius.circular(
                                        ModernRadius.sm,
                                      ),
                                    ),
                                    child: Text(
                                      activity,
                                      style: ModernTypography.bodySmall
                                          .copyWith(
                                        color: tierColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
