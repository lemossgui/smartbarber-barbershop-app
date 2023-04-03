import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:barbershop/barbershop.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

class AccessScreen extends ScreenView<AccessBloC> {
  const AccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: getBasePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildImage(context),
            _buildTitle(context),
            _buildEmailField(),
            _buildPasswordField(),
            _buildAccessButton(context),
            _buildDivider(context),
            _buildRegisterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Image(
      height: 200.0,
      width: 200.0,
      image: Svg(
        'assets/images/barber.svg',
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'SmartBarber',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Barbearia',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Expanded(child: Divider()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: MyTextFormField(
        stream: bloc.streamOf<String?>(
          key: AccessStreams.email,
        ),
        onChanged: (value) => bloc.dispatch<String?>(
          value,
          key: AccessStreams.email,
        ),
        hintText: 'E-mail',
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: MyPasswordField(
        stream: bloc.streamOf<String?>(
          key: AccessStreams.password,
        ),
        onChanged: (value) => bloc.dispatch<String?>(
          value,
          key: AccessStreams.password,
        ),
        visibilityStream: bloc.streamOf<bool?>(
          key: AccessStreams.isPasswordVisible,
        ),
        onVisibilityChanged: (value) => bloc.dispatch<bool?>(
          value,
          key: AccessStreams.isPasswordVisible,
        ),
        hintText: 'Senha',
      ),
    );
  }

  Widget _buildAccessButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: MyElevatedButton(
        text: 'Acessar',
        color: Theme.of(context).colorScheme.primaryContainer,
        textColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onPressed: () => bloc.dispatchEvent(Authenticate()),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'ou',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return MyElevatedButton(
      text: 'Cadastrar',
      color: Theme.of(context).colorScheme.tertiaryContainer,
      textColor: Theme.of(context).colorScheme.onTertiaryContainer,
      onPressed: () => bloc.dispatchEvent(NavigateToRegister()),
    );
  }
}
