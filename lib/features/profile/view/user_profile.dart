import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/core/common/app/providers/user_provider.dart';
import 'package:nexusdeep/core/common/widgets/custom_profile_pic.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:nexusdeep/core/utils/constants.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _buildProfileHeader(),
      ],
    ));
  }

  Widget _buildProfileHeader() {
    return Consumer<UserProvider>(
      builder: (context, ref, child) {
        final userProvider = ref.user;
        if (userProvider != null) {
          final user = userProvider;
          return Align(
            alignment: AlignmentDirectional.topCenter,
            child: SizedBox(
              width: context.width * .9,
              child: Align(
                alignment: AlignmentDirectional.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 50, 12, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    user.username,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      top: 5,
                                      start: 2,
                                    ),
                                    child: Text(
                                      user.email,
                                      style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                0,
                                0,
                                6,
                                0,
                              ),
                              child: CachedNetworkImage(
                                placeholder: (context, url) => CustomProfilePic(
                                  imageProvider: const NetworkImage(
                                    kDefaultAvatar,
                                  ),
                                  onClicked: () {},
                                  radius: 80,
                                ),
                                errorWidget: (context, url, error) =>
                                    CustomProfilePic(
                                  imageProvider: const NetworkImage(
                                    kDefaultAvatar,
                                  ),
                                  onClicked: () {},
                                  radius: 80,
                                ),
                                fit: BoxFit.cover,
                                imageUrl: user.profilePic ?? kDefaultAvatar,
                                imageBuilder: (context, imageProvider) {
                                  return CustomProfilePic(
                                    imageProvider: imageProvider,
                                    onClicked: () {},
                                    radius: 80,
                                  );
                                },
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
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: context.theme.colorScheme.secondary,
            ),
          );
        }
      },
    );
  }
}
