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
    super.bio,
    super.minCreditScore,
    super.image,
    super.userId,
    super.createdAt,
    super.updatedAt,
    super.deals,
  });

  FinancialInstituteModel.fromMap(DataMap map)
      : super(
    id: map['id'] as String? ?? 'default_id',
    name: map['name'] as String? ?? 'default_name',
    address: map['address'] as String?,
    phoneNumber: map['phoneNumber'] as String?,
    email: map['email'] as String?,
    website: map['website'] as String?,
    bio: map['bio'] as String?,
    minCreditScore: map['minCreditScore'] as int?,
    image: map['image'] as String?,
    userId: map['userId'] as String?,
    createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt'] as String) : null,
    updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt'] as String) : null,
    deals: (map['_count'] as Map<String, dynamic>?)?['deals'] as int? ?? 0,
  );

    FinancialInstituteModel copyWith({
    String? id,
    String? name,
    String? address,
    String? phoneNumber,
    String? email,
    String? website,
    String? bio,
    int? minCreditScore,
    String? image,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? deals,
  }) {
    return FinancialInstituteModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      website: website ?? this.website,
      bio: bio ?? this.bio,
      minCreditScore: minCreditScore ?? this.minCreditScore,
      image: image ?? this.image,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deals: deals ?? this.deals,
    );
  }

   DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'email': email,
      'website': website,
      'bio': bio,
      'minCreditScore': minCreditScore,
      'image': image,
      'userId': userId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deals': deals,
    };
  }
}
