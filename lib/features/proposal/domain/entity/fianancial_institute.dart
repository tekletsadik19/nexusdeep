import 'package:equatable/equatable.dart';

class FinancialInstitute extends Equatable {
  const FinancialInstitute({
    required this.id,
    required this.name,
    this.address,
    this.phoneNumber,
    this.email,
    this.website,
    this.createdAt,
    this.updatedAt,
  });

  const FinancialInstitute.empty()
      : this(
    id: '',
    name: '',
    address: '',
    phoneNumber: '',
    email: '',
    website: '',
    createdAt: null,
    updatedAt: null,
  );

  final String id;
  final String name;
  final String? address;
  final String? phoneNumber;
  final String? email;
  final String? website;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'FinancialInstitute{id: $id, name: $name, email: $email, phoneNumber: $phoneNumber}';
  }

  @override
  List<Object?> get props =>
      [id, name, address, phoneNumber, email, website, createdAt, updatedAt];
}
