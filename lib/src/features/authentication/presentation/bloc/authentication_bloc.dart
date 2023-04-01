import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';

enum AuthenticationStreams {
  email,
  password,
  isPasswordVisible,
}

class AuthenticationBloC extends BloC<AuthenticationEvent>
    with RequiredStringStreamValidator {
  static const route = '/authentication';

  final AuthenticationRepository<BarbershopCredentialModel> repository;
  final SessionRepository sessionRepository;

  AuthenticationBloC({
    required this.repository,
    required this.sessionRepository,
  });

  @override
  void onInit() {
    _dispatchEmail('guilherme@gmail.com');
    _dispatchPassword('123456');
    _setupRequiredFields();
    super.onInit();
  }

  String? get _email => map[AuthenticationStreams.email];
  String? get _password => map[AuthenticationStreams.password];

  void _dispatchEmail(String? value) {
    dispatch<String?>(value, key: AuthenticationStreams.email);
  }

  void _dispatchPassword(String? value) {
    dispatch<String?>(value, key: AuthenticationStreams.password);
  }

  void _setupRequiredFields() {
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: AuthenticationStreams.email,
    );
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: AuthenticationStreams.password,
    );
  }

  @override
  void handleEvent(AuthenticationEvent event) {
    if (event is Authenticate) {
      _doLogin();
    } else if (event is NavigateToRegister) {
      _navigateToRegister();
    }
  }

  bool get _credentialsIsValid {
    final isValid = _email.hasValue && _password.hasValue;

    if (!isValid) {
      _dispatchEmail(_email);
      _dispatchPassword(_password);
      showError('Preencha todos os campos');
    }

    return isValid;
  }

  void _doLogin() async {
    if (!_credentialsIsValid) {
      return;
    }

    final credentials = BarbershopCredentialModel(
      email: _email!,
      password: _password!,
    );

    showLoadingDialog(
      action: repository.authenticate(credentials),
      onComplete: (result) {
        result.map(_handleLoginSuccess).mapError(handleFailure);
      },
    );
  }

  void _handleLoginSuccess(String token) async {
    await saveSession(token);
    popAndToNamed(RootBloC.route);
  }

  Future<void> saveSession(String token) async {
    SessionModel session = SessionModel(token: token);
    final result = await sessionRepository.save(session);
    result.mapError(handleFailure);
    return;
  }

  void _navigateToRegister() async {
    await dialog(LoadingDialog(message: 'Aguarde'));
  }
}
