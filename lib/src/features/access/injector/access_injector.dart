import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

class AccessInjector extends Injector {
  @override
  void dependencies() {
    /// Mapper
    put(
      AccessMapper(),
    );

    /// Datasources
    put<AccessStore>(
      AccessRemoteImpl(
        mapper: find(),
      ),
    );

    /// Repositories
    put<AccessRepository>(
      AccessRepositoryImpl(
        remote: find(),
      ),
    );

    lazyPut(
      () => AccessBloC(
        repository: find(),
        sessionRepository: find(),
      ),
      fenix: true,
    );
  }
}
