import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

class AuthenticationInjector extends Injector {
  @override
  void dependencies() {
    /// Mapper
    put(
      BarbershopCredentialMapper(),
    );

    /// Datasources
    put<AuthenticationStore<BarbershopCredentialModel>>(
      AuthenticationRemoteImpl(
        mapper: find(),
      ),
    );

    /// Repositories
    put<AuthenticationRepository<BarbershopCredentialModel>>(
      AuthenticationRepositoryImpl<BarbershopCredentialModel>(
        remote: find(),
      ),
    );

    lazyPut(
      () => AuthenticationBloC(
        repository: find(),
        sessionRepository: find(),
      ),
      fenix: true,
    );
  }
}
