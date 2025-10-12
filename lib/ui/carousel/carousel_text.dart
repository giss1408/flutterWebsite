import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';

RichText slide1Text = RichText(
  text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Campagnes qui', style: carouselWhiteTextStyle),
      TextSpan(text: ' captivent ', style: carouselGreenTextStyle),
      //TextSpan(text: 'campaign', style: carouselGreenTextStyle)
    ],
  ),
  textAlign: TextAlign.center,
);

RichText slide2Text = RichText(
  text: const TextSpan(
    children: <TextSpan>[
      //Design qui inspire, impact qui dure
      TextSpan(text: 'Créez,', style: carouselWhiteTextStyle),
      TextSpan(text: ' Inspirez,', style: carouselGreenTextStyle),
      TextSpan(text: ' Transformez', style: carouselGreenTextStyle),
    ],
  ),
  textAlign: TextAlign.center,
);

RichText slide3Text = RichText(
  text: const TextSpan(
    children: <TextSpan>[
      //Design moderne, impact durable
      TextSpan(text: 'Design moderne,', style: carouselWhiteTextStyle),
      TextSpan(text: ' impact durable ', style: carouselOrangeTextStyle),
      //TextSpan(text: 'campaign', style: carouselOrangeTextStyle)
    ],
  ),
  textAlign: TextAlign.center,
);

RichText slide4Text = RichText(
  text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Toujours', style: carouselBrownTextStyle),
      TextSpan(text: '- partout', style: carouselWhiteTextStyle),
      TextSpan(text: '- Mobiles', style: carouselBrownTextStyle)
    ],
    style: TextStyle(height: 1.1),
  ),
  textAlign: TextAlign.center,
);
