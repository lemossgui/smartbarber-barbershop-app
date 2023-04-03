import 'package:core/core.dart';

class AccessRemoteImpl extends BaseConnector implements AccessStore {
  final AccessMapper mapper;

  AccessRemoteImpl({
    required this.mapper,
  });

  @override
  Future<String> authenticate(AccessModel model) async {
    final body = mapper.toMap(model);
    const endpoint = '/api/v1/public/barbershop-access/authenticate';
    final responseRaw = await post(endpoint, body);
    return getResponseData(responseRaw);
  }
}
