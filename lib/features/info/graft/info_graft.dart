import 'package:get_it/get_it.dart';
import 'package:graft/graft.dart';
import 'package:graft_template/features/info/repository/info_repository.dart';
import 'info_state.dart';

export 'info_state.dart';

class InfoGraft extends Graft<InfoState> {
  InfoGraft() : super(InfoState());

  Future<void> getInfo(InfoType type) async {
    state
      ..isLoading = true
      ..update();

    final repo = GetIt.I<InfoRepository>();
    final result = type == InfoType.privacyPolicy
        ? await repo.getPrivacyPolicy()
        : await repo.getTermsAndConditions();

    state
      ..isLoading = false
      ..content = result.data
      ..update();
  }
}
