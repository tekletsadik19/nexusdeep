import 'package:nexusdeep/core/enum/user/user_role.dart';
import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/auth/domain/entities/user.dart';

class LocalUserModel extends LocalUser {
  const LocalUserModel({
    required super.email,
    required super.uid,
    required super.username,
    super.role,
    super.phoneNumber,
    super.country,
    super.city,
    super.address,
    super.emailVerified,
    super.createdAt,
    super.updatedAt,
    super.profilePic,
    super.investmentType,
    super.isTwoFactorEnabled,
  });

  LocalUserModel.fromMap(DataMap map)
      : super(
      uid: map['uid'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      profilePic: map['profilePic'] as String,
      role: map['role'] as UserRole,
      address: map['address'] as String,
      country: map['country'] as String,
      city: map['city'] as String,
      investmentType: map['investmentType'] as String,
      isTwoFactorEnabled: map['isTwoFactorEnabled'] as bool,
      updatedAt: map['updatedAt'] as DateTime,
      createdAt: map['createdAt'] as DateTime,
      emailVerified: map['emailVerified'] as DateTime,
  );



  LocalUserModel copyWith({
    String? uid,
    String? username,
    String? email,
    String? phoneNumber,
    String? profilePic,
    UserRole? role,
    String? address,
    String? country,
    String? city,
    String? investmentType,
    bool? isTwoFactorEnabled,
    DateTime? updatedAt,
    DateTime? createdAt,
    DateTime? emailVerified,
  }) {
    return LocalUserModel(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePic: profilePic ?? this.profilePic,
      role: role ?? this.role,
      address: address ?? this.address,
      country: country ?? this.country,
      city: city ?? this.city,
      investmentType: investmentType ?? this.investmentType,
      isTwoFactorEnabled: isTwoFactorEnabled ?? this.isTwoFactorEnabled,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      emailVerified: emailVerified ?? this.emailVerified,
    );
  }

  DataMap toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePic': profilePic,
      'role': role,
      'address': address,
      'country': country,
      'city': city,
      'investmentType': investmentType,
      'isTwoFactorEnabled': isTwoFactorEnabled,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
      'emailVerified': emailVerified,
    };
  }
}
