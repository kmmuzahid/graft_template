import 'package:graft_template/config/dependency/core_dependency.dart';
import 'package:graft_template/config/dependency/dependency_binder.dart';
import 'package:graft_template/config/dependency/real_repository_dependency.dart';

class DependencyInjection {
  void dependencies() {
    CoreDependency.dependencies();

    // Register repository services into Graft DI
    RealRepositoryDependency.dependencies();

    // Register Graft singletons, route-scoped controllers, and flow scopes
    DependencyBinder.initialize();
  }
}
