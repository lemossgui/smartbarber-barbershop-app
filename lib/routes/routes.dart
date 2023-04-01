import 'package:barbershop/barbershop.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';

Transition get _defaultTransition => Transition.rightToLeftWithFade;
Duration get _defaultTransitionDuration => const Duration(milliseconds: 300);
Curve get _defaultCurve => Curves.fastOutSlowIn;

List<Screen> routes = [
  Screen(
    name: RootBloC.route,
    page: () => const RootScreen(),
    injector: RootInjector(),
  ),
  Screen(
    name: AuthenticationBloC.route,
    page: () => const AuthenticationScreen(),
    injector: AuthenticationInjector(),
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
