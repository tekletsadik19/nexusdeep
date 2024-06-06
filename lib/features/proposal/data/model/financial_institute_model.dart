import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/proposal/domain/entity/fianancial_institute.dart';

class FinancialInstituteModel extends FinancialInstitute {
  const FinancialInstituteModel({
    required super.id,
    required super.name,
    super.address,
    super.phoneNumber,
    super.email,
    super.website,
    super.createdAt,
    super.updatedAt,
  });

  FinancialInstituteModel.fromMap(DataMap map)
      : super(
          id: map['_id'] as String,
          name: map['name'] as String,
          address: map['address'] as String?,
          phoneNumber: map['phoneNumber'] as String?,
          email: map['email'] as String?,
          website: map['website'] as String?,
          createdAt: map['createdAt'] != null
              ? DateTime.parse(map['createdAt'] as String)
              : null,
          updatedAt: map['updatedAt'] != null
              ? DateTime.parse(map['updatedAt'] as String)
              : null,
        );

  FinancialInstituteModel copyWith({
    String? id,
    String? name,
    String? address,
    String? phoneNumber,
    String? email,
    String? website,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FinancialInstituteModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      website: website ?? this.website,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  DataMap toMap() {
    return {
      '_id': id,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'email': email,
      'website': website,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
