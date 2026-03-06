import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';
import 'package:flutter_website/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:universal_io/io.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WebsiteMenuBar extends StatelessWidget {
  const WebsiteMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    const Color navLinkColor = Color(0xFF6E7274);
    return Container(
      height: 66,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Color(0x1A000000), offset: Offset(0, 2), blurRadius: 4)
      ]),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.menu, color: textPrimary, size: 28)),
          Flexible(
            fit: FlexFit.loose,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () =>
                    Navigator.of(context).popUntil((route) => route.isFirst),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 16, 5),
                  // height: 40 matches the actual available height
                  // (row 50 px − 5 px top/bottom padding = 40 px).
                  // The previous height: 100 caused flutter_svg to compute
                  // an intrinsic width based on the 100 px height, making the
                  // Row overflow by ~0.7 px regardless of the Spacer.
                  child: SvgPicture.asset("assets/images/logo.svg",
                      height: 40, fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          /*ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: MOBILE)],
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 0),
              child: TextButton(
                onPressed: () =>
                    openUrl("https://flutter.dev/docs/get-started/install"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(primary),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return buttonPrimaryDark;
                        }
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return buttonPrimaryDarkPressed;
                        }
                        return primary;
                      },
                    ),
                    // Shape sets the border radius from default 3 to 0.
                    shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)));
                        }
                        return const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)));
                      },
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 28)),
                    // Side adds pressed highlight outline.
                    side: MaterialStateProperty.resolveWith<BorderSide>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return const BorderSide(
                            width: 3, color: buttonPrimaryPressedOutline);
                      }
                      // Transparent border placeholder as Flutter does not allow
                      // negative margins.
                      return const BorderSide(width: 3, color: Colors.white);
                    })),
                child: Text(
                  "Regisse__  #Business Solutions ...",
                  style: buttonTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),*/
          const Spacer(),
          ResponsiveVisibility(
            visible: false,
            visibleConditions: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => {}, // openUrl("https://flutter.dev/docs"),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Travel",
                      style: TextStyle(
                          fontSize: 16,
                          color: navLinkColor,
                          fontFamily: fontFamily)),
                ),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleConditions: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => {}, //openUrl("https://flutter.dev/showcase"),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Immobilier",
                      style: TextStyle(
                          fontSize: 16,
                          color: navLinkColor,
                          fontFamily: fontFamily)),
                ),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleConditions: const [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => {}, //openUrl("https://flutter.dev/community"),
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Loisir",
                        style: TextStyle(
                            fontSize: 16,
                            color: navLinkColor,
                            fontFamily: fontFamily))),
              ),
            ),
          ),
          /*const ResponsiveVisibility(
            visible: false,
            visibleConditions: [Condition.largerThan(name: MOBILE)],
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: ImageIcon(
                    AssetImage("assets/images/icon_search_64x.png"),
                    color: navLinkColor,
                    size: 24),
              ),
            ),
          ),*/
          /*MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => openUrl('https://twitter.com/flutterdev'),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ImageIcon(
                    AssetImage("assets/images/icon_twitter_64x.png"),
                    color: navLinkColor,
                    size: 24),
              ),
            ),
          ),*/
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => {}, //openUrl('https://www.youtube.com/flutterdev'),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ImageIcon(
                    AssetImage("assets/images/icon_youtube_64x.png"),
                    color: navLinkColor,
                    size: 24),
              ),
            ),
          ),
          /*MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => openUrl('https://github.com/flutter'),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ImageIcon(
                    AssetImage("assets/images/icon_github_64x.png"),
                    color: navLinkColor,
                    size: 24),
              ),
            ),
          ),*/
          /* ResponsiveVisibility(
            visible: false,
            visibleConditions: const [Condition.largerThan(name: MOBILE)],
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 0),
              child: TextButton(
                onPressed: () =>
                    openUrl("https://flutter.dev/docs/get-started/install"),
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(primary),
                    overlayColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.hovered)) {
                          return buttonPrimaryDark;
                        }
                        if (states.contains(WidgetState.focused) ||
                            states.contains(WidgetState.pressed)) {
                          return buttonPrimaryDarkPressed;
                        }
                        return primary;
                      },
                    ),
                    // Shape sets the border radius from default 3 to 0.
                    shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.focused) ||
                            states.contains(WidgetState.pressed)) {
                          return const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)));
                        }
                        return const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)));
                      },
                    ),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 28)),
                    // Side adds pressed highlight outline.
                    side: WidgetStateProperty.resolveWith<BorderSide>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.focused) ||
                          states.contains(WidgetState.pressed)) {
                        return const BorderSide(
                            width: 3, color: buttonPrimaryPressedOutline);
                      }
                      // Transparent border placeholder as Flutter does not allow
                      // negative margins.
                      return const BorderSide(width: 3, color: Colors.white);
                    })),
                child: Text(
                  "Get started",
                  style: buttonTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 56),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 820),
          child: Column(
            children: [
              // ── Origin badge ─────────────────────────────────────────────
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: primaryLight,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("🇩🇪  Made in Germany  •  Propulsé par ",
                        style: bodyTextStyle.copyWith(
                            fontSize: 12, color: primary)),
                    Image.asset("assets/images/google_logo.png",
                        width: 52, height: 18, fit: BoxFit.contain),
                  ],
                ),
              ),

              // ── Hero headline ─────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(top: 28, bottom: 16),
                child: Text(
                  "Transformez vos idées en\nsolutions digitales performantes",
                  style: headlineTextStyle.copyWith(
                      fontSize: 38, height: 1.25),
                  textAlign: TextAlign.center,
                ),
              ),

              // ── Sub-headline ──────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  "De la conception au déploiement en quelques semaines — "
                  "des plateformes SaaS sécurisées, scalables et "
                  "taillées pour accélérer votre croissance.",
                  style: bodyTextStyle.copyWith(fontSize: 18, height: 1.7),
                  textAlign: TextAlign.center,
                ),
              ),

              // ── Three value pillars ───────────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ResponsiveRowColumn(
                  layout: ResponsiveBreakpoints.of(context)
                          .smallerThan(TABLET)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  rowSpacing: 24,
                  columnSpacing: 16,
                  children: const [
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      rowFit: FlexFit.tight,
                      child: _ValuePillar(
                        icon: Icons.rocket_launch_outlined,
                        stat: "4 semaines",
                        label: "Du brief à la mise en production",
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      rowFit: FlexFit.tight,
                      child: _ValuePillar(
                        icon: Icons.verified_user_outlined,
                        stat: "100 % RGPD",
                        label: "Sécurité & conformité garanties",
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      rowFit: FlexFit.tight,
                      child: _ValuePillar(
                        icon: Icons.trending_up,
                        stat: "ROI dès J+30",
                        label: "Résultats mesurables dès le 1er mois",
                      ),
                    ),
                  ],
                ),
              ),

              // ── Body description ──────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: RichText(
                  text: TextSpan(
                    style: bodyTextStyle.copyWith(fontSize: 16, height: 1.8),
                    children: [
                      const TextSpan(
                          text: "Regisse__ #Business Solutions est une "),
                      TextSpan(
                          text: "société tech franco-allemande",
                          style: bodyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: primary)),
                      const TextSpan(
                          text:
                              " spécialisée dans le développement de plateformes "),
                      TextSpan(
                          text: "SaaS sur mesure",
                          style: bodyTextStyle.copyWith(
                              fontSize: 16, color: primary)),
                      const TextSpan(
                          text:
                              ". Nous combinons ingénierie de pointe, design "
                              "intuitif et compréhension métier pour vous "
                              "livrer des produits "),
                      TextSpan(
                          text: "simples, sécurisés et rapidement déployés",
                          style: bodyTextStyle.copyWith(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: primary)),
                      const TextSpan(
                          text: " — quel que soit votre secteur d'activité."),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // ── CTA buttons ───────────────────────────────────────────────
              ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                rowMainAxisAlignment: MainAxisAlignment.center,
                rowCrossAxisAlignment: CrossAxisAlignment.center,
                rowSpacing: 16,
                columnSpacing: 12,
                children: [
                  ResponsiveRowColumnItem(
                    child: TextButton(
                      onPressed: () => {},
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all<Color>(primary),
                          overlayColor:
                              WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.hovered)) {
                                return buttonPrimaryDark;
                              }
                              if (states.contains(WidgetState.focused) ||
                                  states.contains(WidgetState.pressed)) {
                                return buttonPrimaryDarkPressed;
                              }
                              return primary;
                            },
                          ),
                          shape:
                              WidgetStateProperty.all(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)))),
                          padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 48)),
                          side: WidgetStateProperty.resolveWith<BorderSide>(
                              (Set<WidgetState> states) {
                            if (states.contains(WidgetState.focused) ||
                                states.contains(WidgetState.pressed)) {
                              return const BorderSide(
                                  width: 3,
                                  color: buttonPrimaryPressedOutline);
                            }
                            return const BorderSide(
                                width: 3, color: Colors.transparent);
                          })),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Démarrer mon projet",
                              style: buttonTextStyle.copyWith(fontSize: 17)),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward,
                              color: Colors.white, size: 18),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: TextButton(
                      onPressed: () => {},
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4))),
                        side: const BorderSide(color: primary, width: 1.5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 32),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.play_circle_outline,
                              size: 22, color: primary),
                          const SizedBox(width: 8),
                          Text("Voir nos réalisations",
                              style: buttonTextStyle.copyWith(
                                  fontSize: 16, color: primary)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // ── Social proof footnote ─────────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  "✓ Sans engagement initial   ✓ Accompagnement dédié   ✓ Support continu",
                  style: bodyTextStyle.copyWith(
                      fontSize: 13,
                      color: const Color(0xFF888888),
                      height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A compact value-pillar card used inside [GetStarted].
class _ValuePillar extends StatelessWidget {
  final IconData icon;
  final String stat;
  final String label;

  const _ValuePillar({
    required this.icon,
    required this.stat,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: primaryLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: primary, size: 32),
          const SizedBox(height: 10),
          Text(stat,
              style: headlineSecondaryTextStyle.copyWith(
                  fontSize: 22, color: primary),
              textAlign: TextAlign.center),
          const SizedBox(height: 6),
          Text(label,
              style: bodyTextStyle.copyWith(
                  fontSize: 13, color: const Color(0xFF6E7274)),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop =
        !ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : 25, vertical: isDesktop ? 72 : 48),
      child: Column(
        children: [
          // ── Section header ───────────────────────────────────────────────
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: primaryLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text("NOS EXPERTISES",
                style: bodyTextStyle.copyWith(
                    fontSize: 11,
                    color: primary,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 18),
          Text(
            "Tout ce dont votre business digital a besoin",
            style: headlineTextStyle.copyWith(fontSize: 32),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),
          Text(
            "Trois piliers — vitesse, design et sur-mesure — pour transformer\n"
            "votre vision en produit opérationnel.",
            style: bodyTextStyle.copyWith(
                fontSize: 16, color: const Color(0xFF6E7274), height: 1.7),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 56),

          // ── Three feature cards ──────────────────────────────────────────
          ResponsiveRowColumn(
            layout: isDesktop
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            columnMainAxisSize: MainAxisSize.min,
            rowSpacing: 32,
            columnSpacing: 32,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: _FeatureCard(
                  imagePath: "assets/images/icon_development.png",
                  tag: "Delivery",
                  title: "Déploiement Rapide",
                  description:
                      "De l'idée à la mise en production en quelques semaines. "
                      "Nos cycles agiles courts vous permettent de valider, "
                      "itérer et lancer avant vos concurrents — sans rogner "
                      "sur la qualité ni la sécurité.",
                  linkLabel: "Notre méthode →",
                  onLinkTap: () => {},
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: _FeatureCard(
                  imagePath: "assets/images/icon_ui.png",
                  tag: "Design",
                  title: "UI Expressive & Flexible",
                  description:
                      "Chaque interface est pensée pour l'utilisateur final. "
                      "Nous combinons Material Design, animations fluides et "
                      "identité visuelle personnalisée pour offrir une "
                      "expérience mémorable sur tous les supports.",
                  linkLabel: "Voir nos maquettes →",
                  onLinkTap: () => {},
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: _FeatureCard(
                  imagePath: "assets/images/icon_performance.png",
                  tag: "Sur-mesure",
                  title: "Solutions Adaptées à Votre Marché",
                  description:
                      "Pas de template générique — chaque solution est "
                      "construite autour de vos processus métier, de votre "
                      "secteur et de vos objectifs de croissance. Vous "
                      "gardez la maîtrise; nous apportons l'ingénierie.",
                  linkLabel: "Nos secteurs →",
                  onLinkTap: () => {},
                ),
              ),
            ],
          ),

          // ── Bottom CTA ───────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: OutlinedButton(
              onPressed: () => {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: primary, width: 1.5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 36),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Découvrir tous nos services",
                      style: bodyTextStyle.copyWith(
                          color: primary, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, color: primary, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A self-contained feature card used inside [Features].
class _FeatureCard extends StatelessWidget {
  final String imagePath;
  final String tag;
  final String title;
  final String description;
  final String linkLabel;
  final VoidCallback onLinkTap;

  const _FeatureCard({
    required this.imagePath,
    required this.tag,
    required this.title,
    required this.description,
    required this.linkLabel,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFBFD),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon circle
          buildMaterialIconCircle(imagePath, 64),
          const SizedBox(height: 20),

          // Category tag
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: primaryLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(tag,
                style: bodyTextStyle.copyWith(
                    fontSize: 11,
                    color: primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8)),
          ),
          const SizedBox(height: 12),

          // Title
          Text(title,
              style: headlineSecondaryTextStyle.copyWith(fontSize: 20)),
          const SizedBox(height: 8),

          // Divider
          Container(
              width: 32, height: 2, color: primary, margin:
              const EdgeInsets.only(bottom: 14)),

          // Description
          Text(description,
              style: bodyTextStyle.copyWith(
                  fontSize: 15, height: 1.7, color: const Color(0xFF5A5F63))),
          const SizedBox(height: 20),

          // Learn-more link
          GestureDetector(
            onTap: onLinkTap,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(linkLabel,
                  style: bodyTextStyle.copyWith(
                      fontSize: 14,
                      color: primary,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class BusinessDevelopment extends StatefulWidget {
  const BusinessDevelopment({super.key});

  @override
  State<BusinessDevelopment> createState() => _BusinessDevelopmentState();
}

class _BusinessDevelopmentState extends State<BusinessDevelopment> {
  late VideoPlayerController videoController;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.asset("assets/videos/BusinessDevelopment.mp4");
    videoController.setVolume(0);
    videoController.setLooping(true);
    initializeVideoPlayerFuture = videoController.initialize().then((_) {
      if (mounted) {
        // Display the first frame of the video before playback.
        setState(() {});
        videoPlay();
      }
    });
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  void videoPlay() {
    videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      padding: blockPadding(context),
      child: ResponsiveRowColumn(
        layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 2,
            child: FutureBuilder(
              future: initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the VideoPlayer.
                  return AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: RepaintBoundary(child: VideoPlayer(videoController)),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Container();
                }
              },
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildMaterialIconCircle(
                      "assets/images/icon_development.png", 68),
                  const SizedBox(height: 16),
                  // ── Tag badge ──────────────────────────────────────────
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: primaryLight,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text("INNOVATION",
                        style: bodyTextStyle.copyWith(
                            fontSize: 11,
                            color: primary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.9)),
                  ),
                  const SizedBox(height: 14),
                  const Text("Solutions Business Innovantes",
                      style: headlineTextStyle),
                  const SizedBox(height: 10),
                  // ── Accent bar ─────────────────────────────────────────
                  Container(
                      width: 32,
                      height: 2,
                      color: primary,
                      margin: const EdgeInsets.only(bottom: 18)),
                  Text(
                    "Nous transformons vos ambitions en produits digitaux "
                    "concrets. Développement agile en sprints courts, "
                    "intégration continue et livraison sécurisée — pour que "
                    "chaque euro investi génère un retour mesurable dès "
                    "le premier mois.",
                    style: bodyTextStyle.copyWith(height: 1.7),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => {},
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Découvrir nos services",
                              style: bodyTextStyle.copyWith(
                                  color: primary,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 6),
                          const Icon(Icons.arrow_forward,
                              color: primary, size: 14),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BeautifulUI extends StatefulWidget {
  const BeautifulUI({super.key});

  @override
  State<BeautifulUI> createState() => _BeautifulUIState();
}

class _BeautifulUIState extends State<BeautifulUI> {
  late VideoPlayerController videoController;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoController =
        VideoPlayerController.asset("assets/videos/BeautifulUI.mp4");
    videoController.setVolume(0);
    videoController.setLooping(true);
    initializeVideoPlayerFuture = videoController.initialize().then((_) {
      if (mounted) {
        // Display the first frame of the video before playback.
        setState(() {});
        videoPlay();
      }
    });
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  void videoPlay() {
    videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      padding: blockPadding(context),
      child: ResponsiveRowColumn(
        layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            columnOrder: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildMaterialIconCircle("assets/images/icon_ui.png", 68),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: primaryLight,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text("DESIGN & UX",
                        style: bodyTextStyle.copyWith(
                            fontSize: 11,
                            color: primary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.9)),
                  ),
                  const SizedBox(height: 14),
                  const Text("Interfaces Conçues pour Convertir",
                      style: headlineTextStyle),
                  const SizedBox(height: 10),
                  Container(
                      width: 32,
                      height: 2,
                      color: primary,
                      margin: const EdgeInsets.only(bottom: 18)),
                  Text(
                    "Vos utilisateurs méritent mieux qu'un template générique. "
                    "Chaque écran est pensé pour guider l'action, renforcer "
                    "votre identité de marque et offrir une expérience fluide "
                    "— sur mobile, tablette et desktop.",
                    style: bodyTextStyle.copyWith(height: 1.7),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => {},
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Voir nos références",
                              style: bodyTextStyle.copyWith(
                                  color: primary,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 6),
                          const Icon(Icons.arrow_forward,
                              color: primary, size: 14),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 2,
            columnOrder: 1,
            child: FutureBuilder(
              future: initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the VideoPlayer.
                  return AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: RepaintBoundary(child: VideoPlayer(videoController)),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NativePerformance extends StatefulWidget {
  const NativePerformance({super.key});

  @override
  State<NativePerformance> createState() => _NativePerformanceState();
}

class _NativePerformanceState extends State<NativePerformance> {
  late VideoPlayerController videoController;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoController =
        VideoPlayerController.asset("assets/videos/NativePerformance.mp4");
    videoController.setVolume(0);
    videoController.setLooping(true);
    initializeVideoPlayerFuture = videoController.initialize().then((_) {
      if (mounted) {
        // Display the first frame of the video before playback.
        setState(() {});
        videoPlay();
      }
    });
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  void videoPlay() {
    videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      padding: blockPadding(context),
      child: ResponsiveRowColumn(
        layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 2,
            child: FutureBuilder(
              future: initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the VideoPlayer.
                  return AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: RepaintBoundary(child: VideoPlayer(videoController)),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Container();
                }
              },
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: buildMaterialIconCircle(
                        "assets/images/icon_performance.png", 68),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Text("Native Performance", style: headlineTextStyle),
                  ),
                  RichText(
                    text: TextSpan(
                      style: bodyTextStyle,
                      children: [
                        const TextSpan(
                            text:
                                "Flutter’s widgets incorporate all critical platform differences such as scrolling, navigation, icons and fonts to provide full native performance on both iOS and Android."),
                        const TextSpan(text: "\n\n"),
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            /* openUrl("https://flutter.dev/showcase");
                              },*/
                            text: "Examples of apps built with Flutter",
                            style: bodyLinkTextStyle),
                        const TextSpan(text: "\n\n"),
                        TextSpan(
                            text: "Demo design inspired by ",
                            style: bodyTextStyle.copyWith(fontSize: 12)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            /*openUrl("https://dribbble.com/aureliensalomon");
                              },*/
                            text: "Aurélien Salomon",
                            style: bodyTextStyle.copyWith(
                                fontSize: 12, color: primary)),
                        TextSpan(
                            text: "'s ",
                            style: bodyTextStyle.copyWith(fontSize: 12)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            /*openUrl(
                                    "https://dribbble.com/shots/2940231-Google-Newsstand-Navigation-Pattern");
                              },*/
                            text: "Google Newsstand Navigation Pattern",
                            style: bodyTextStyle.copyWith(
                                fontSize: 12, color: primary)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LearnFromDevelopers extends StatefulWidget {
  const LearnFromDevelopers({super.key});

  @override
  State<LearnFromDevelopers> createState() => _LearnFromDevelopersState();
}

class _LearnFromDevelopersState extends State<LearnFromDevelopers> {
  final String videoUrl = "https://www.youtube.com/embed/W1pNjxmNHNQ";
  final double videoAspectRatio = 1.78;
  UniqueKey webViewKey = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      padding: blockPadding(context),
      child: ResponsiveRowColumn(
        layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            columnOrder: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: primaryLight,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text("INSIGHTS",
                        style: bodyTextStyle.copyWith(
                            fontSize: 11,
                            color: primary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.9)),
                  ),
                  const SizedBox(height: 14),
                  const Text("Apprenez avec nos Experts",
                      style: headlineTextStyle),
                  const SizedBox(height: 10),
                  Container(
                      width: 32,
                      height: 2,
                      color: primary,
                      margin: const EdgeInsets.only(bottom: 18)),
                  Text(
                    "Nous partageons ouvertement notre savoir-faire "
                    "à travers des vidéos, guides et études de cas "
                    "concrets. Rejoignez notre communauté et montez en "
                    "compétence sur les technologies qui font tourner "
                    "les meilleurs produits digitaux.",
                    style: bodyTextStyle.copyWith(height: 1.7),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () =>
                        openUrl("https://www.youtube.com/flutterdev"),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Accéder à nos ressources",
                              style: bodyTextStyle.copyWith(
                                  color: primary,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 6),
                          const Icon(Icons.arrow_forward,
                              color: primary, size: 14),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 2,
            columnOrder: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: AspectRatio(
                aspectRatio: videoAspectRatio,
                child: (kIsWeb || Platform.isAndroid || Platform.isIOS)
                    ? WebViewWidget(
                        key: webViewKey,
                        controller: WebViewController()
                          ..loadRequest(Uri.parse(videoUrl)),
                      )
                    : Image.asset(
                        "assets/images/video_thumbnail_learn_from_developers.png",
                        fit: BoxFit.contain)
                // TODO: Legacy WebView on Web workarounds.
//                HtmlElementView(
//                        key: webViewKey,
//                        viewType: webViewKey.toString(),
//                      )
                ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhoUsesFlutter extends StatelessWidget {
  const WhoUsesFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      padding: blockPadding(context),
      child: ResponsiveRowColumn(
        layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 5,
            columnOrder: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 24, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: primaryLight,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text("PARTENAIRES",
                        style: bodyTextStyle.copyWith(
                            fontSize: 11,
                            color: primary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.9)),
                  ),
                  const SizedBox(height: 14),
                  const Text("Ils nous font confiance",
                      style: headlineTextStyle),
                  const SizedBox(height: 10),
                  Container(
                      width: 32,
                      height: 2,
                      color: primary,
                      margin: const EdgeInsets.only(bottom: 18)),
                  Text(
                    "Des startups en hyper-croissance aux groupes "
                    "établis, nos clients partagent un point commun : "
                    "ils ont choisi une technologie solide et un partenaire "
                    "qui comprend leurs enjeux métier. Rejoignez-les.",
                    style: bodyTextStyle.copyWith(height: 1.7),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => {},
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Voir nos success stories",
                              style: bodyTextStyle.copyWith(
                                  color: primary,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 6),
                          const Icon(Icons.arrow_forward,
                              color: primary, size: 14),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
              rowFlex: 7,
              columnOrder: 1,
              child: Image.asset("assets/images/companies_using_flutter.png",
                  fit: BoxFit.contain)),
        ],
      ),
    );
  }
}

class FlutterNewsRow extends StatelessWidget {
  const FlutterNewsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: blockMargin,
      child: Column(
        children: [
          // ── Section header ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 5),
                  decoration: BoxDecoration(
                    color: primaryLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("ACTUALITÉS",
                      style: bodyTextStyle.copyWith(
                          fontSize: 11,
                          color: primary,
                          letterSpacing: 1.4,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 14),
                const Text("Restez informés",
                    style: headlineSecondaryTextStyle,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          ResponsiveRowColumn(
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            rowSpacing: 25,
            columnSpacing: 32,
            children: const [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: FlutterNewsCard(
              category: "Innovation",
              date: "Déc. 2019",
              title: "Flutter 1.12 : le pari du multi-plateforme tenu",
              imagePath: "assets/images/news_flutter_1.12.png",
              linkUrl:
                  "https://developers.googleblog.com/2019/12/flutter-ui-ambient-computing.html",
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: FlutterNewsCard(
              category: "Écosystème",
              date: "Jan. 2020",
              title: "CodePen intègre Flutter dans son playground",
              imagePath: "assets/images/news_flutter_codepen.png",
              linkUrl:
                  "https://medium.com/flutter/announcing-codepen-support-for-flutter-bb346406fe50",
            ),
          ),
        ],
          ),
        ],
      ),
    );
  }
}

class FlutterNewsCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String linkUrl;
  final String category;
  final String date;

  const FlutterNewsCard(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.linkUrl,
      this.category = "Actualité",
      this.date = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with overlay category tag
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8)),
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 260),
                  width: double.infinity,
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 12,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(category,
                      style: bodyTextStyle.copyWith(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (date.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(date,
                        style: bodyTextStyle.copyWith(
                            fontSize: 12,
                            color: const Color(0xFF9EA4A9))),
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(title,
                      style: headlineSecondaryTextStyle.copyWith(
                          fontSize: 20)),
                ),
                Container(
                    width: 28,
                    height: 2,
                    color: primary,
                    margin: const EdgeInsets.only(bottom: 16)),
                GestureDetector(
                  onTap: () => openUrl(linkUrl),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Lire l'article",
                            style: bodyTextStyle.copyWith(
                                color: primary,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 6),
                        const Icon(Icons.arrow_forward,
                            color: primary, size: 14),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FlutterCodelab extends StatefulWidget {
  const FlutterCodelab({super.key});

  @override
  State<FlutterCodelab> createState() => _FlutterCodelabState();
}

class _FlutterCodelabState extends State<FlutterCodelab>
    with AutomaticKeepAliveClientMixin<FlutterCodelab> {
  static List<String> codelabIds = ["Spinning Flutter", "Fibonacci", "Counter"];
  static List<String> codelabUrls = [
    "https://dartpad.dev/embed-flutter.html?id=c0450ca427127acfb710a31c99761f1a",
    "https://dartpad.dev/embed-flutter.html?id=38311b87e4b3c76329812077c82323b4",
    "https://dartpad.dev/embed-flutter.html?id=7b5710b344431457753253625a596158"
  ];
  String codelabSelected = codelabIds[0];
  String codelabUrlSelected = codelabUrls[0];
  final double videoAspectRatio = 1.75;

  late Map<String, Widget> codelabExamples;
  UniqueKey webViewKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    codelabExamples = <String, Widget>{
      codelabIds[0]: getCupertinoSelectionWidget(codelabIds[0]),
      codelabIds[1]: getCupertinoSelectionWidget(codelabIds[1]),
      codelabIds[2]: getCupertinoSelectionWidget(codelabIds[2]),
    };
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: blockMargin,
      padding: blockPadding(context),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text("Try Flutter in your browser",
                    style: headlineTextStyle),
              ),
              CupertinoSlidingSegmentedControl(
                groupValue: codelabSelected,
                onValueChanged: (dynamic value) => setCodelabSelected(value),
                children: codelabExamples,
              ),
              RepaintBoundary(
                key: webViewKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                  child: AspectRatio(
                    aspectRatio: videoAspectRatio,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFD3D3D3), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(0)),
                      ),
                      child: WebViewWidget(
                        key: webViewKey,
                        controller: WebViewController()
                          ..loadRequest(Uri.parse(codelabUrlSelected)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: RichText(
                  text: TextSpan(
                    style: headlineSecondaryTextStyle,
                    children: [
                      const TextSpan(text: "Want more practice? "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl("https://flutter.dev/codelabs");
                            },
                          text: "Try a codelab",
                          style: headlineSecondaryTextStyle.copyWith(
                              color: primary)),
                      const TextSpan(text: ".")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void setCodelabSelected(String codelab) {
    codelabSelected = codelab;
    codelabUrlSelected = codelabUrls[codelabIds.indexOf(codelab)];
    setState(() {});
  }

  Widget getCupertinoSelectionWidget(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(text, style: bodyTextStyle),
    );
  }
}

class InstallFlutter extends StatelessWidget {
  const InstallFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          // Dark background differentiates this conversion-CTA block.
          color: const Color(0xFF0D1B2A),
          borderRadius: BorderRadius.circular(4)),
      margin: blockMargin,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 64),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 780),
          child: Column(
            children: [
              // ── Eyebrow ─────────────────────────────────────────────────
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primary.withOpacity(0.4)),
                ),
                child: Text("PRÊT À DÉCOLLER ?",
                    style: bodyTextStyle.copyWith(
                        fontSize: 11,
                        color: const Color(0xFF7DC8FD),
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 24),

              // ── Headline ────────────────────────────────────────────────
              Text(
                "Démarrons votre projet ensemble",
                style: headlineTextStyle.copyWith(
                    fontSize: 36, color: Colors.white, height: 1.2),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // ── Sub-headline ─────────────────────────────────────────────
              Text(
                "Un échange de 30 minutes suffit pour poser les bases "
                "de votre prochaine solution digitale. Sans engagement.",
                style: bodyTextStyle.copyWith(
                    fontSize: 17,
                    color: const Color(0xFFB0BEC5),
                    height: 1.7),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // ── CTA row ──────────────────────────────────────────────────
              ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context)
                        .smallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                rowMainAxisAlignment: MainAxisAlignment.center,
                rowSpacing: 16,
                columnSpacing: 12,
                children: [
                  ResponsiveRowColumnItem(
                    child: TextButton(
                      onPressed: () => {},
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all<Color>(primary),
                          overlayColor:
                              WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.hovered)) {
                                return buttonPrimaryDark;
                              }
                              if (states.contains(WidgetState.focused) ||
                                  states.contains(WidgetState.pressed)) {
                                return buttonPrimaryDarkPressed;
                              }
                              return primary;
                            },
                          ),
                          shape: WidgetStateProperty.all(
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(4)))),
                          padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 48)),
                          side: WidgetStateProperty.resolveWith<BorderSide>(
                              (Set<WidgetState> states) {
                            if (states.contains(WidgetState.focused) ||
                                states.contains(WidgetState.pressed)) {
                              return const BorderSide(
                                  width: 3,
                                  color: buttonPrimaryPressedOutline);
                            }
                            return const BorderSide(
                                width: 3, color: Colors.transparent);
                          })),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Prendre rendez-vous",
                              style:
                                  buttonTextStyle.copyWith(fontSize: 17)),
                          const SizedBox(width: 8),
                          const Icon(Icons.calendar_today_outlined,
                              color: Colors.white, size: 16),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: TextButton(
                      onPressed: () => {},
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4))),
                        side: const BorderSide(
                            color: Color(0xFF4A6F8A), width: 1.5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 32),
                      ),
                      child: Text("Voir nos réalisations",
                          style: buttonTextStyle.copyWith(
                              fontSize: 16,
                              color: const Color(0xFFB0BEC5))),
                    ),
                  ),
                ],
              ),

              // ── Trust badges ─────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  "✓ Réponse sous 24 h   ✓ Devis gratuit   ✓ Équipe dédiée",
                  style: bodyTextStyle.copyWith(
                      fontSize: 13,
                      color: const Color(0xFF607D8B),
                      height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Container(
      color: backgroundDark,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: logo + nav links
          ResponsiveRowColumn(
            layout: isMobile
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand block
              ResponsiveRowColumnItem(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/images/logo.svg",
                      height: 48,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Transformez vos idées en solutions digitales.",
                      style: bodyTextStyle.copyWith(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.55),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Social icons row
                    Row(
                      children: [
                        Tooltip(
                          message: "Notre chaîne YouTube",
                          child: InkWell(
                            onTap: () {
                              openUrl("https://www.youtube.com/@regisse");
                            },
                            borderRadius: BorderRadius.circular(6),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                "assets/images/icon_youtube_64x.png",
                                height: 24,
                                width: 24,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Nav links block
              ResponsiveRowColumnItem(
                child: Padding(
                  padding: EdgeInsets.only(top: isMobile ? 32 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LIENS UTILES",
                        style: bodyTextStyle.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: primary,
                          letterSpacing: 1.4,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _FooterLink(label: "Services", onTap: () {}),
                      const SizedBox(height: 10),
                      _FooterLink(
                          label: "Conditions Générales d’Utilisation",
                          onTap: () {}),
                      const SizedBox(height: 10),
                      _FooterLink(label: "Sécurité", onTap: () {}),
                      const SizedBox(height: 10),
                      _FooterLink(
                          label: "Confidentialité", onTap: () {}),
                    ],
                  ),
                ),
              ),
              // Contact block
              ResponsiveRowColumnItem(
                child: Padding(
                  padding: EdgeInsets.only(top: isMobile ? 32 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CONTACT",
                        style: bodyTextStyle.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: primary,
                          letterSpacing: 1.4,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Berlin · Paris · Télétravail",
                        style: bodyTextStyle.copyWith(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.65),
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          openUrl("mailto:contact@regisse.de");
                        },
                        child: Text(
                          "contact@regisse.de",
                          style: bodyTextStyle.copyWith(
                            fontSize: 13,
                            color: primary,
                            decoration: TextDecoration.underline,
                            decorationColor: primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Divider
          const SizedBox(height: 40),
          Divider(color: Colors.white.withOpacity(0.10), thickness: 1),
          const SizedBox(height: 20),
          // Bottom bar: copyright
          Text(
            "© ${DateTime.now().year} Regisse__ GmbH. Tous droits réservés.",
            style: bodyTextStyle.copyWith(
              fontSize: 12,
              color: Colors.white.withOpacity(0.40),
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Text(
        label,
        style: bodyTextStyle.copyWith(
          fontSize: 13,
          color: Colors.white.withOpacity(0.65),
        ),
      ),
    );
  }
}
