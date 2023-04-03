import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

class BarbershopProfileBloC extends BloC<BarbershopProfileEvent> {
  static const route = '/barbershop-profile';

  final SessionRepository sessionRepository;

  BarbershopProfileBloC({
    required this.sessionRepository,
  });

  @override
  void handleEvent(BarbershopProfileEvent event) {
    if (event is Logout) {
      _logout();
    }
  }

  void _logout() async {
    final result = await dialog(
      const ConfirmationDialog(message: 'Deseja realmente sair?'),
    );

    if (result == true) {
      await sessionRepository.clear();
      offAllNamed(RootBloC.route);
    }
  }
}
