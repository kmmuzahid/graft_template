import 'package:auto_route/annotations.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:graft/graft.dart';
import 'package:graft_template/config/color/app_color.dart';
import 'package:graft_template/features/auth/widgets/app_screen_layout.dart';
import 'package:graft_template/features/dashboard/graft/dashboard_graft.dart';
import 'package:material_ui/material_ui.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final dashboard = context.use(DashboardGraft.new);

    return AppScreenLayout(
      appBar: CkAppBar(
        title: 'Dashboard & Metrics',
        appbarConfig: CkAppBarConfig(
          actions: [
            dashboard.compute(
              compute: (s) => s.notifications,
              builder: (count) => Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: IconButton(
                  tooltip: 'Derived compute: $count notifications',
                  icon: Badge(
                    label: Text('$count'),
                    backgroundColor: colors.ratingPremiumTags_goldAccent,
                    textColor: Colors.black,
                    child: Icon(Icons.notifications_outlined, color: colors.tEXT_white),
                  ),
                  onPressed: dashboard.incrementNotifications,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Explanation card
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: colors.bACKGROUND_darkCard,
                borderRadius: BorderRadius.circular(16.w),
                border: Border.all(
                  color: colors.ratingPremiumTags_goldAccent.withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bolt, color: colors.ratingPremiumTags_goldAccent, size: 24.w),
                      8.width,
                      CkText(
                        text: 'Derived Computations (graft.compute)',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        textColor: colors.tEXT_white,
                      ),
                    ],
                  ),
                  8.height,
                  CkText(
                    text:
                        'Widgets wrapped with graft.compute evaluate selectors on state change, rebuilding ONLY when the derived value changes.',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: colors.tEXT_subDark,
                  ),
                ],
              ),
            ),
            20.height,

            // Completion Progress Card
            Container(
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: colors.bACKGROUND_darkCard,
                borderRadius: BorderRadius.circular(14.w),
                border: Border.all(color: colors.bACKGROUND_darkCardBoarder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CkText(
                        text: 'Task Completion Rate',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: colors.tEXT_white,
                      ),
                      dashboard.compute(
                        compute: (s) => '${(s.completionRatio * 100).toInt()}%',
                        builder: (pctText) => CkText(
                          text: pctText,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          textColor: colors.ratingPremiumTags_goldAccent,
                        ),
                      ),
                    ],
                  ),
                  12.height,
                  dashboard.compute(
                    compute: (s) => s.completionRatio,
                    builder: (ratio) => LinearProgressIndicator(
                      value: ratio,
                      backgroundColor: Colors.white10,
                      valueColor: AlwaysStoppedAnimation(colors.ratingPremiumTags_goldAccent),
                      minHeight: 8.h,
                      borderRadius: BorderRadius.circular(4.w),
                    ),
                  ),
                  12.height,
                  dashboard.slot(
                    builder: (s) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CkText(
                          text: 'Completed: ${s.completedTasks} / ${s.totalTasks}',
                          fontSize: 12,
                          textColor: colors.tEXT_subDark,
                        ),
                        if (s.isSyncing)
                          Row(
                            children: [
                              SizedBox(
                                width: 12.w,
                                height: 12.h,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: colors.ratingPremiumTags_goldAccent,
                                ),
                              ),
                              6.width,
                              CkText(text: 'Syncing...', fontSize: 11, textColor: colors.tEXT_subDark),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            20.height,

            // Quick Actions Wrap
            CkText(
              text: 'Micro-State Actions',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              textColor: colors.tEXT_white,
            ),
            12.height,
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: [
                CkButton(
                  titleText: 'Complete +1 Task',
                  buttonColor: colors.ratingPremiumTags_goldAccent,
                  titleColor: Colors.black,
                  buttonRadius: 10.w,
                  onTap: dashboard.completeNextTask,
                ),
                CkButton(
                  titleText: 'Notify +1',
                  buttonColor: colors.bACKGROUND_darkCard,
                  titleColor: colors.tEXT_white,
                  buttonRadius: 10.w,
                  onTap: dashboard.incrementNotifications,
                ),
                CkButton(
                  titleText: 'Sync Data',
                  buttonColor: colors.pRIMARY_brandClr,
                  titleColor: colors.tEXT_white,
                  buttonRadius: 10.w,
                  onTap: dashboard.syncData,
                ),
                CkButton(
                  titleText: 'Reset',
                  buttonColor: colors.sTATUS_error.withValues(alpha: 0.2),
                  titleColor: colors.sTATUS_error,
                  buttonRadius: 10.w,
                  onTap: dashboard.resetMetrics,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
