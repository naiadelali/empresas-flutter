import 'package:ioasys_flutter2_triple/app/modules/home/domain/entities/response/enterprises.dart';

class EnterpriseDetailVM {
  EnterpriseEntityDomain enterprise = EnterpriseEntityDomain();
  int page = 1;
  EnterpriseDetailVM({
    EnterpriseEntityDomain? enterprise,
    int? page,
  }) {
    this.enterprise = enterprise ?? EnterpriseEntityDomain();
    this.page = page ?? 1;
  }

  EnterpriseDetailVM copyWith({
    int? page,
    EnterpriseEntityDomain? enterprise,
  }) {
    return EnterpriseDetailVM(
      page: page ?? this.page,
      enterprise: enterprise ?? this.enterprise,
    );
  }
}
