import 'package:equatable/equatable.dart';

class Proposal extends Equatable {
  const Proposal({
    required this.id,
    required this.to,
    required this.title,
    required this.description,
    required this.amount,
    required this.repaymentCurrency,
    this.supportingDocuments,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String to;
  final String title;
  final String description;
  final double amount;
  final String repaymentCurrency;
  final List<String>? supportingDocuments;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
    id,
    to,
    title,
    description,
    amount,
    repaymentCurrency,
    supportingDocuments,
    createdAt,
    updatedAt,
  ];

  @override
  String toString() {
    return 'Proposal{id: $id, to: $to, title: $title, description: $description, amount: $amount, repaymentCurrency: $repaymentCurrency}';
  }
}