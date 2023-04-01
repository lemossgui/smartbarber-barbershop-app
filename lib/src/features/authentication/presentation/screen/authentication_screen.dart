import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:barbershop/barbershop.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

class AuthenticationScreen extends ScreenView<AuthenticationBloC> {
  const AuthenticationScreen({Key? key}) : super(key: key);

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

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: StreamTextField(
        stream: bloc.streamOf<String?>(
          key: AuthenticationStreams.email,
        ),
        onChanged: (value) => bloc.dispatch<String?>(
          value,
          key: AuthenticationStreams.email,
        ),
        hintText: 'E-mail',
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamPasswordField(
        textStream: bloc.streamOf<String?>(
          key: AuthenticationStreams.password,
        ),
        onTextChanged: (value) => bloc.dispatch<String?>(
          value,
          key: AuthenticationStreams.password,
        ),
        visibilityStream: bloc.streamOf<bool?>(
          key: AuthenticationStreams.isPasswordVisible,
        ),
        onVisibilityChanged: (value) => bloc.dispatch<bool?>(
          value,
          key: AuthenticationStreams.isPasswordVisible,
        ),
        hintText: 'Senha',
      ),
    );
  }

  Widget _buildAccessButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: ElevatedPersistentButton(
        bloc: bloc,
        text: 'Acessar',
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
    return ElevatedPersistentButton(
      bloc: bloc,
      text: 'Cadastrar',
      color: Theme.of(context).colorScheme.tertiary,
      textColor: Theme.of(context).colorScheme.onTertiary,
      onPressed: () => bloc.dispatchEvent(NavigateToRegister()),
    );
  }
}
