import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

class HomeInjector extends Injector {
  @override
  void dependencies() {
    /// BloC
    lazyPut(
      () => HomeBloC(
        barbershopRepository: find(),
      ),
    );
  }
}
