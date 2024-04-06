import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/core/common/app/animations/slide_fade_switcher.dart';
import 'package:nexusdeep/core/common/widgets/custom_button.dart';
import 'package:nexusdeep/core/common/widgets/custom_form_field.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';

class SignupWithEmailScreen extends StatefulWidget {
  const SignupWithEmailScreen({super.key});

  static const routeName = '/signup-with-email';
  @override
  State<SignupWithEmailScreen> createState() => _SignupWithEmailScreenState();
}

class _SignupWithEmailScreenState extends State<SignupWithEmailScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final inviteKeyController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumController.dispose();
    inviteKeyController.dispose();
    nameController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up With Email',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        toolbarHeight: 90,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 140, 30, 0),
            child: Column(
              children: [
                Form(
                  key:formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        textInputType: TextInputType.emailAddress,
                        hintText: 'Email',
                        validator: (value) {},
                        controller: emailController,
                        maxLength: 32,
                        borderRadius: 10,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.emailAddress,
                        hintText: 'Public username',
                        validator: (value) {},
                        controller: emailController,
                        maxLength: 32,
                        borderRadius: 10,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.visiblePassword,
                        isPassword: true,
                        hintText: 'Password',
                        controller: passwordController,
                        maxLines: 1,
                        onChange: (email) {},
                        maxLength: 25,
                        borderRadius: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FFCustomButton(
                        text: 'Sign Up',
                        options: FFButtonOptions(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 18,
                          ),
                          width: context.width * .9,
                          color: context.theme.primaryColor,
                          elevation: .05,
                          iconPadding:  EdgeInsetsDirectional.zero,
                          textStyle: GoogleFonts.montserrat(
                            color: context.theme.canvasColor,
                            fontSize: 16,
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
                ),

                const SizedBox(
                  height: 20,
                ),
                Text(
                  "By joining, you agree to Nexus-Deep's",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SlideFadeSwitcher(
                    child: Text(
                      'Terms of Service',
                      key: const ValueKey('terms-of-service'),
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
