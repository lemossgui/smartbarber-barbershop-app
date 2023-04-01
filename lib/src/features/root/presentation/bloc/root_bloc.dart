import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

class RootBloC extends BloC<RootEvent> {
  static const route = '/';

  final SessionRepository sessionRepository;

  RootBloC({
    required this.sessionRepository,
  });

  @override
  void onReady() async {
    await _checkSession();
    super.onReady();
  }

  Future<void> _checkSession() async {
    final isLogged = await sessionRepository.isLogged;

    if (isLogged) {
      popAndToNamed(HomeBloC.route);
    } else {
      popAndToNamed(AuthenticationBloC.route);
    }
  }

  @override
  void handleEvent(RootEvent event) {}
}
