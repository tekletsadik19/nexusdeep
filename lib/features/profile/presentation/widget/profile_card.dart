import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:nexusdeep/core/common/app/providers/user_provider.dart';
import 'package:nexusdeep/core/common/widgets/custom_profile_pic.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:nexusdeep/core/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class UserProfileCard extends StatefulWidget {
  const UserProfileCard({super.key});

  @override
  State<UserProfileCard> createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.onTertiary,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, top: 25),
                  child: IconButton(
                    icon: const Icon(
                      IconlyBold.notification,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () => context.go('/notification-screen'),
                  ),
                ),
              ),
              Consumer<UserProvider>(
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 32),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional.center,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(
                                          0,
                                          0,
                                          12,
                                          0,
                                        ),
                                        child: CachedNetworkImage(
                                          placeholder: (context, url) =>
                                              CustomProfilePic(
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
                                          imageUrl:
                                              user.profilePic ?? kDefaultAvatar,
                                          imageBuilder:
                                              (context, imageProvider) {
                                            return CustomProfilePic(
                                              imageProvider: imageProvider,
                                              onClicked: () {},
                                              radius: 80,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            child: Text(
                                              user.username,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.plusJakartaSans(
                                                textStyle: const TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .only(
                                                top: 5,
                                                start: 2,
                                              ),
                                              child: Text(
                                                user.email,
                                                style: GoogleFonts.plusJakartaSans(
                                                  textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30 ,right: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.cardColor.withOpacity(.3),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Shimmer.fromColors(
                    baseColor: context.theme.cardColor.withOpacity(.5),
                    highlightColor: context.theme.cardColor.withOpacity(1),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: InkWell(
                            onTap: () {},
                            child: SizedBox(
                              width: double.infinity,
                              height: 35,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.infinity,
                                    color: context.theme.primaryColor,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Boost Your Credit Score',
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: context.theme.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
