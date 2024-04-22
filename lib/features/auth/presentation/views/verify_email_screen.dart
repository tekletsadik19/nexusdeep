import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/core/common/app/animations/slide_fade_switcher.dart';
import 'package:nexusdeep/core/common/widgets/custom_button.dart';
import 'package:nexusdeep/core/common/widgets/custom_form_field.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';


class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});
  static const routeName = '/verify-email';
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Form(
              key: formKey,
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter verification code',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: context.height *.06,
                      ),
                      Text(
                        'Enter the code sent to {Email}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.emailAddress,
                        hintText: 'Enter the code you recieved',
                        validator: (value) {},
                        controller: codeController,
                        maxLength: 35,
                        borderRadius: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
        
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 4,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Resend code',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: context.theme.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500

                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'Email address is not correct?',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: context.theme.primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.go('/signup-with-email');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 4,
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Edit',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: context.theme.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      FFCustomButton(
                        text: 'Verify Email',
                        options: FFButtonOptions(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 22,
                          ),
                          width: context.width * .6,
                          color: context.theme.primaryColor,
                          elevation: .2,
                          textStyle: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
        
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
