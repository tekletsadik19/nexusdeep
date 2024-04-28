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

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const routeName = '/dashboard';
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> pages = const [
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  List<String> titles = const [
    'Nexus Deep',
    'Search',
    'Spaces',
    'Activity',
    'Proposals',
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      appBar: (currentIndex == 0 || currentIndex == 4)
          ? CustomAppBar(titles[currentIndex])
          : null,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        currentIndex: currentIndex,
        selectedItemColor: context.theme!.primaryColor.withOpacity(.8),
        unselectedItemColor: Colors.grey.withOpacity(.6),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(IconlyLight.home),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(IconlyLight.search),
          ),
          BottomNavigationBarItem(
            label: 'Spaces',
            icon: Icon(FontAwesomeIcons.satellite),
          ),
          BottomNavigationBarItem(
            label: 'Activity',
            icon: Icon(IconlyLight.notification),
          ),
          BottomNavigationBarItem(
            label: 'Transaction',
            icon: Icon(IconlyLight.bookmark),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      centerTitle: true,
      toolbarHeight: 70,
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Consumer<UserProvider>(
          builder: (context,userProvider,child) {
            final user = userProvider.user;
            return Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 12, 12, 0),
              child: CachedNetworkImage(
                placeholder: (context, url) => CustomProfilePic(
                  imageProvider: const NetworkImage(
                    kDefaultAvatar,
                  ),
                  onClicked: (){},
                  radius: 45,
                ),
                errorWidget: (context, url, error) =>  CustomProfilePic(
                  imageProvider: const NetworkImage(
                    kDefaultAvatar,
                  ),
                  onClicked: (){},
                  radius: 45,
                ),
                fit: BoxFit.cover,
                imageUrl:user?.profilePic??kDefaultAvatar,
                imageBuilder: (context, imageProvider) {
                  return CustomProfilePic(
                    imageProvider: imageProvider,
                    onClicked: ()=>context.go('/profile-screen'),
                    radius: 45,
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
