import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nexusdeep/core/common/widgets/custom_form_field.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.cardColor,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
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
                    onSubmitted: (value) {

                    },
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
