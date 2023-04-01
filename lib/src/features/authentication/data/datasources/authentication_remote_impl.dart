import 'package:barbershop/barbershop.dart';
import 'package:core/core.dart';

class AuthenticationRemoteImpl extends BaseConnector
    implements AuthenticationStore<BarbershopCredentialModel> {
  final BarbershopCredentialMapper mapper;

  AuthenticationRemoteImpl({
    required this.mapper,
  });

  @override
  Future<String> authenticate(BarbershopCredentialModel model) async {
    final body = mapper.toMap(model);
    const endpoint = '/api/v1/public/barbershop-access/authenticate';
    final responseRaw = await post(endpoint, body);
    return getResponseData(responseRaw);
  }
}
