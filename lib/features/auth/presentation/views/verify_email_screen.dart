import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/core/common/app/animations/slide_fade_switcher.dart';
import 'package:nexusdeep/core/common/widgets/custom_button.dart';
import 'package:nexusdeep/core/common/widgets/custom_form_field.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:nexusdeep/core/utils/core_utils.dart';
import 'package:nexusdeep/core/utils/custom_snackbar.dart';
import 'package:nexusdeep/features/auth/presentation/bloc/auth_bloc.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    super.key,
    this.email,
    this.name,
    this.password,
    this.token,
  });
  final String? email;
  final String? name;
  final String? password;
  final String? token;

  static const routeName = '/verify-email';
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Timer? _timer;
  int _start = 90;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);

    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is AuthError) {
            const messageTitle = 'Auth Error';
            CoreUtils.showSnackBar(
              context,
              ContentType.failure,
              state.message,
              messageTitle,
            );
          } else if (state is EmailVerifiedState) {

          } else if (state is SignedInState) {
            // context.userProvider.initUser(state.user as LocalUserModel);
            // context.go('/');
          }
        },
        builder: (BuildContext context, state) {
          return SingleChildScrollView(
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
                            height: context.height * .06,
                          ),
                          Text(
                            'Enter the code sent to \n${widget.email ?? 'your email'}',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomTextFormField(
                            textInputType: TextInputType.number,
                            hintText: 'Enter the code you recieved',
                            validator: (value) {},
                            controller: codeController,
                            maxLength: 4,
                            borderRadius: 10,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_start == 0) {
                                startTimer();
                                if (widget.name != null &&
                                    widget.email != null &&
                                    widget.password != null) {
                                  context.read<AuthBloc>().add(
                                        SignUpEvent(
                                          name: widget.name!,
                                          email: widget.email!.trim(),
                                          password: widget.password!,
                                        ),
                                      );
                                  setState(() {
                                    _start = 90;
                                  });

                                }
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 4,
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  _start > 0
                                      ? 'Resend code in ${CoreUtils.formatDuration(
                                          _start,
                                        )}'
                                      : 'Resend code',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: context.theme.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
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
                                  textStyle: const TextStyle(
                                    fontSize: 16,
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
                                            fontWeight: FontWeight.w500),
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
                              if (formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      VerifyEmailEvent(
                                        code: codeController.value.text,
                                        token: widget.token!,
                                      ),
                                    );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
