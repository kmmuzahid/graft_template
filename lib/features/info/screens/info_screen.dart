import 'package:auto_route/annotations.dart';
import 'package:core_kit/core_kit_internal.dart';
import 'package:graft/graft.dart';
import 'package:graft_template/features/info/graft/info_graft.dart';
import 'package:material_ui/material_ui.dart';

@RoutePage()
class InfoScreen extends StatelessWidget {
  final InfoType type;
  const InfoScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final infoGraft = context.use(InfoGraft.new)..getInfo(type);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CkAppBar(
        title: type == InfoType.privacyPolicy
            ? 'Privacy Policy'
            : 'Terms and Conditions',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: infoGraft.slot(
          builder: (s) {
            if (s.isLoading) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return CkText(text: s.content);
          },
        ),
      ),
    );
  }
}
