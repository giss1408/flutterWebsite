import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';
import 'package:flutter_website/models/tour_package.dart';
import 'package:flutter_website/services/whatsapp_service.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TourismPage extends StatefulWidget {
  const TourismPage({super.key});

  @override
  State<TourismPage> createState() => _TourismPageState();
}

class _TourismPageState extends State<TourismPage> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final allTours = [
      TourDatabase.budgetTours.first,
      TourDatabase.premiumTours.first,
      TourDatabase.vipTours.first,
    ];

    return Scaffold(
      backgroundColor: ModernColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ============ APP BAR ============
            Container(
              color: Colors.white,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_rounded),
                        color: ModernColors.textPrimary,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const Spacer(),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Regisse',
                              style: ModernTypography.titleLarge.copyWith(
                                fontWeight: FontWeight.w700,
                                color: ModernColors.textPrimary,
                              ),
                            ),
                            TextSpan(
                              text: '__',
                              style: ModernTypography.titleLarge.copyWith(
                                fontWeight: FontWeight.w700,
                                color: ModernColors.primary,
                              ),
                            ),
                            TextSpan(
                              text: ' Tours',
                              style: ModernTypography.titleLarge.copyWith(
                                fontWeight: FontWeight.w400,
                                color: ModernColors.textTertiary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
              ),
            ),

            // ============ HERO SECTION ============
            SizedBox(
              height: isMobile ? 340 : 460,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/ivory_coast_hero.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: ModernColors.primary,
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ModernColors.primary.withAlpha(179),
                          ModernColors.primary.withAlpha(0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          24, isMobile ? 60 : 100, 24, 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(30),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.white.withAlpha(60)),
                            ),
                            child: Text(
                              'SÉJOURS SUR MESURE',
                              style: ModernTypography.labelSmall.copyWith(
                                color: Colors.white,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Découvrez la\nCôte d\'Ivoire',
                            style: ModernTypography.displayMedium.copyWith(
                              color: Colors.white,
                              fontSize: isMobile ? 36 : 52,
                              height: 1.15,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Des expériences authentiques du golfe de Guinée\naux savanes du nord',
                            style: ModernTypography.bodyLarge.copyWith(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: isMobile ? 14 : 16,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: () {
                              WhatsAppService.openWhatsApp(
                                message:
                                    'Bonjour, je souhaite organiser un séjour en Côte d\'Ivoire. Pouvez-vous m\'aider?',
                              );
                            },
                            icon: const Text('💬'),
                            label: Text(
                              'Parler à un conseiller',
                              style: ModernTypography.labelLarge.copyWith(
                                color: ModernColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: ModernColors.primary,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 28, vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(ModernRadius.sm),
                              ),
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ============ SECTION INTRO ============
            Padding(
              padding: EdgeInsets.fromLTRB(
                  24, isMobile ? 32 : 48, 24, isMobile ? 24 : 32),
              child: Column(
                children: [
                  Text(
                    'Choisissez votre aventure',
                    style: ModernTypography.headlineLarge.copyWith(
                      fontSize: isMobile ? 26 : 32,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Trois formules pensées pour chaque style de voyageur',
                    style: ModernTypography.bodyLarge.copyWith(
                      color: ModernColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // ============ TOUR TIERS SIDE BY SIDE ============
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                rowSpacing: 24,
                columnSpacing: 24,
                rowCrossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(allTours.length, (index) {
                  final package = allTours[index];
                  return ResponsiveRowColumnItem(
                    rowFlex: 1,
                    rowFit: FlexFit.tight,
                    child: TourTierCard(
                      package: package,
                      isHighlighted: package.tier == TourTier.premium,
                      onViewDetails: () {
                        _showTierDetailsModal(context, package);
                      },

                      onWhatsApp: (message) {
                        WhatsAppService.openWhatsApp(message: message);
                      },
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 48),

            // ============ HIGHLIGHTS ============
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
                vertical: isMobile ? 40 : 64,
              ),
              child: Column(
                children: [
                  Text(
                    'Ce qui vous attend',
                    style: ModernTypography.headlineLarge.copyWith(
                      fontSize: isMobile ? 26 : 32,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Des expériences inoubliables à travers tout le pays',
                    style: ModernTypography.bodyLarge.copyWith(
                      color: ModernColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  const HighlightsGrid(),
                ],
              ),
            ),

            // ============ CTA BOTTOM ============
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 32 : 64),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ModernColors.primary,
                    const Color(0xFF0056B3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Prêt pour l\'aventure ?',
                    style: ModernTypography.displaySmall.copyWith(
                      color: Colors.white,
                      fontSize: isMobile ? 28 : 36,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Contactez-nous dès maintenant pour un devis personnalisé',
                    style: ModernTypography.bodyLarge.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      WhatsAppService.openWhatsApp(
                        message:
                            'Bonjour, j\'aimerais un devis personnalisé pour une visite en Côte d\'Ivoire. Pouvez-vous m\'aider?',
                      );
                    },
                    icon: const Text('💬'),
                    label: Text(
                      'Obtenir un devis',
                      style: ModernTypography.labelLarge.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF25D366),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ModernRadius.sm),
                      ),
                      elevation: 0,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      _TrustBadge(text: 'Réponse sous 24h'),
                      _TrustBadge(text: 'Devis gratuit'),
                      _TrustBadge(text: 'Assistance dédiée'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _showTierDetailsModal(BuildContext context, TourPackage package) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.65,
        builder: (context, scrollController) => Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: ModernColors.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(package.tierIcon,
                          color: package.tierColor, size: 28),
                      const SizedBox(width: 12),
                      Text(
                        package.title,
                        style: ModernTypography.headlineSmall.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                package.description,
                style: ModernTypography.bodyMedium.copyWith(
                  color: ModernColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),

              // Inclusions
              Text(
                'Ce qui est inclus',
                style: ModernTypography.titleLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              ...package.inclusions.map((inc) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: package.tierColor,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          inc,
                          style: ModernTypography.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    WhatsAppService.openWhatsApp(
                      message:
                          'Je suis intéressé par ${package.title}. Pouvez-vous me proposer un devis?',
                    );
                  },
                  icon: const Text('💬'),
                  label: const Text('Demander un Devis'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: package.tierColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ModernRadius.sm),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrustBadge extends StatelessWidget {
  final String text;
  const _TrustBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check_circle, color: Colors.white.withOpacity(0.7), size: 14),
        const SizedBox(width: 6),
        Text(
          text,
          style: ModernTypography.bodySmall.copyWith(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
