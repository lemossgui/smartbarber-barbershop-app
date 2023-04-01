import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

class BarbershopCredentialMapper
    extends AbstractMapper<BarbershopCredentialModel> {
  @override
  BarbershopCredentialModel fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap(BarbershopCredentialModel model) {
    return <String, dynamic>{
      'email': model.email,
      'password': model.password,
    };
  }
}
