import 'package:graft_template/config/dependency/core_dependency.dart';
import 'package:graft_template/config/dependency/dependency_binder.dart';
import 'package:graft_template/config/dependency/real_repository_dependency.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class DependencyInjection {
  void dependencies() {
    CoreDependency.dependencies();

    // Graft dependency binding (singletons & route-scoped controllers)
    DependencyBinder.bind();

    //repositroy
    // MockRepositoryDependency.dependencies();
    RealRepositoryDependency.dependencies();
  }
}
