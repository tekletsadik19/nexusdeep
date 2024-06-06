import 'package:nexusdeep/core/utils/typedef.dart';
import 'package:nexusdeep/features/proposal/domain/entity/proposal.dart';

class ProposalModel extends Proposal {
  const ProposalModel({
    required super.id,
    required super.to,
    required super.title,
    required super.description,
    required super.amount,
    required super.repaymentCurrency,
    super.supportingDocuments,
    super.createdAt,
    super.updatedAt,
  });

  ProposalModel.fromMap(DataMap map)
      : super(
    id: map['_id'] as String,
    to: map['to'] as String,
    title: map['title'] as String,
    description: map['description'] as String,
    amount: map['amount'] as double,
    repaymentCurrency: map['repaymentCurrency'] as String,
    supportingDocuments: List<String>.from(map['supportingDocuments'] as List<dynamic>),
    createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt'] as String) : null,
    updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt'] as String) : null,
  );

  ProposalModel copyWith({
    String? id,
    String? to,
    String? title,
    String? description,
    double? amount,
    String? repaymentCurrency,
    List<String>? supportingDocuments,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProposalModel(
      id: id ?? this.id,
      to: to ?? this.to,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      repaymentCurrency: repaymentCurrency ?? this.repaymentCurrency,
      supportingDocuments: supportingDocuments ?? this.supportingDocuments,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  DataMap toMap() {
    return {
      '_id': id,
      'to': to,
      'title': title,
      'description': description,
      'amount': amount,
      'repaymentCurrency': repaymentCurrency,
      'supportingDocuments': supportingDocuments,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}