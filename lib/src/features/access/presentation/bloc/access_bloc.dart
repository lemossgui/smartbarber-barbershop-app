import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

enum AccessStreams {
  email,
  password,
  isPasswordVisible,
}

class AccessBloC extends BloC<AccessEvent> with RequiredStringStreamValidator {
  static const route = '/authentication';

  final AccessRepository repository;
  final SessionRepository sessionRepository;

  AccessBloC({
    required this.repository,
    required this.sessionRepository,
  });

  @override
  void onInit() {
    _setupRequiredFields();
    super.onInit();
  }

  String? get _email => map[AccessStreams.email];
  String? get _password => map[AccessStreams.password];

  void _dispatchEmail(String? value) {
    dispatch<String?>(value, key: AccessStreams.email);
  }

  void _dispatchPassword(String? value) {
    dispatch<String?>(value, key: AccessStreams.password);
  }

  void _setupRequiredFields() {
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: AccessStreams.email,
    );
    addTransformOn<String?, String?>(
      requiredStringStreamValidator(),
      key: AccessStreams.password,
    );
  }

  @override
  void handleEvent(AccessEvent event) {
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

    final credentials = AccessModel(
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
    toNamed(EmailVerificationBloC.route);
  }
}
