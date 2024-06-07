import 'package:equatable/equatable.dart';

class FinancialInstitute extends Equatable {
  const FinancialInstitute({
    required this.id,
    required this.name,
    this.address,
    this.phoneNumber,
    this.email,
    this.website,
    this.bio,
    this.minCreditScore,
    this.image,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deals,
  });

  final String id;
  final String name;
  final String? address;
  final String? phoneNumber;
  final String? email;
  final String? website;
  final String? bio;
  final int? minCreditScore;
  final String? image;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? deals;

  @override
  String toString() {
    return 'FinancialInstitute{id: $id, name: $name, email: $email, phoneNumber: $phoneNumber}';
  }

  @override
  List<Object?> get props =>
      [id, name, address, phoneNumber, email, website, createdAt, updatedAt];
}
