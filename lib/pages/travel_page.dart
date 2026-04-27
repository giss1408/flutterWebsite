import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';
import 'package:flutter_website/providers/locale_provider.dart';
import 'package:provider/provider.dart';


class TravelPage extends StatelessWidget {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.watch<LocaleProvider>().tr;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('travel.title')),
        elevation: 0,
        backgroundColor: ModernColors.backgroundCard,
        foregroundColor: ModernColors.textPrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              decoration: BoxDecoration(
                gradient: ModernColors.primaryGradient,
              ),
              child: Column(
                children: [
                  Text(
                    tr('travel.title'),
                    style: ModernTypography.displayLarge.copyWith(
                      color: ModernColors.textWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    tr('travel.subtitle'),
                    style: ModernTypography.bodyLarge.copyWith(
                      color: ModernColors.textWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Content Section
            Padding(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured Destinations',
                      style: ModernTypography.headlineLarge,
                    ),
                    const SizedBox(height: 32),
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24,
                      children: [
                        _TravelCard(
                          title: 'Paris, France',
                          description: 'Explore the city of love and culture',
                          icon: Icons.tour,
                        ),
                        _TravelCard(
                          title: 'Tokyo, Japan',
                          description: 'Experience modern and traditional Japan',
                          icon: Icons.tour,
                        ),
                        _TravelCard(
                          title: 'New York, USA',
                          description: 'The city that never sleeps awaits',
                          icon: Icons.tour,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TravelCard extends StatelessWidget {
  const _TravelCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ModernColors.backgroundCard,
        borderRadius: BorderRadius.circular(ModernRadius.lg),
        border: Border.all(color: ModernColors.border, width: 1),
        boxShadow: ModernShadows.elevation2,
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: ModernColors.primary),
          const SizedBox(height: 16),
          Text(
            title,
            style: ModernTypography.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: ModernTypography.bodyMedium.copyWith(
              color: ModernColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
