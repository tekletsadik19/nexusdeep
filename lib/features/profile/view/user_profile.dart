import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import 'package:nexusdeep/features/profile/widget/profile_card.dart';
import 'package:nexusdeep/features/profile/widget/setting_body.dart';
import 'package:nexusdeep/features/profile/widget/user_contents.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UserProfileCard(),
            const UserContents(),
            const SettingBody(),
            // Logout User
            _buildFooter(context)
          ],
        ),
      ),
    );
  }


  Widget _buildFooter(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 20,
            start: 20,
          ),
          child: Text(
            'Exit',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    16, 0, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Align(
                          alignment:
                          AlignmentDirectional.centerStart,
                          child: Icon(
                            IconlyLight.logout,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 20),
                          child: Text(
                            'Log Out',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}

