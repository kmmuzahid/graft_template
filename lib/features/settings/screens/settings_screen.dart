import 'package:auto_route/annotations.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:graft/graft.dart';
import 'package:graft_template/config/color/app_color.dart';
import 'package:graft_template/config/theme/toggle_theme.dart';
import 'package:graft_template/features/auth/widgets/app_screen_layout.dart';
import 'package:graft_template/features/settings/graft/profile_graft.dart';
import 'package:material_ui/material_ui.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final profile = context.use(ProfileGraft.new);

    return AppScreenLayout(
      appBar: const CkAppBar(title: 'Settings & Profile'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Theme section
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
                    text: 'App Appearance',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    textColor: colors.tEXT_white,
                  ),
                  12.height,
                  const ToggleTheme(),
                ],
              ),
            ),
            20.height,

            // graft.slots showcase
            CkText(
              text: 'Multi-Child Slot Diffing (graft.slots)',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              textColor: colors.tEXT_white,
            ),
            8.height,
            profile.slots(
              layout: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: slots,
              ),
              slots: (s) => [
                // Slot 0: Const Header (0 rebuilds)
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: colors.ratingPremiumTags_goldAccent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10.w),
                    border: Border.all(color: colors.ratingPremiumTags_goldAccent),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.flash_on, color: colors.ratingPremiumTags_goldAccent, size: 20.w),
                      8.width,
                      Expanded(
                        child: CkText(
                          text: '⚡ Const Header Slot — 0 rebuilds guaranteed',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          textColor: colors.ratingPremiumTags_goldAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                12.height,

                // Slot 1: Name
                Container(
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: colors.bACKGROUND_darkCard,
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(color: colors.bACKGROUND_darkCardBoarder),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person_outline, color: colors.ratingPremiumTags_goldAccent, size: 22.w),
                      12.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CkText(text: 'Full Name', fontSize: 11, textColor: colors.tEXT_subDark),
                            4.height,
                            CkText(text: s.name, fontSize: 13, fontWeight: FontWeight.w600, textColor: colors.tEXT_white),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit_outlined, size: 18),
                        color: colors.ratingPremiumTags_goldAccent,
                        onPressed: () {
                          profile.updateName(s.name == 'Km Muzahid' ? 'Dr. John Doe' : 'Km Muzahid');
                        },
                      ),
                    ],
                  ),
                ),
                12.height,

                // Slot 2: Email
                Container(
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: colors.bACKGROUND_darkCard,
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(color: colors.bACKGROUND_darkCardBoarder),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.alternate_email, color: colors.ratingPremiumTags_goldAccent, size: 22.w),
                      12.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CkText(text: 'Email Address', fontSize: 11, textColor: colors.tEXT_subDark),
                            4.height,
                            CkText(text: s.email, fontSize: 13, fontWeight: FontWeight.w600, textColor: colors.tEXT_white),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                12.height,

                // Slot 3: Verified Badge
                Container(
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: colors.bACKGROUND_darkCard,
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(color: colors.bACKGROUND_darkCardBoarder),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            s.isVerified ? Icons.verified : Icons.error_outline,
                            color: s.isVerified ? Colors.greenAccent : Colors.grey,
                            size: 22.w,
                          ),
                          12.width,
                          CkText(
                            text: s.isVerified ? 'Verified Account' : 'Unverified Account',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            textColor: colors.tEXT_white,
                          ),
                        ],
                      ),
                      Switch(
                        value: s.isVerified,
                        activeTrackColor: colors.ratingPremiumTags_goldAccent,
                        onChanged: (_) => profile.toggleVerified(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
