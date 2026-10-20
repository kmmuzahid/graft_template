import 'package:graft/graft.dart';

export 'package:graft_template/features/info/model/info_model.dart';

class InfoState extends GraftState {
  bool isLoading;
  String content;

  InfoState({this.isLoading = false, this.content = ''});

  @override
  GraftProps get props => propsOf(isLoading, content);
}
