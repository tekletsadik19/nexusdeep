import 'package:cached_network_image/cached_network_image.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/core/common/widgets/custom_button.dart';
import 'package:nexusdeep/core/common/widgets/custom_tab_bar_button.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:nexusdeep/core/utils/constants.dart';

class ScanUserIdScreen extends StatefulWidget {
  const ScanUserIdScreen({super.key});
  static const routeName = 'scan-user-id-screen';
  @override
  State<ScanUserIdScreen> createState() => _ScanUserIdScreenState();
}

class _ScanUserIdScreenState extends State<ScanUserIdScreen>
    with TickerProviderStateMixin {
  String? selectedType;
  List<String> _pictures = [];

  final unFocusNode = FocusNode();
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState() {
    super.initState();

    tabBarController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void dispose() {
    super.dispose();
    unFocusNode.dispose();
    tabBarController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text(
          'Scan Your Digital ID/Passport',
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomButtonTabBar(
                    labelStyle: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelStyle: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    labelColor: context.theme.cardColor,
                    unselectedLabelColor: context.theme.colorScheme.secondary,
                    backgroundColor: context.theme.primaryColor,
                    borderRadius: 12,
                    labelPadding:
                        const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                    tabs: const [
                      Tab(
                        text: 'Digital ID',
                      ),
                      Tab(
                        text: 'Passport',
                      ),
                    ],
                    controller: tabBarController,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabBarController,
                    children: [
                      SizedBox(
                        width: 500,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                0,
                                15,
                                0,
                                0,
                              ),
                              child: CachedNetworkImage(
                                placeholder: (context, url) => Image.network(
                                  kFaydaDemo,
                                  width: context.height * .6,
                                  height: context.height * .6,
                                ),
                                errorWidget: (context, url, error) =>
                                    Container(),
                                fit: BoxFit.cover,
                                imageUrl: kFaydaDemo,
                                imageBuilder: (context, imageProvider) {
                                  return Image.network(
                                    kFaydaDemo,
                                    width: context.height * .6,
                                    height: context.height * .6,
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, .15),
                              child: FFCustomButton(
                                text: 'Scan ID',
                                options: FFButtonOptions(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 18,
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
                                onPressed: ()async {
                                  List<String> pictures;
                                  try {
                                    pictures =
                                        await CunningDocumentScanner.getPictures(
                                          noOfPages: 2,
                                        ) ??
                                            [];
                                    if (!mounted) return;
                                    setState(() {
                                      _pictures = pictures;
                                    });
                                  } catch (exception) {
                                    // Handle exception here
                                  }
                                  setState(() => selectedType = 'Digital ID');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0,
                          0,
                          0,
                          1,
                        ),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              placeholder: (context, url) => Image.network(
                                kPassportDemo,
                                width: context.height * .6,
                                height: context.height * .6,
                              ),
                              errorWidget: (context, url, error) => Container(),
                              fit: BoxFit.cover,
                              imageUrl: kPassportDemo,
                              imageBuilder: (context, imageProvider) {
                                return Image.network(
                                  kPassportDemo,
                                  width: context.height * .6,
                                  height: context.height * .6,
                                );
                              },
                            ),
                            Align(
                              alignment: const Alignment(0, .15),
                              child: FFCustomButton(
                                text: 'Scan Passport',
                                options: FFButtonOptions(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 18,
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
                                onPressed: ()async {
                                  List<String> pictures;
                                  try {
                                    pictures =
                                        await CunningDocumentScanner.getPictures(
                                          noOfPages: 1,
                                        ) ??
                                            [];
                                    if (!mounted) return;
                                    setState(() {
                                      _pictures = pictures;
                                    });
                                  } catch (exception) {
                                    // Handle exception here
                                  }
                                  setState(() => selectedType = 'Passport');
                                },
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
        ],
      ),
    );
  }
}
