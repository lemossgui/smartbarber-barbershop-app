import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

class RootInjector extends Injector {
  @override
  void dependencies() {
    lazyPut(
      () => RootBloC(
        sessionRepository: find(),
      ),
      fenix: true,
    );
  }
}
