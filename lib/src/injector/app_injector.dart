import 'package:core/core.dart';

class AppInjector extends Injector {
  @override
  void dependencies() {
    CoreInjector().dependencies();
  }
}
