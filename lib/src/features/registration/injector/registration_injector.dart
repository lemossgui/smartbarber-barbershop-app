import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

class BarbershopRegistrationInjector extends Injector {
  @override
  void dependencies() {
    /// BloC
    lazyPut<EmailVerificationBloC>(
      () => BarbershopEmailVerificationBloC(
        repository: find(),
      ),
    );
  }
}
