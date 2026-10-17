import 'package:auto_route/annotations.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:graft/graft.dart';
import 'package:graft_template/config/color/app_color.dart';
import 'package:graft_template/features/auth/widgets/app_screen_layout.dart';
import 'package:graft_template/features/splash/graft/splash_graft.dart';
import 'package:material_ui/material_ui.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final splashGraft = context.create(SplashGraft.new)..init();

    return AppScreenLayout(
      useSafeArea: false,
      padding: EdgeInsets.zero,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stylized premium brand logo
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: colors.bACKGROUND_darkCard,
                shape: BoxShape.circle,
                border: Border.all(
                  color: colors.ratingPremiumTags_goldAccent,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colors.ratingPremiumTags_goldAccent.withValues(
                      alpha: 0.2,
                    ),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                Icons.auto_awesome,
                size: 60.w,
                color: colors.ratingPremiumTags_goldAccent,
              ),
            ),
            40.height,
            // App Name
            CkText(
              text: 'GRAFT TEMPLATE',
              fontSize: 28,
              fontWeight: FontWeight.w800,
              textColor: colors.tEXT_white,
              gradient: LinearGradient(
                colors: [
                  colors.tEXT_white,
                  colors.ratingPremiumTags_goldAccent,
                ],
              ),
            ),
            8.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: CkText(
                text:
                    'A modern, high-performance Flutter starter template powered by Graft state management with selective micro-rebuilds and route-scoped lifecycle.',
                fontSize: 13,
                isDescription: true,
                fontWeight: FontWeight.w400,
                textColor: colors.tEXT_subDark,
              ),
            ),
            60.height,
            splashGraft.slot(
              builder: (s) {
                if (!s.isLoading) {
                  return const SizedBox.shrink();
                }
                return SizedBox(
                  width: 32.w,
                  height: 32.h,
                  child: CircularProgressIndicator(
                    color: colors.ratingPremiumTags_goldAccent,
                    strokeWidth: 2.5,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
