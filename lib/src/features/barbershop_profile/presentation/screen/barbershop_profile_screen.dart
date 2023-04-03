import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class BarbershopProfileScreen extends ScreenView<BarbershopProfileBloC> {
  const BarbershopProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text('Barberaria'),
        actions: [
          IconButton(
            onPressed: () {
              bloc.dispatchEvent(Logout());
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
    );
  }
}
