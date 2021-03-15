import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/infra/data/datasources/enterprise_datasource_interface.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/infra/models/responses/enterprise_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';
// part 'enterprise_datasource.g.dart';

@Injectable()
class EnterpriseDatasource implements IEnterpriseDatasource {
  final DioForNative _client;

  EnterpriseDatasource(this._client);

  @override
  Future<List<EnterpriseModel>> get() async {
    final response = await _client.get("/enterprises");
    final List<EnterpriseModel> listEnterprise = <EnterpriseModel>[];
    if (response.statusCode == 200) {
      final result = EnterpriseModel.fromMap(response.data);

      if (response.data.containsKey("enterprises") &&
          response.data["enterprises"].isNotEmpty) {
        response.data["enterprises"].forEach((e) {
          listEnterprise.add(EnterpriseModel.fromMap(e));
        });
      }

      return listEnterprise;
    } else {
      throw DatasourceError(message: "Falha");
    }
  }
}
