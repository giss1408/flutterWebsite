import 'package:flutter/material.dart';

/// Enum for tour tier levels
enum TourTier { budget, premium, vip }

/// Represents a tour package
class TourPackage {
  final String title;
  final TourTier tier;
  final double priceMinFCFA;
  final double priceMaxFCFA;
  final List<int> durations; // 10, 14, 21 days
  final String description;
  final List<String> highlights;
  final List<String> inclusions;
  final List<String> exclusions;
  final String accommodation;
  final String guideType; // "shared", "private", "personal"
  final List<String> activities;
  final String imageUrl;
  final Color tierColor;
  final IconData tierIcon;
  final int popularity; // 1-5 stars

  TourPackage({
    required this.title,
    required this.tier,
    required this.priceMinFCFA,
    required this.priceMaxFCFA,
    required this.durations,
    required this.description,
    required this.highlights,
    required this.inclusions,
    required this.exclusions,
    required this.accommodation,
    required this.guideType,
    required this.activities,
    required this.imageUrl,
    required this.tierColor,
    required this.tierIcon,
    required this.popularity,
  });

  // Convert FCFA to USD (approximately)
  double get priceMinUSD => priceMinFCFA / 610;
  double get priceMaxUSD => priceMaxFCFA / 610;

  // Format price display
  String formatPrice(bool isUSD) {
    if (isUSD) {
      return '\$${priceMinUSD.toStringAsFixed(0)} - \$${priceMaxUSD.toStringAsFixed(0)}';
    }
    return 'FCFA ${priceMinFCFA.toStringAsFixed(0)} - ${priceMaxFCFA.toStringAsFixed(0)}';
  }
}

/// Represents a single day in itinerary
class ItineraryDay {
  final int dayNumber;
  final String title;
  final String description;
  final List<String> activities;
  final String accommodation;
  final String meals; // "B,L,D" for breakfast, lunch, dinner

  ItineraryDay({
    required this.dayNumber,
    required this.title,
    required this.description,
    required this.activities,
    required this.accommodation,
    required this.meals,
  });
}

/// Sample tour packages for Côte d'Ivoire
class TourDatabase {
  static final List<TourPackage> budgetTours = [
    TourPackage(
      title: 'Budget Adventure',
      tier: TourTier.budget,
      priceMinFCFA: 450000,
      priceMaxFCFA: 650000,
      durations: [10, 14, 21],
      description: 'Authentic Côte d\'Ivoire experience with local insights',
      highlights: [
        'Market Tours',
        'Beach Exploration',
        'Cultural Village Visits',
        'Local Cuisine Tasting',
        'Scenic Photography',
        'Community Interactions'
      ],
      inclusions: [
        'Accommodation (3-star)',
        'Breakfast daily',
        'Group tours',
        'Tourist guide',
        'Transportation',
      ],
      exclusions: [
        'International flights',
        'Travel insurance',
        'Lunch & dinner',
        'Optional activities',
      ],
      accommodation: '3-star hotels',
      guideType: 'shared',
      activities: ['🎭 Cultural', '🏖️ Beach', '📸 Photography', '🍽️ Cuisine'],
      imageUrl: 'images/budget_tour.jpg',
      tierColor: Color(0xFF00B369),
      tierIcon: Icons.forest,
      popularity: 4,
    ),
  ];

  static final List<TourPackage> premiumTours = [
    TourPackage(
      title: 'Premium Explorer',
      tier: TourTier.premium,
      priceMinFCFA: 1200000,
      priceMaxFCFA: 1800000,
      durations: [10, 14, 21],
      description: 'Curated experiences with comfortable accommodations',
      highlights: [
        'Safari Experience',
        'Art Workshops',
        'Fine Dining',
        'Waterfall Hikes',
        'Luxury Stays',
        'Private Activities'
      ],
      inclusions: [
        'Accommodation (4-5 star)',
        'All meals included',
        'Private guide',
        'All activities',
        'Premium transportation',
        'Travel insurance',
      ],
      exclusions: [
        'International flights',
        'Personal expenses',
        'Alcohol & beverages',
      ],
      accommodation: '4-5 star hotels',
      guideType: 'private',
      activities: ['🦁 Safari', '🎨 Art', '🍽️ Fine Dining', '⛰️ Hiking'],
      imageUrl: 'images/premium_tour.jpg',
      tierColor: Color(0xFFFFB700),
      tierIcon: Icons.star_rate,
      popularity: 5,
    ),
  ];

  static final List<TourPackage> vipTours = [
    TourPackage(
      title: 'VIP Luxury Experience',
      tier: TourTier.vip,
      priceMinFCFA: 3000000,
      priceMaxFCFA: 5000000,
      durations: [10, 14, 21],
      description: 'Ultimate luxury experience with exclusive access and services',
      highlights: [
        'Private Yacht Cruise',
        'Michelin Chef Meals',
        'Helicopter Tours',
        'Exclusive Beach Clubs',
        'Spa & Wellness',
        'Personal Concierge'
      ],
      inclusions: [
        'Luxury resort (5-star)',
        'All meals (chef-prepared)',
        'Personal concierge',
        'Private helicopter tours',
        'Exclusive yacht access',
        'Spa treatments',
        'Luxury transportation',
        'Priority services',
      ],
      exclusions: [
        'International flights (can arrange)',
        'Personal shopping & gifts',
      ],
      accommodation: '5-star luxury resorts',
      guideType: 'personal',
      activities: ['🛥️ Yacht', '💎 Luxury', '👑 Exclusive', '✈️ Helicopter'],
      imageUrl: 'images/vip_tour.jpg',
      tierColor: Color(0xFF7C3AED),
      tierIcon: Icons.verified_user,
      popularity: 5,
    ),
  ];

  // Sample 10-day itinerary
  static final List<ItineraryDay> itinerary10Days = [
    ItineraryDay(
      dayNumber: 1,
      title: 'Arrival in Abidjan',
      description: 'Welcome to Côte d\'Ivoire! Arrive at Félix Houphouët-Boigny International Airport, meet your guide, and transfer to your hotel.',
      activities: ['Airport pickup', 'Hotel check-in', 'Welcome briefing', 'Evening stroll'],
      accommodation: 'Hotel Abidjan',
      meals: 'D',
    ),
    ItineraryDay(
      dayNumber: 2,
      title: 'Abidjan City Tour',
      description: 'Explore Abidjan\'s vibrant culture, markets, and architecture. Visit the Basilica of Our Lady of Peace and the Plateau district.',
      activities: ['City tour', 'Basilica visit', 'Market exploration', 'Local cuisine'],
      accommodation: 'Hotel Abidjan',
      meals: 'B,L,D',
    ),
    ItineraryDay(
      dayNumber: 3,
      title: 'Assinie Beach',
      description: 'Drive to the beautiful Assinie Beach. Relax on pristine sands and enjoy fresh seafood.',
      activities: ['Beach relaxation', 'Seafood lunch', 'Sunset walk', 'Beach activities'],
      accommodation: 'Beachfront Resort',
      meals: 'B,L,D',
    ),
    ItineraryDay(
      dayNumber: 4,
      title: 'Taï National Park',
      description: 'Journey to UNESCO-listed Taï National Park. Spot wildlife including elephants and rare chimpanzees.',
      activities: ['Jungle trek', 'Wildlife viewing', 'Nature photography', 'Local guides'],
      accommodation: 'Park Lodge',
      meals: 'B,L,D',
    ),
    ItineraryDay(
      dayNumber: 5,
      title: 'Rural Village Experience',
      description: 'Visit traditional villages and experience authentic Ivorian culture. Participate in local activities and crafts.',
      activities: ['Village tour', 'Cultural exchange', 'Craft workshops', 'Home cooking'],
      accommodation: 'Eco-lodge',
      meals: 'B,L,D',
    ),
    ItineraryDay(
      dayNumber: 6,
      title: 'Cascades d\'Yapo Waterfall',
      description: 'Trek to the stunning Cascades d\'Yapo. Swim in natural pools surrounded by lush vegetation.',
      activities: ['Waterfall hike', 'Swimming', 'Picnic lunch', 'Photography'],
      accommodation: 'Jungle Resort',
      meals: 'B,L,D',
    ),
    ItineraryDay(
      dayNumber: 7,
      title: 'San Pédro Coffee Region',
      description: 'Visit coffee plantations in San Pédro. Learn about coffee production and taste premium local varieties.',
      activities: ['Plantation tour', 'Coffee tasting', 'Farmer meeting', 'Shopping'],
      accommodation: 'Coffee Resort',
      meals: 'B,L,D',
    ),
    ItineraryDay(
      dayNumber: 8,
      title: 'Mont Sopire & Hiking',
      description: 'Hike Mont Sopire for panoramic views of the region. Enjoy picnic and wildlife spotting.',
      activities: ['Mountain hike', 'Panoramic views', 'Picnic', 'Birdwatching'],
      accommodation: 'Mountain Lodge',
      meals: 'B,L,D',
    ),
    ItineraryDay(
      dayNumber: 9,
      title: 'Relaxation & Spa',
      description: 'Enjoy a day of relaxation with spa treatments and beach activities.',
      activities: ['Spa treatments', 'Beach time', 'Wellness', 'Sunset dinner'],
      accommodation: 'Luxury Hotel',
      meals: 'B,L,D',
    ),
    ItineraryDay(
      dayNumber: 10,
      title: 'Departure',
      description: 'Enjoy final breakfast and transfer to the airport for your departure.',
      activities: ['Breakfast', 'Last-minute shopping', 'Airport transfer'],
      accommodation: 'N/A',
      meals: 'B',
    ),
  ];
}
