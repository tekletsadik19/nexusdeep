import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:nexusdeep/features/profile/domain/entity/create_profile_page_content.dart';
import 'package:nexusdeep/features/profile/widget/create-profile/create_profile_body.dart';
import 'package:nexusdeep/features/profile/widget/create-profile/create_profile_form.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CreateYourProfileScreen extends StatefulWidget {
  const CreateYourProfileScreen({super.key});

  @override
  State<CreateYourProfileScreen> createState() =>
      _CreateYourProfileScreenState();
}

class _CreateYourProfileScreenState extends State<CreateYourProfileScreen> {
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text(
          'Create Profile',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Divider(
            color: context.theme.primaryColor,
          ),

          PageView(
            controller: _pageController,
            children: const [
              CreateProfileBody(pageContent: CreateProfilePageContent.first()),
              CreateProfileFormBody()
            ],
          ),


        ],
      ),
    );
  }
}

