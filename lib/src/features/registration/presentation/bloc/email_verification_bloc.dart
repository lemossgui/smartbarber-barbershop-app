import 'package:core/core.dart';

class BarbershopEmailVerificationBloC extends EmailVerificationBloC {
  BarbershopEmailVerificationBloC({
    required super.repository,
  });

  @override
  void onContinueToTheNextRegistrationStep(AccessModel model) {
    showSuccess('ok');
  }
}
