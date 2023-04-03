import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

List<Screen> routes = [
  Screen(
    name: RootBloC.route,
    page: () => const RootScreen(),
    injector: RootInjector(),
  ),
  Screen(
    name: AccessBloC.route,
    page: () => const AccessScreen(),
    injector: AccessInjector(),
  ),
  Screen(
    name: EmailVerificationBloC.route,
    page: () => EmailVerificationScreen(),
    injector: BarbershopRegistrationInjector(),
  ),
  Screen(
    name: HomeBloC.route,
    page: () => const HomeScreen(),
    injector: HomeInjector(),
  ),
  Screen(
    name: BarbershopProfileBloC.route,
    page: () => const BarbershopProfileScreen(),
    injector: BarbershopProfileInjector(),
  ),
];
