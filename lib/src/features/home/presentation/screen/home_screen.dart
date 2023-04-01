import 'package:barbershop/barbershop.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

class HomeScreen extends ScreenView<HomeBloC> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return MyAppBar(
      title: const Text('SmartBarber'),
      leading: IconButton(
        onPressed: () {
          bloc.dispatchEvent(NavigateToBarbershopProfile());
        },
        icon: const Icon(Icons.store),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }
}
