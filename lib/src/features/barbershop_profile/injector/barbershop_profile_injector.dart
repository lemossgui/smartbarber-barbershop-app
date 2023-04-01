import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

class BarbershopProfileInjector extends Injector {
  @override
  void dependencies() {
    lazyPut(
      () => BarbershopProfileBloC(
        sessionRepository: find(),
      ),
    );
  }
}
