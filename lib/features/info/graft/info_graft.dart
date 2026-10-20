import 'package:graft/graft.dart';
import 'package:graft_template/features/info/repository/info_repository.dart';
import 'info_state.dart';

export 'info_state.dart';

class InfoGraft extends Graft<InfoState> {
  InfoGraft() : super(InfoState());

  InfoType? _lastLoaded;

  Future<void> getInfo(InfoType type) async {
    if (_lastLoaded == type && !state.isLoading) return;
    _lastLoaded = type;

    state
      ..isLoading = true
      ..update();

    final repo = use<InfoRepository>();
    final result = type == InfoType.privacyPolicy
        ? await repo.getPrivacyPolicy()
        : await repo.getTermsAndConditions();

    if (!isDisposed) {
      state
        ..isLoading = false
        ..content = result.data
        ..update();
    }
  }
}
