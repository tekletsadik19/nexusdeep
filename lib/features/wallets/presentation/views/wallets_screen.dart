import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:nexusdeep/core/common/widgets/custom_button.dart';
import 'package:nexusdeep/core/common/widgets/custom_icon_button.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';

class WalletsScreen extends StatefulWidget {
  const WalletsScreen({super.key});

  @override
  State<WalletsScreen> createState() => _WalletsScreenState();
}

class _WalletsScreenState extends State<WalletsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.cardColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 100, 30, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Balance',
                            style: GoogleFonts.plusJakartaSans(
                              color: const Color(0xFF606A85),
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            r'$7,630',
                            style: GoogleFonts.outfit(
                              fontSize: 32,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]),
                    Align(
                      alignment: const Alignment(0, .15),
                      child: FFCustomButton(
                        text: 'transaction',
                        options: FFButtonOptions(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          width: context.width * .45,
                          color: context.theme!.primaryColor,
                          elevation: .2,
                          textStyle: GoogleFonts.outfit(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(40, 20, 40, 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              icon: Icon(
                                IconlyLight.arrow_up,
                                size: 30,
                                color: context.theme.colorScheme.primaryContainer,
                              ),
                              trailing: Text(
                                'Send',
                                style: GoogleFonts.plusJakartaSans(
                                  color: const Color(0xFF606A85),
                                  fontSize: 14,

                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              icon: Icon(
                                IconlyLight.arrow_down,
                                size: 30,
                                color: context.theme.colorScheme.primaryContainer,
                              ),
                              trailing: Text(
                                'Receive',
                                style: GoogleFonts.plusJakartaSans(
                                  color: const Color(0xFF606A85),
                                  fontSize: 14,

                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                    const Divider(
                      thickness: .4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              icon: Icon(
                                IconlyLight.scan,
                                size: 30,
                                color: context.theme.colorScheme.primaryContainer,
                              ),
                              trailing: Text(
                                'Scan',
                                style: GoogleFonts.plusJakartaSans(
                                  color: const Color(0xFF606A85),
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              icon: Icon(
                                IconlyLight.star,
                                size: 30,
                                color: context.theme.colorScheme.primaryContainer,
                              ),
                              trailing: Text(
                                'Stake',
                                style: GoogleFonts.plusJakartaSans(
                                  color: const Color(0xFF606A85),
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
