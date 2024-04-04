import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/core/common/app/animations/slide_fade_switcher.dart';
import 'package:nexusdeep/core/common/widgets/custom_button.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:nexusdeep/core/res/media_res.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const routeName = '/sign-up';
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children:[

          Form(
            key: formKey,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
                      child: Column(
                        children: [
                          Text(
                            'Join Nexus-Deep',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Experience the Future of Diaspora Investment – Sign Up Now!',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FFCustomButton(
                          text: 'Google',
                          icon: IconButton(
                            icon: SvgPicture.asset(
                              MediaRes.googleVector,
                              width: 30,
                            ), onPressed: () {  },
                          ),
                          options: FFButtonOptions(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            width: context.width * .4,
                            color: context.theme.colorScheme.onBackground,
                            elevation: .1,
                            textStyle: GoogleFonts.montserrat(
                              color: context.theme.colorScheme.secondary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {

                          },
                        ),
                        FFCustomButton(
                          text: 'Facebook',
                          icon: IconButton(
                            icon: SvgPicture.asset(
                              MediaRes.facebookVector,
                              width: 30,
                            ),
                            onPressed: () {  },
                          ),
                          options: FFButtonOptions(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            width: context.width * .4,
                            color: context.theme.colorScheme.onBackground,
                            elevation: .1,
                            textStyle: GoogleFonts.montserrat(
                              color: context.theme.colorScheme.secondary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {

                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: GestureDetector(
              onTap: () {},
              child: SlideFadeSwitcher(
                child: Text(
                  'Already have account? sign in',
                  key: const ValueKey('sign up'),
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: context.theme!.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
