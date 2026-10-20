import 'package:graft/graft.dart';
import 'package:graft_template/features/info/repository/info_repository.dart';

class RealRepositoryDependency {
  static void dependencies() {
    bind<InfoRepository>(InfoRepository.new);
  }
}
