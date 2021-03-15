import 'package:ioasys_flutter2_triple/app/shared/helpers/consts.dart'
    as Consts;
class EnterpriseEntityDomain {
  final int id;
  final String enterpriseName;
  final String description;
  final String photo;

  String get urlImage => 'https://empresas.ioasys.com.br/$photo';

  const EnterpriseEntityDomain({
    this.id = 0,
    this.enterpriseName = '',
    this.description = '',
    this.photo = '',
  });
}
