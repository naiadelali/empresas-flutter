import 'package:ioasys_flutter2_triple/app/modules/home/infra/models/responses/enterprise_model.dart';

abstract class IEnterpriseDatasource {
  Future<List<EnterpriseModel>> get();
}
