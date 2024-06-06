import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:nexusdeep/core/common/widgets/custom_button.dart';
import 'package:nexusdeep/core/common/widgets/custom_icon_button.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.cardColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 40, 10, 10),
              child: Container(
                width: 500,
                constraints: const BoxConstraints(
                  maxWidth: 570,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.theme.cardColor.withOpacity(1),
                      context.theme.cardColor.withOpacity(.9),
                    ],
                    stops: const [0, 1],
                    begin: const AlignmentDirectional(0.94, -1),
                    end: const AlignmentDirectional(-0.94, 1),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 8),
                              child: Text(
                                'Account Overview',
                                style: GoogleFonts.outfit(
                                  fontSize: 22,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Your Credit Score',
                                          style: GoogleFonts.plusJakartaSans(
                                            color: const Color(0xFF606A85),
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          r'200',
                                          style: GoogleFonts.outfit(
                                            fontSize: 32,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ]),
                                  Align(
                                    alignment: const Alignment(0, .15),
                                    child: Row(
                                      children: [
                                        CustomIconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.rocket,
                                            size: 80,
                                            color: context.theme.primaryColor,
                                          ),
                                          onPressed: () {
                                            context.go('/create-profile');
                                          },
                                        ),
                                      ],
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 12, 0, 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Monthly Goal',
                                          style: GoogleFonts.plusJakartaSans(
                                            color: const Color(0xFF606A85),
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: '10% /',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: ' 10000',
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  color:
                                                      const Color(0xFF606A85),
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                            style: GoogleFonts.outfit(
                                              color: const Color(0xFF15161E),
                                              fontSize: 32,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 8, 0, 0),
                                          child: LinearPercentIndicator(
                                            percent: 0.62,
                                            width: 330,
                                            lineHeight: 12,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: context
                                                .theme.primaryColor
                                                .withOpacity(.9),
                                            backgroundColor: context
                                                .theme.primaryColor
                                                .withOpacity(.3),
                                            barRadius:
                                                const Radius.circular(16),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ],
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 12, 0, 0),
                              child: Text(
                                'Top Financial Institutes',
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
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              const SizedBox(width: 16),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 12),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0x4C39D2C0),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFF39D2C0),
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 8, 0, 0),
                                      child: Text(
                                        'Rudy Fernandez',
                                        style: GoogleFonts.plusJakartaSans(
                                          color: const Color(0xFF15161E),
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Manager',
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
                              const SizedBox(width: 12),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 12),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0x4C39D2C0),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFF39D2C0),
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1506863530036-1efeddceb993?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2ZpbGUlMjB1c2VyfGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60',
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 8, 0, 0),
                                      child: Text(
                                        'Abigail Herrara',
                                        style: GoogleFonts.plusJakartaSans(
                                          color: const Color(0xFF15161E),
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Designer',
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
                              const SizedBox(width: 12),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 12),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0x4C39D2C0),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFF39D2C0),
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1505033575518-a36ea2ef75ae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZSUyMHVzZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 8, 0, 0),
                                      child: Text(
                                        'Liz Ambridge',
                                        style: GoogleFonts.plusJakartaSans(
                                          color: const Color(0xFF15161E),
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Manager',
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
                              const SizedBox(width: 12),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 12),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0x4C39D2C0),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFF39D2C0),
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHx1c2VyfGVufDB8fHx8MTY5MTY0Mzg1OXww&ixlib=rb-4.0.3&q=80&w=400',
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 8, 0, 0),
                                      child: Text(
                                        'Liz Rogers',
                                        style: GoogleFonts.plusJakartaSans(
                                          color: const Color(0xFF15161E),
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Front End Dev',
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
                              const SizedBox(width: 16)
                            ]),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 40, 10, 10),
              child: Container(
                width: 500,
                constraints: const BoxConstraints(
                  maxWidth: 570,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                            text: 'Institute: ',
                                            style: TextStyle(
                                              color: context
                                                  .theme.colorScheme.onTertiary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'CBE',
                                            style: TextStyle(
                                              color: context.theme.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
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
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                color:
                                    context.theme.primaryColor.withOpacity(.2),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: context.theme.primaryColor
                                      .withOpacity(.7),
                                  width: 2,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional.center,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: Text(
                                    'In Progress',
                                    style: GoogleFonts.plusJakartaSans(
                                      color: context.theme.primaryColor,
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
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
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                        child: Text(
                          'Marketing Campaign',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.outfit(
                            color: const Color(0xFF15161E),
                            fontSize: 22,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                        child: Text(
                          'Plan and execute a comprehensive marketing campaign to promote a new product launch. Coordinate with the marketing team to outline campaign strategies, allocate resources, and set clear targets for lead generation and conversion rates. ',
                          style: GoogleFonts.plusJakartaSans(
                            color: const Color(0xFF606A85),
                            fontSize: 14,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: context.theme.primaryColor
                                        .withOpacity(.2),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: context.theme.primaryColor
                                          .withOpacity(.7),
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CircularPercentIndicator(
                              percent: 0.33,
                              radius: 24,
                              lineWidth: 4,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  context.theme.primaryColor.withOpacity(.9),
                              backgroundColor:
                                  context.theme.primaryColor.withOpacity(.2),
                              center: Text(
                                '1/3',
                                style: GoogleFonts.plusJakartaSans(
                                  color: const Color(0xFF15161E),
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
