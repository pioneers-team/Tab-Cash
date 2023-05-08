import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cash/core/constants/app_images.dart';
import 'package:tab_cash/view/drawer/widgets/drawer_item.dart';

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
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Image.asset(AppImages.logo,height: 60,width: 60.0,)),
                  const SizedBox(height:16.0,),
                  Flexible(
                    child:  Text('News App',
                      style: GoogleFonts.lobster(
                          fontSize: 20.0,
                          letterSpacing: 0.6
                      ),),
                  ),
                ],
              ),
            ),
            DrawerItem(
              label: 'Home',
              iconData: Icons.home,
              function: (){

              },
            ),
            DrawerItem(
              label: 'Bookmark',
              iconData: Icons.bookmark,
              function: (){
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context)=>BookMarkScreen()));

              },
            ),
            const Divider(thickness: 2,),


          ],
        ),
      ),
    );
  }
}
