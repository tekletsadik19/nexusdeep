import 'package:equatable/equatable.dart';

class Investment extends Equatable {
  const Investment({
    required this.id,
    required this.institutionId,
    required this.institutionName,
    this.institutionLogo,
    required this.title,
    this.contactInfo,
    required this.businessIndustry,
    required this.description,
    required this.returnCurrency,
    required this.investmentAmount,
    required this.initialInvestment,
    this.monthlyPayment,
    this.loanTerm,
    required this.returnTime,
    required this.expireDate,
    required this.collateralRequired,
    required this.interestRate,
    required this.riskLevel,
    required this.sector,
    required this.userId,
    this.supportingDocuments,
    this.businessAssets,
    this.existingDebts,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String institutionId;
  final String institutionName;
  final String? institutionLogo;
  final String title;
  final String? contactInfo;
  final String businessIndustry;
  final String description;
  final String returnCurrency;
  final double investmentAmount;
  final double initialInvestment;
  final double? monthlyPayment;
  final int? loanTerm;
  final DateTime returnTime;
  final DateTime expireDate;
  final bool collateralRequired;
  final double interestRate;
  final String riskLevel;
  final String sector;
  final String userId;
  final List<String>? supportingDocuments;
  final List<String>? businessAssets;
  final List<String>? existingDebts;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
        id,
        institutionId,
        institutionName,
        institutionLogo,
        title,
        contactInfo,
        businessIndustry,
        description,
        returnCurrency,
        investmentAmount,
        initialInvestment,
        monthlyPayment,
        loanTerm,
        returnTime,
        expireDate,
        collateralRequired,
        interestRate,
        riskLevel,
        sector,
        userId,
        supportingDocuments,
        businessAssets,
        existingDebts,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'Investment{id: $id, institutionId: $institutionId, institutionName: $institutionName, title: $title, businessIndustry: $businessIndustry, description: $description, returnCurrency: $returnCurrency, investmentAmount: $investmentAmount, initialInvestment: $initialInvestment, riskLevel: $riskLevel, sector: $sector}';
  }
}
