import 'package:auto_route/annotations.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:graft/graft.dart';
import 'package:graft_template/config/color/app_color.dart';
import 'package:graft_template/features/auth/widgets/app_screen_layout.dart';
import 'package:graft_template/features/tasks/graft/task_catalog_graft.dart';
import 'package:material_ui/material_ui.dart';

@RoutePage()
class TaskCatalogScreen extends StatelessWidget {
  const TaskCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final taskCatalog = context.create(TaskCatalogGraft.new);

    return AppScreenLayout(
      appBar: CkAppBar(
        title: 'Task Catalog (Virtualized)',
        appbarConfig: CkAppBarConfig(
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              child: CkButton(
                titleText: 'Complete All',
                buttonRadius: 16.w,
                buttonColor: colors.ratingPremiumTags_goldAccent.withValues(alpha: 0.2),
                titleColor: colors.ratingPremiumTags_goldAccent,
                titleSize: 11,
                titleWeight: FontWeight.w600,
                onTap: taskCatalog.markAllCompleted,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Banner
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: colors.bACKGROUND_darkCard,
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(color: colors.bACKGROUND_darkCardBoarder),
              ),
              child: Row(
                children: [
                  Icon(Icons.view_list_rounded, color: colors.ratingPremiumTags_goldAccent, size: 28.w),
                  12.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CkText(
                          text: '100% Lazy graft.builder Virtualization',
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          textColor: colors.tEXT_white,
                        ),
                        4.height,
                        CkText(
                          text: 'Toggling any task card rebuilds ONLY that 1 item — 0 rebuilds for siblings!',
                          fontSize: 11,
                          textColor: colors.tEXT_subDark,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Virtualized List with graft.builder
          Expanded(
            child: taskCatalog.builder<TaskItem>(
              items: (s) => s.tasks,
              itemBuilder: (task, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: colors.bACKGROUND_darkCard,
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(
                      color: task.isDone
                          ? colors.ratingPremiumTags_goldAccent.withValues(alpha: 0.3)
                          : colors.bACKGROUND_darkCardBoarder,
                    ),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: task.isDone,
                        activeColor: colors.ratingPremiumTags_goldAccent,
                        checkColor: Colors.black,
                        side: BorderSide(color: colors.tEXT_subDark),
                        onChanged: (_) => taskCatalog.toggleTask(task.id),
                      ),
                      8.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CkText(
                              text: task.title,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              textColor: task.isDone ? colors.tEXT_subDark : colors.tEXT_white,
                            ),
                            4.height,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(6.w),
                              ),
                              child: CkText(
                                text: task.category,
                                fontSize: 10,
                                textColor: colors.tEXT_subDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
