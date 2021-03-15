import 'dart:convert';

class EnterpriseModel {
  final int id;
  final String enterpriseName;
  final String description;
  final String photo;

  const EnterpriseModel({
    this.id = 0,
    this.enterpriseName = '',
    this.description = '',
    this.photo = '',
  });

  factory EnterpriseModel.fromMap(Map<String, dynamic>? json) {
    if (json == null) return EnterpriseModel();

    var types = json['types']
            ?.map<String>((e) => e['type']['name'] as String)
            ?.toList() ??
        <String>[];

    return EnterpriseModel(
      id: json['id'] ?? 0,
      enterpriseName: json['enterprise_name'] ?? '',
      description: json['description'] ?? '',
      photo: json['photo'] ?? '',
    );
  }

  factory EnterpriseModel.fromJson(String source) =>
      EnterpriseModel.fromMap(json.decode(source));
}
