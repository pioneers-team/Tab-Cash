import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tab_cash/core/constants/app_images.dart';
import 'package:tab_cash/view/drawer/widgets/drawer_item.dart';
import 'package:tab_cash/view/home/home_screen.dart';

import '../../config/routes/routes.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28.0,
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(height:12.0,),
                  Flexible(
                    child:  Text('Ahmed Saide',
                      style: GoogleFonts.poppins(
                        color: Colors.black
                      ),),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1,),
            const DrawerItem(
              label: 'Home',
              iconData: IconlyLight.home,
              screenName: Routes.homeScreen,
            ),
            const DrawerItem(
              label: 'Dashboard',
              iconData: IconlyLight.category,
              screenName: '',
            ),
            const DrawerItem(
              label: 'Tracking',
              iconData: Icons.stacked_bar_chart_outlined,

            ),
            const DrawerItem(
              label: 'Favorites',
              iconData: Icons.favorite_border_outlined,

            ),
            const DrawerItem(
              label: 'Languages',
              iconData: Icons.language,
            ),
            const DrawerItem(
              label: 'Contact Us',
              iconData: IconlyLight.message,

            ),
            const DrawerItem(
              label: 'Settings',
              iconData: IconlyLight.setting,

            ),
            const DrawerItem(
              label: 'Log out',
              iconData: IconlyLight.logout,

            ),


          ],
        ),
      ),
    );
  }
}
