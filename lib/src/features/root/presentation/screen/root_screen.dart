import 'package:barbershop/barbershop.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

class RootScreen extends ScreenView<RootBloC> {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder<String>(
            stream: bloc.streamOf(),
            builder: (_, snapshot) {
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
