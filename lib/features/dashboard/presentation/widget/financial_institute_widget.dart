import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/features/proposal/domain/entity/fianancial_institute.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class FinancialInstituteWidget extends StatelessWidget {
  final FinancialInstitute financialInstitute;

  const FinancialInstituteWidget({
    Key? key,
    required this.financialInstitute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/proposal-page');
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: financialInstitute.website ?? 'https://example.com/default_image.png',
              imageBuilder: (context, imageProvider) => Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF39D2C0),
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            const SizedBox(height: 4),
            Text(
              financialInstitute.name,
              style: GoogleFonts.plusJakartaSans(
                color: const Color(0xFF15161E),
                fontSize: 14,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              financialInstitute.email ?? 'No email provided',
              style: GoogleFonts.plusJakartaSans(
                color: const Color(0xFF606A85),
                fontSize: 12,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}