import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';

class DealComponent extends StatelessWidget {
  const DealComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 8, 12),
        child: Container(
          width: 237,
          height: 255,
          decoration: BoxDecoration(
            color: context.theme.canvasColor,
            boxShadow: const [
              BoxShadow(
                blurRadius: 7,
                color: Color(0x2F1D2429),
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(9, 9, 9, 12),
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 0, 12, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textScaler:
                                MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Institute:  ',
                                      style: TextStyle(
                                        color: context.theme.colorScheme.secondaryContainer,

                                      ),
                                    ),
                                    TextSpan(
                                      text: 'CBE',
                                      style: TextStyle(
                                        color: context.theme.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                const Divider(
                  height: 2,
                  thickness: 1,
                  color: Color(0xFFE5E7EB),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}