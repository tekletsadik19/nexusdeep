import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:nexusdeep/core/common/app/animations/slide_fade_switcher.dart';
import 'package:nexusdeep/core/common/widgets/custom_form_field.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:nexusdeep/features/search/presentation/widget/deal_component.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode searchFocusNode = FocusNode();
  bool isSearchFocused = false;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(() {
      setState(() {
        isSearchFocused = searchFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.cardColor,
      body: Column(
        children: [
          if (isSearchFocused)
            buildSearchListContent()
          else
            buildExploreContent(),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: SizedBox(
                    width: context.width * .9,
                    height: 65,
                    child: CustomTextFormField(
                      textInputType: TextInputType.name,
                      controller: _searchController,
                      hintText: 'Search',
                      focusNode: searchFocusNode,
                      validator: (value) {
                        return null;
                      },
                      maxLength: 30,
                      maxLines: 1,
                      borderRadius: 10,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(10, 5, 20, 5),
                      prefixIcon: const Icon(
                        IconlyLight.search,
                        size: 22,
                      ),
                      onSubmitted: (value) {},
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

  Widget buildExploreContent() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Projects',
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0,
                          4,
                          0,
                          8,
                        ),
                        child: Text(
                          'The latest tutorials posted by your team.',
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
                Container(
                  width: double.infinity,
                  height: 255,
                  decoration: BoxDecoration(
                    color: context.theme.canvasColor,
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return DealComponent();
                    },
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Featured Listing',
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 8),
                        child: Text(
                          'The latest tutorials posted by your team.',
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
                Container(
                  width: double.infinity,
                  height: 255,
                  decoration: BoxDecoration(
                    color: context.theme.canvasColor,
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return DealComponent();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchListContent() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
