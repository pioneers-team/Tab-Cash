import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/components/custom_button.dart';
import '../../core/constants/app_images.dart';
import '../../core/styles/colors.dart';


class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title:  Text('Transfer',
            style: GoogleFonts.poppins(
                letterSpacing: 0.6,
                fontSize: 24.0,
                color:Colors.black,
                fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.arrow_back_ios,),
          ),
          actions:  [IconButton(
              onPressed: (){

              },
              icon:const Icon( Icons.notifications_none_outlined,size: 25.0))],
        ),
        body: Column(
          children: [
            const SizedBox(height: 16.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(' Add amount',style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.0
                  ),),
                  const SizedBox(height: 16.0,),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: '                          00,000,00 ',
                        hintStyle: const TextStyle(
                            color: Color(0xFF808080)
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(color: Color(0xFFB2AFAF))
                        ) ,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: const BorderSide(color: Color(0xFFB2AFAF))
                        )
                    ),
                  ),
                  const SizedBox(height: 16.0,),
                  Text(' Enter password',style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.0
                  ),),
                  const SizedBox(height: 16.0,),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Color(0xFFB2AFAF))
                      ) ,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: const BorderSide(color: Color(0xFFB2AFAF))
                      ),
                    ),
                  ),
                  const SizedBox(height: 48.0,),
                ],
              ),
            ),
            customButton(
                context,
                color: AppColors.secondColor,
                label: 'Send',
                onTap: ()async{
                  await  showOtpMessage(context);
                }
            ),
          ],
        ),
      ),
    );
  }
  Future<dynamic> showOtpMessage(BuildContext context) {
    return showDialog(context: context, builder: (context) =>AlertDialog(
      backgroundColor: Colors.white,
      content: Container(

        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.alertTransfer),
            const SizedBox(height: 16.0,),
            Row(
              children: [
                const CircleAvatar(
                  radius: 12.0,
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.check,color: Colors.white,),
                ),
                const SizedBox(width: 8.0,),
                Text('Amount sent successfuly',style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,


                ),)
              ],
            )
          ],
        ),
      ),
    ) ,);
  }

}
