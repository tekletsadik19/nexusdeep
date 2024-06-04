import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:nexusdeep/core/common/widgets/custom_button.dart';
import 'package:nexusdeep/core/common/widgets/custom_tab_bar_button.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:nexusdeep/features/acquisition/presentation/widget/acquisition_bottom_modal.dart';

class AcquisitionScreen extends StatefulWidget {
  const AcquisitionScreen({super.key});

  @override
  State<AcquisitionScreen> createState() => _AcquisitionScreenState();
}

class _AcquisitionScreenState extends State<AcquisitionScreen>
    with TickerProviderStateMixin {
  TabController? tabBarController;
  String listingHeaderText = 'Approved';
  String offersHeaderText = 'Active';
  Color colorContentData = Colors.green;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState() {
    super.initState();

    tabBarController = TabController(
      vsync: this,
      length: 3,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabBarController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.cardColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomButtonTabBar(
                      labelStyle: GoogleFonts.plusJakartaSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: GoogleFonts.plusJakartaSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      labelColor: context.theme.colorScheme.primaryContainer,
                      unselectedLabelColor:
                          context.theme.colorScheme.primaryContainer,
                      backgroundColor: context
                          .theme.colorScheme.tertiaryContainer
                          .withOpacity(.7),
                      borderRadius: 20,
                      labelPadding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                      tabs: const [
                        Tab(
                          text: 'Listings',
                        ),
                        Tab(
                          text: 'Offers',
                        ),
                        Tab(
                          text: 'Escrows',
                        ),
                      ],
                      controller: tabBarController,
                    ),
                  ),
                  Divider(
                    color: context.theme.primaryColor,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabBarController,
                      children: [
                        SizedBox(
                          width: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: FFCustomButton(
                                  text: listingHeaderText,
                                  iconData: IconlyLight.arrow_down_2,
                                  onPressed: () {
                                    showModalBottomSheet<Widget>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AcquisitionBottomModal(
                                          children: [
                                            buildListTile(
                                              title: 'Approved',
                                              callBackAction: () => {},
                                              icon: IconlyLight.tick_square,
                                            ),
                                            buildListTile(
                                              title: 'Requested',
                                              callBackAction: () => {},
                                              icon: IconlyLight.time_square,
                                            ),
                                            buildListTile(
                                              title: 'Denied',
                                              callBackAction: () {
                                                setState(() {
                                                  colorContentData = context
                                                      .theme.colorScheme.error;
                                                });
                                              },
                                              icon: IconlyLight.close_square,
                                              colorContent: context
                                                  .theme.colorScheme.error,
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  options: FFButtonOptions(
                                    elevation: 0,
                                    width: 180,
                                    height: 50,
                                    iconSize: 28,
                                    iconColor: colorContentData,
                                    color: colorContentData.withOpacity(.1),
                                    iconPadding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    borderRadius: BorderRadius.circular(20),
                                    splashColor:
                                        colorContentData.withOpacity(.1),
                                    textStyle: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: colorContentData,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: FFCustomButton(
                                  text: offersHeaderText,

                                  iconData: IconlyLight.arrow_down_2,
                                  onPressed: () {
                                    showModalBottomSheet<Widget>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AcquisitionBottomModal(
                                          children: [
                                            buildListTile(
                                              title: 'Active',
                                              callBackAction: () => {},
                                              icon: IconlyLight.tick_square,
                                            ),
                                            buildListTile(
                                                title: 'Inactive',
                                                callBackAction: () {
                                                  setState(() {
                                                    offersHeaderText = 'Inactive';
                                                    colorContentData = context
                                                        .theme
                                                        .colorScheme
                                                        .error;
                                                  });
                                                },
                                                icon: IconlyLight.close_square,
                                                colorContent: context
                                                    .theme.colorScheme.error),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  options: FFButtonOptions(
                                    elevation: 0,
                                    width: 180,
                                    height: 50,
                                    color: colorContentData.withOpacity(.1),
                                    iconSize: 28,
                                    iconColor: colorContentData,
                                    iconPadding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    borderRadius: BorderRadius.circular(20),
                                    splashColor:
                                        colorContentData.withOpacity(.1),
                                    textStyle: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: colorContentData,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 400,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile({
    required String title,
    required Function callBackAction,
    Color? colorContent,
    IconData? icon,
  }) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: InkWell(
        onTap: () {
          setState(() {
            offersHeaderText = tabBarCurrentIndex == 1? title:offersHeaderText;
            listingHeaderText = tabBarCurrentIndex == 0? title:listingHeaderText;
            colorContentData = colorContent ?? context.theme.primaryColor;
          });
          callBackAction();
        },
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    if (icon != null)
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Icon(
                          icon,
                          color: colorContent ?? Colors.blueGrey,
                          size: 30,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        title,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: colorContent ?? context.theme.primaryColor,
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
    );
  }
}
