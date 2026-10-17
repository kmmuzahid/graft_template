import 'package:auto_route/annotations.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:graft/graft.dart';
import 'package:graft_template/config/color/app_color.dart';
import 'package:graft_template/features/auth/widgets/app_screen_layout.dart';
import 'package:graft_template/features/security/graft/security_graft.dart';
import 'package:material_ui/material_ui.dart';

@RoutePage()
class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final security = context.use(SecurityGraft.new);
    final counter = context.use(LiveCounterGraft.new);

    return AppScreenLayout(
      appBar: const CkAppBar(title: 'Security & Isolation'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: colors.bACKGROUND_darkCard,
                borderRadius: BorderRadius.circular(14.w),
                border: Border.all(color: colors.bACKGROUND_darkCardBoarder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.shield_outlined, color: colors.ratingPremiumTags_goldAccent, size: 24.w),
                      8.width,
                      CkText(
                        text: 'Cross-Graft Isolation',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        textColor: colors.tEXT_white,
                      ),
                    ],
                  ),
                  8.height,
                  CkText(
                    text:
                        'Two completely independent Grafts live on this screen. Mutating SecurityGraft has zero rebuild effect on LiveCounterGraft, and vice-versa.',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: colors.tEXT_subDark,
                  ),
                ],
              ),
            ),
            20.height,

            // Graft 1: Security Session
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: colors.bACKGROUND_darkCard,
                borderRadius: BorderRadius.circular(14.w),
                border: Border.all(color: colors.bACKGROUND_darkCardBoarder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CkText(
                    text: 'Graft 1: Security Preferences',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    textColor: colors.ratingPremiumTags_goldAccent,
                  ),
                  12.height,
                  security.slot(
                    builder: (s) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CkText(text: 'Two-Factor Authentication', fontSize: 13, textColor: colors.tEXT_white),
                            Switch(
                              value: s.twoFactorAuth,
                              activeTrackColor: colors.ratingPremiumTags_goldAccent,
                              onChanged: (_) => security.toggle2FA(),
                            ),
                          ],
                        ),
                        8.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CkText(text: 'Biometric Screen Lock', fontSize: 13, textColor: colors.tEXT_white),
                            Switch(
                              value: s.biometricLock,
                              activeTrackColor: colors.ratingPremiumTags_goldAccent,
                              onChanged: (_) => security.toggleBiometrics(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            20.height,

            // Graft 2: Independent Live Counter
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: colors.bACKGROUND_darkCard,
                borderRadius: BorderRadius.circular(14.w),
                border: Border.all(color: colors.bACKGROUND_darkCardBoarder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CkText(
                    text: 'Graft 2: Independent Live Counter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    textColor: colors.ratingPremiumTags_goldAccent,
                  ),
                  12.height,
                  counter.slot(
                    builder: (s) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CkText(
                          text: 'Counter Value: ${s.count}',
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          textColor: colors.tEXT_white,
                        ),
                        Row(
                          children: [
                            CkButton(
                              titleText: '+1',
                              buttonRadius: 10.w,
                              buttonColor: colors.ratingPremiumTags_goldAccent,
                              titleColor: Colors.black,
                              onTap: counter.increment,
                            ),
                            8.width,
                            CkButton(
                              titleText: 'Reset',
                              buttonRadius: 10.w,
                              buttonColor: Colors.white12,
                              titleColor: colors.tEXT_white,
                              onTap: counter.reset,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
