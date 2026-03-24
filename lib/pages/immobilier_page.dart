import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';

class ImmobilierPage extends StatelessWidget {
  const ImmobilierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Immobilier'),
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
                    'Immobilier',
                    style: ModernTypography.displayLarge.copyWith(
                      color: ModernColors.textWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Find your perfect property in prime locations',
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
                      'Featured Properties',
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
                        _PropertyCard(
                          title: 'Luxury Apartment',
                          location: 'Paris, France',
                          price: '€850,000',
                          icon: Icons.apartment,
                        ),
                        _PropertyCard(
                          title: 'Modern Villa',
                          location: 'Côte d\'Azur',
                          price: '€2,500,000',
                          icon: Icons.home,
                        ),
                        _PropertyCard(
                          title: 'Commercial Space',
                          location: 'Lyon, France',
                          price: '€500,000',
                          icon: Icons.business,
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

class _PropertyCard extends StatelessWidget {
  const _PropertyCard({
    required this.title,
    required this.location,
    required this.price,
    required this.icon,
  });

  final String title;
  final String location;
  final String price;
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
            location,
            style: ModernTypography.bodyMedium.copyWith(
              color: ModernColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            price,
            style: ModernTypography.titleMedium.copyWith(
              color: ModernColors.accentGreen,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
