import 'package:ioasys_flutter2_triple/app/modules/home/domain/entities/response/enterprises.dart';

class EnterpriseVM {
  List<EnterpriseEntityDomain> enterprises = <EnterpriseEntityDomain>[];
  String filter = '';
  List<EnterpriseEntityDomain> get enterpriseFiltered => enterprises
      .where(
          (e) => e.enterpriseName.toUpperCase().contains(filter.toUpperCase()))
      .toList();

  EnterpriseVM({
    List<EnterpriseEntityDomain>? enterprises,
    String? filter,
  }) {
    this.enterprises = enterprises ?? <EnterpriseEntityDomain>[];
    this.filter = filter ?? '';
  }

  EnterpriseVM copyWith({
    List<EnterpriseEntityDomain>? enterprises,
    String? filter,
  }) {
    return EnterpriseVM(
      enterprises: enterprises ?? this.enterprises,
      filter: filter ?? this.filter,
    );
  }
}
